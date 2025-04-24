import 'dart:convert' as convert;
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:ptth/android_config.dart';
import 'package:ptth/src/generated/l10n/app_localizations.dart';
import 'package:ptth/utils.dart';
import 'package:sprintf/sprintf.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

import 'firebase_options.dart';

void main() => runApp(WebViewExample());

class WebViewExample extends StatefulWidget {
  const WebViewExample({super.key});

  @override
  State<WebViewExample> createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  late final WebViewController _controller;
  late final DarwinInitializationSettings initializationSettingsDarwin;

  _WebViewExampleState() {
    initializationSettingsDarwin = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
      notificationCategories: darwinNotificationCategories,
    );
  }

  String rootURL = "";
  String returnUrl = "";
  String loadUrl = "";
  String cookie = "";
  String accessToken = "";
  String? initialMessage;
  bool resolved = false;
  String entityid = "";
  String groupId = "";
  String teamId = "";
  String channelId = "";
  String language = 'en';
  bool isLoading = true;
  bool updatedToken = false;
  late PackageInfo packageInfo;
  String iconPath = "";

  final DarwinNotificationDetails darwinNotificationDetails =
      DarwinNotificationDetails(categoryIdentifier: 'textCategory');

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  List<DarwinNotificationCategory> darwinNotificationCategories =
      <DarwinNotificationCategory>[
        DarwinNotificationCategory(
          'textCategory',
          actions: <DarwinNotificationAction>[
            DarwinNotificationAction.text(
              'text_1',
              'Action 1',
              buttonTitle: 'Send',
              placeholder: 'Placeholder',
            ),
          ],
        ),
        DarwinNotificationCategory(
          'textCategory',
          actions: <DarwinNotificationAction>[
            DarwinNotificationAction.plain('id_1', 'Action 1'),
            DarwinNotificationAction.plain(
              'id_2',
              'Action 2 (destructive)',
              options: <DarwinNotificationActionOption>{
                DarwinNotificationActionOption.destructive,
              },
            ),
            DarwinNotificationAction.plain(
              'id_3',
              'Action 3 (foreground)',
              options: <DarwinNotificationActionOption>{
                DarwinNotificationActionOption.foreground,
              },
            ),
            DarwinNotificationAction.plain(
              'id_4',
              'Action 4 (auth required)',
              options: <DarwinNotificationActionOption>{
                DarwinNotificationActionOption.authenticationRequired,
              },
            ),
          ],
          options: <DarwinNotificationCategoryOption>{
            DarwinNotificationCategoryOption.hiddenPreviewShowTitle,
          },
        ),
      ];

  /// Create a [AndroidNotificationChannel] for heads up notifications
  late AndroidNotificationChannel channel;

  bool isFlutterLocalNotificationsInitialized = false;

  Future<void> setupFlutterNotifications() async {
    if (isFlutterLocalNotificationsInitialized) {
      return;
    }
    WidgetsFlutterBinding.ensureInitialized();
    AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(iconPath);

    final InitializationSettings initializationSettings =
        InitializationSettings(
          android: initializationSettingsAndroid,
          iOS: initializationSettingsDarwin,
        );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        handleNotificationClick(response);
      },
    );
    channel = const AndroidNotificationChannel(
      'ptth_channel_id', // id
      'PTTH Notifications', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.high,
    );

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.createNotificationChannel(channel);

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
          sound: true,
        );
    isFlutterLocalNotificationsInitialized = true;
  }

  @pragma('vm:entry-point')
  Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await setupFlutterNotifications();
    showLocalNotification(message);
  }

  void showLocalNotification(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    Map<String, dynamic> data = message.data;
    if (notification != null) {
      String object = Utils.getObject(this.language, notification.titleLocKey!);
      String body = Utils.getBody(this.language, notification.bodyLocKey!);
      List<String> args = notification.bodyLocArgs;
      if (args.isEmpty || args.length < 2 || args[0].isEmpty || args[1].isEmpty)
        return;
      body = sprintf(body, args);
      String id = data["id"];
      String type = data["object"];
      String action = data["action"];
      String url = rootURL + Utils.getUrl(id, type, action);

      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        object,
        body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
          ),
          iOS: darwinNotificationDetails,
        ),
        payload: url,
      );
    }
  }

  void handleNotificationClick(NotificationResponse response) {
    String url = response.payload!;
    _controller.loadRequest(Uri.parse(url));
  }

  void updateToken(String token, String userId) async {
    print("updateToken $token");
    print("updateToken $userId");
    print("updateToken $cookie");
    print("updateToken ${cookie.split("=")[1]}");
    print("updateToken $accessToken");

    if (cookie.isNotEmpty) {
      var url = Uri.parse('$rootURL/api/v2/ups/users/$userId');
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "charset": "utf-8",
        "Cookie": cookie,
        "Authorization": "Bearer $accessToken",
      };
      Map<String, String> body = {"exDeviceID": token};
      print("updateToken ${convert.json.encode(body)}");
      var response = await http.patch(
        url,
        headers: headers,
        body: convert.json.encode(body),
      );
      print("updateToken ${response.statusCode}");
      print("updateToken ${response.body}");
      print('Request updateToken with status: ${response.statusCode}.');
    }
  }

  void getToken() async {
    await FirebaseMessaging.instance.getToken().then(
      (value) => getAccesstoken(value!),
    );
  }

  @pragma('vm:entry-point')
  void setupFirebaseMessaging() async {
    print("setupFirebaseMessaging");
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await setupFlutterNotifications();
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    if (!updatedToken) {
      updatedToken = true;
      if (Platform.isAndroid) {
        await FirebaseMessaging.instance.deleteToken().then(
          (value) async => {getToken()},
        );
      } else {
        FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
        NotificationSettings setting =
            await firebaseMessaging.requestPermission();
        print("setupFirebaseMessaging, setting.authorizationStatus: ${setting.authorizationStatus}");
        String? apnToken = await firebaseMessaging.getAPNSToken() ?? "";
        print("setupFirebaseMessaging, apn token: $apnToken");
        if (apnToken.isNotEmpty) {
         await FirebaseMessaging.instance.deleteToken().then(
               (value) async => {getToken()},
         );
        }
      }
    }
    FirebaseMessaging.onMessage.listen((mes) {
      if (Platform.isAndroid) showLocalNotification(mes);
    });
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        //something
        Map<String, dynamic> data = message.data;
        String id = data["id"];
        String type = data["object"];
        String action = data["action"];
        String url = rootURL + Utils.getUrl(id, type, action);
        _controller.loadRequest(Uri.parse(url));
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      //something
      Map<String, dynamic> data = message.data;
      String id = data["id"];
      String type = data["object"];
      String action = data["action"];
      String url = rootURL + Utils.getUrl(id, type, action);
      _controller.loadRequest(Uri.parse(url));
    });
  }

  void getUserInfo(String token) async {
    print("getUserInfo $token");
    print("getUserInfo $cookie");
    print("getUserInfo $accessToken");
    if (cookie.isNotEmpty) {
      var url = Uri.parse('$rootURL/api/v2/me?\$select=_id');
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Cookie": cookie,
        "Authorization": "Bearer $accessToken",
      };
      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        var jsonResponse =
            convert.jsonDecode(response.body) as Map<String, dynamic>;
        updateToken(token, jsonResponse["_id"]);
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    }
  }

  void getAccesstoken(String token) async {
    if (cookie.isNotEmpty) {
      var url = Uri.parse('$rootURL/accesstoken');
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Accept": "application/json",
        "Cookie": cookie,
      };
      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        var jsonResponse =
            convert.jsonDecode(response.body) as Map<String, dynamic>;
        accessToken = jsonResponse["accessToken"];
        getUserInfo(token);
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    }
  }

  Future<void> requestNotificationPermission() async {
    if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
          flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin
              >();
      final bool? granted =
          await androidImplementation?.requestNotificationsPermission();
      if (granted == true) {
        setupFirebaseMessaging();
      }
    } else {
      final bool? granted = await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin
          >()
          ?.requestPermissions(alert: true, badge: true, sound: true);
      final bool? granted_macOS = await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
            MacOSFlutterLocalNotificationsPlugin
          >()
          ?.requestPermissions(alert: true, badge: true, sound: true);
      if (granted == true || granted_macOS == true) {
        setupFirebaseMessaging();
      }
    }
  }

  void setupView() async {
    packageInfo = await PackageInfo.fromPlatform();
    print("info: " + packageInfo.appName.toLowerCase());
    switch (packageInfo.appName.toLowerCase()) {
      case "epress platform":
        iconPath = "@mipmap/ic_launcher_ptth";
        rootURL = "https://ptth-qa.appvity.com";
        returnUrl = "/app/eHome/home";
        break;
      case "esign":
        iconPath = "@mipmap/ic_launcher_esign";
        rootURL = "https://ptth-qa.appvity.com";
        returnUrl = "/app/eSign/home";
        break;
      case "p2p":
        iconPath = "@mipmap/ic_launcher_p2p";
        rootURL = "https://p2p-qa.appvity.com";
        returnUrl = "/app/eHome/home";
        break;
    }
    loadUrl = "$rootURL/login?returnUrl=$returnUrl";
    Future.delayed(
      Duration(seconds: 30),
      () => setState(() => isLoading = false),
    );
    _controller.loadRequest(Uri.parse(loadUrl));
  }

  void setupWebview() {
    late final WebViewController controller;
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{}
      );
      WebKitWebViewController webKitController = new WebKitWebViewController(params);
      webKitController.setInspectable(true);
      controller = WebViewController.fromPlatform(webKitController);
    } else {
      params = const PlatformWebViewControllerCreationParams();
      controller =
          WebViewController.fromPlatformCreationParams(params);
    }
    // #enddocregion platform_features
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..runJavaScript('document.cookie')
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
          },
          onPageStarted: (String url) {
          },
          onPageFinished: (String url) async {
            print("onPageFinished url: " + url);
            setState(() => isLoading = false);
            String cookies =
                await controller.runJavaScriptReturningResult('document.cookie')
                    as String;
            cookies = cookies.replaceAll("\"", "");
            cookies = cookies.replaceAll("\'", "");
            if (cookies.isNotEmpty &&
                cookie != cookies &&
                cookies.contains("connect.sid")) {
              if (cookies.contains(" connect.sid")) {
                cookie = " connect.sid" + cookies.split(" connect.sid")[1];
              } else {
                cookie = cookies;
              }
              requestNotificationPermission();
            }
            String language =
                await controller.runJavaScriptReturningResult(
                      "javascript:window.localStorage.getItem('language');",
                    )
                    as String;
            if (language.isNotEmpty) {
              setState(() {
                this.language = language.replaceAll("\"", "");
              });
              AndroidConfig.setAndroidLocale(this.language);
            }
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('''
              Page resource error:
                code: ${error.errorCode}
                description: ${error.description}
                errorType: ${error.errorType}
                isForMainFrame: ${error.isForMainFrame}
                        ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
          onHttpError: (HttpResponseError error) {
            debugPrint('Error occurred on page: ${error.response?.statusCode}');
          },
          onUrlChange: (UrlChange change) {
            debugPrint('url change to ${change.url}');
          },
          onHttpAuthRequest: (HttpAuthRequest request) {},
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(message.message)));
        },
      );
    // #docregion platform_features
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    } else {}
    _controller = controller;
  }

  @override
  void initState() {
    super.initState();
    setupWebview();
    setupView();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.white),
    );
    return MaterialApp(
      locale: Locale(language),
      home: AnnotatedRegion(
        value: SystemUiOverlayStyle.dark, // < any style you want >
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            alignment: Alignment.center,
            children: [
              SafeArea(child: WebViewWidget(controller: _controller)),
              Visibility(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                  backgroundColor: Colors.white,
                  strokeWidth: 4.0,
                ),
                visible:isLoading || loadUrl.isEmpty,
              ),
            ],
          ),
        ),
      ),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
    );
  }
}
