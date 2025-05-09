import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_vi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi')
  ];

  /// No description provided for @script.
  ///
  /// In en, this message translates to:
  /// **'Script'**
  String get script;

  /// No description provided for @topic.
  ///
  /// In en, this message translates to:
  /// **'Topic'**
  String get topic;

  /// No description provided for @externalProduction.
  ///
  /// In en, this message translates to:
  /// **'ExternalProduction'**
  String get externalProduction;

  /// No description provided for @internalProduction.
  ///
  /// In en, this message translates to:
  /// **'InternalProduction'**
  String get internalProduction;

  /// No description provided for @postProduction.
  ///
  /// In en, this message translates to:
  /// **'PostProduction'**
  String get postProduction;

  /// No description provided for @broadcastSchedule.
  ///
  /// In en, this message translates to:
  /// **'BroadcastSchedule'**
  String get broadcastSchedule;

  /// No description provided for @task.
  ///
  /// In en, this message translates to:
  /// **'Task'**
  String get task;

  /// No description provided for @eRequest.
  ///
  /// In en, this message translates to:
  /// **'eRequest'**
  String get eRequest;

  /// No description provided for @statement.
  ///
  /// In en, this message translates to:
  /// **'Statement'**
  String get statement;

  /// No description provided for @royalties.
  ///
  /// In en, this message translates to:
  /// **'Royalty'**
  String get royalties;

  /// No description provided for @onlineApproval.
  ///
  /// In en, this message translates to:
  /// **'OnlineApproval'**
  String get onlineApproval;

  /// No description provided for @payment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get payment;

  /// No description provided for @budgetrequest.
  ///
  /// In en, this message translates to:
  /// **'BudgetRequest'**
  String get budgetrequest;

  /// No description provided for @expenseproposal.
  ///
  /// In en, this message translates to:
  /// **'ExpenseProposal'**
  String get expenseproposal;

  /// No description provided for @withdraw.
  ///
  /// In en, this message translates to:
  /// **'%s withdrawn their item %s'**
  String get withdraw;

  /// No description provided for @delegate_.
  ///
  /// In en, this message translates to:
  /// **'%s delegated approval in item %s'**
  String get delegate_;

  /// No description provided for @approve.
  ///
  /// In en, this message translates to:
  /// **'%s approved your item %s'**
  String get approve;

  /// No description provided for @assign.
  ///
  /// In en, this message translates to:
  /// **'%s submitted item %s and need your approval.'**
  String get assign;

  /// No description provided for @recall.
  ///
  /// In en, this message translates to:
  /// **'%s recalled their item %s'**
  String get recall;

  /// No description provided for @reject.
  ///
  /// In en, this message translates to:
  /// **'%s rejected your item %s'**
  String get reject;

  /// No description provided for @send_back.
  ///
  /// In en, this message translates to:
  /// **'%s sent back to you the item %s'**
  String get send_back;

  /// No description provided for @mention.
  ///
  /// In en, this message translates to:
  /// **'%s mentioned you in a comment in item %s '**
  String get mention;

  /// No description provided for @change_task_completed.
  ///
  /// In en, this message translates to:
  /// **'%s change_task_completed %s '**
  String get change_task_completed;

  /// No description provided for @change_status_task.
  ///
  /// In en, this message translates to:
  /// **'%s change_status_task %s'**
  String get change_status_task;

  /// No description provided for @evaluate.
  ///
  /// In en, this message translates to:
  /// **'%s change_status_task %s'**
  String get evaluate;

  /// No description provided for @reevaluate.
  ///
  /// In en, this message translates to:
  /// **'%s change_status_task %s'**
  String get reevaluate;

  /// No description provided for @script_mention.
  ///
  /// In en, this message translates to:
  /// **'%s mentioned you in a comment in item %s'**
  String get script_mention;

  /// No description provided for @script_assign.
  ///
  /// In en, this message translates to:
  /// **'%s submitted item %s and need your approval.'**
  String get script_assign;

  /// No description provided for @script_approve.
  ///
  /// In en, this message translates to:
  /// **'%s approved your item %s'**
  String get script_approve;

  /// No description provided for @script_reject.
  ///
  /// In en, this message translates to:
  /// **'%s rejected your item %s'**
  String get script_reject;

  /// No description provided for @script_withdraw.
  ///
  /// In en, this message translates to:
  /// **'%s withdrawn their item %s'**
  String get script_withdraw;

  /// No description provided for @script_recall.
  ///
  /// In en, this message translates to:
  /// **'%s recalled their item %s'**
  String get script_recall;

  /// No description provided for @script_delegate.
  ///
  /// In en, this message translates to:
  /// **'%s delegated approval in item %s'**
  String get script_delegate;

  /// No description provided for @script_send_back.
  ///
  /// In en, this message translates to:
  /// **'%s sent back to you the item %s'**
  String get script_send_back;

  /// No description provided for @topic_mention.
  ///
  /// In en, this message translates to:
  /// **'%s mentioned you in a comment in item %s'**
  String get topic_mention;

  /// No description provided for @topic_assign.
  ///
  /// In en, this message translates to:
  /// **'%s submitted item %s and need your approval.'**
  String get topic_assign;

  /// No description provided for @topic_approve.
  ///
  /// In en, this message translates to:
  /// **'%s approved your item %s'**
  String get topic_approve;

  /// No description provided for @topic_reject.
  ///
  /// In en, this message translates to:
  /// **'%s rejected your item %s'**
  String get topic_reject;

  /// No description provided for @topic_withdraw.
  ///
  /// In en, this message translates to:
  /// **'%s withdrawn their item %s'**
  String get topic_withdraw;

  /// No description provided for @topic_recall.
  ///
  /// In en, this message translates to:
  /// **'%s recalled their item %s'**
  String get topic_recall;

  /// No description provided for @topic_delegate.
  ///
  /// In en, this message translates to:
  /// **'%s delegated approval in item %s'**
  String get topic_delegate;

  /// No description provided for @topic_send_back.
  ///
  /// In en, this message translates to:
  /// **'%s sent back to you the item %s'**
  String get topic_send_back;

  /// No description provided for @externalProduction_mention.
  ///
  /// In en, this message translates to:
  /// **'%s mentioned you in a comment in item %s'**
  String get externalProduction_mention;

  /// No description provided for @externalProduction_assign.
  ///
  /// In en, this message translates to:
  /// **'%s submitted item %s and need your approval.'**
  String get externalProduction_assign;

  /// No description provided for @externalProduction_approve.
  ///
  /// In en, this message translates to:
  /// **'%s approved your item %s'**
  String get externalProduction_approve;

  /// No description provided for @externalProduction_reject.
  ///
  /// In en, this message translates to:
  /// **'%s rejected your item %s'**
  String get externalProduction_reject;

  /// No description provided for @externalProduction_withdraw.
  ///
  /// In en, this message translates to:
  /// **'%s withdrawn their item %s'**
  String get externalProduction_withdraw;

  /// No description provided for @externalProduction_recall.
  ///
  /// In en, this message translates to:
  /// **'%s recalled their item %s'**
  String get externalProduction_recall;

  /// No description provided for @externalProduction_delegate.
  ///
  /// In en, this message translates to:
  /// **'%s delegated approval in item %s'**
  String get externalProduction_delegate;

  /// No description provided for @externalProduction_send_back.
  ///
  /// In en, this message translates to:
  /// **'%s sent back to you the item %s'**
  String get externalProduction_send_back;

  /// No description provided for @internalProduction_mention.
  ///
  /// In en, this message translates to:
  /// **'%s mentioned you in a comment in item %s'**
  String get internalProduction_mention;

  /// No description provided for @internalProduction_assign.
  ///
  /// In en, this message translates to:
  /// **'%s submitted item %s and need your approval.'**
  String get internalProduction_assign;

  /// No description provided for @internalProduction_approve.
  ///
  /// In en, this message translates to:
  /// **'%s approved your item %s'**
  String get internalProduction_approve;

  /// No description provided for @internalProduction_reject.
  ///
  /// In en, this message translates to:
  /// **'%s rejected your item %s'**
  String get internalProduction_reject;

  /// No description provided for @internalProduction_withdraw.
  ///
  /// In en, this message translates to:
  /// **'%s withdrawn their item %s'**
  String get internalProduction_withdraw;

  /// No description provided for @internalProduction_recall.
  ///
  /// In en, this message translates to:
  /// **'%s recalled their item %s'**
  String get internalProduction_recall;

  /// No description provided for @internalProduction_delegate.
  ///
  /// In en, this message translates to:
  /// **'%s delegated approval in item %s'**
  String get internalProduction_delegate;

  /// No description provided for @internalProduction_send_back.
  ///
  /// In en, this message translates to:
  /// **'%s sent back to you the item %s'**
  String get internalProduction_send_back;

  /// No description provided for @postProduction_mention.
  ///
  /// In en, this message translates to:
  /// **'%s mentioned you in a comment in item %s'**
  String get postProduction_mention;

  /// No description provided for @postProduction_assign.
  ///
  /// In en, this message translates to:
  /// **'%s submitted item %s and need your approval.'**
  String get postProduction_assign;

  /// No description provided for @postProduction_approve.
  ///
  /// In en, this message translates to:
  /// **'%s approved your item %s'**
  String get postProduction_approve;

  /// No description provided for @postProduction_reject.
  ///
  /// In en, this message translates to:
  /// **'%s rejected your item %s'**
  String get postProduction_reject;

  /// No description provided for @postProduction_withdraw.
  ///
  /// In en, this message translates to:
  /// **'%s withdrawn their item %s'**
  String get postProduction_withdraw;

  /// No description provided for @postProduction_recall.
  ///
  /// In en, this message translates to:
  /// **'%s recalled their item %s'**
  String get postProduction_recall;

  /// No description provided for @postProduction_delegate.
  ///
  /// In en, this message translates to:
  /// **'%s delegated approval in item %s'**
  String get postProduction_delegate;

  /// No description provided for @postProduction_send_back.
  ///
  /// In en, this message translates to:
  /// **'%s sent back to you the item %s'**
  String get postProduction_send_back;

  /// No description provided for @broadcastSchedule_mention.
  ///
  /// In en, this message translates to:
  /// **'%s mentioned you in a comment in item %s'**
  String get broadcastSchedule_mention;

  /// No description provided for @broadcastSchedule_assign.
  ///
  /// In en, this message translates to:
  /// **'%s submitted item %s and need your approval.'**
  String get broadcastSchedule_assign;

  /// No description provided for @broadcastSchedule_approve.
  ///
  /// In en, this message translates to:
  /// **'%s approved your item %s'**
  String get broadcastSchedule_approve;

  /// No description provided for @broadcastSchedule_reject.
  ///
  /// In en, this message translates to:
  /// **'%s rejected your item %s'**
  String get broadcastSchedule_reject;

  /// No description provided for @broadcastSchedule_withdraw.
  ///
  /// In en, this message translates to:
  /// **'%s withdrawn their item %s'**
  String get broadcastSchedule_withdraw;

  /// No description provided for @broadcastSchedule_recall.
  ///
  /// In en, this message translates to:
  /// **'%s recalled their item %s'**
  String get broadcastSchedule_recall;

  /// No description provided for @broadcastSchedule_delegate.
  ///
  /// In en, this message translates to:
  /// **'%s delegated approval in item %s'**
  String get broadcastSchedule_delegate;

  /// No description provided for @broadcastSchedule_send_back.
  ///
  /// In en, this message translates to:
  /// **'%s sent back to you the item %s'**
  String get broadcastSchedule_send_back;

  /// No description provided for @eRequest_mention.
  ///
  /// In en, this message translates to:
  /// **'%s mentioned you in a comment in item %s'**
  String get eRequest_mention;

  /// No description provided for @eRequest_assign.
  ///
  /// In en, this message translates to:
  /// **'%s submitted item %s and need your approval.'**
  String get eRequest_assign;

  /// No description provided for @eRequest_approve.
  ///
  /// In en, this message translates to:
  /// **'%s approved your item %s'**
  String get eRequest_approve;

  /// No description provided for @eRequest_reject.
  ///
  /// In en, this message translates to:
  /// **'%s rejected your item %s'**
  String get eRequest_reject;

  /// No description provided for @eRequest_withdraw.
  ///
  /// In en, this message translates to:
  /// **'%s withdrawn their item %s'**
  String get eRequest_withdraw;

  /// No description provided for @eRequest_recall.
  ///
  /// In en, this message translates to:
  /// **'%s recalled their item %s'**
  String get eRequest_recall;

  /// No description provided for @eRequest_delegate.
  ///
  /// In en, this message translates to:
  /// **'%s delegated approval in item %s'**
  String get eRequest_delegate;

  /// No description provided for @eRequest_send_back.
  ///
  /// In en, this message translates to:
  /// **'%s sent back to you the item %s'**
  String get eRequest_send_back;

  /// No description provided for @royalties_evaluate.
  ///
  /// In en, this message translates to:
  /// **'%s evaluated your royalty %s.'**
  String get royalties_evaluate;

  /// No description provided for @royalties_reevaluate.
  ///
  /// In en, this message translates to:
  /// **'%s re-evaluated your royalty %s.'**
  String get royalties_reevaluate;

  /// No description provided for @royalties_mention.
  ///
  /// In en, this message translates to:
  /// **'%s has mentioned you in a comment of royalty %s.'**
  String get royalties_mention;

  /// No description provided for @statement_mention.
  ///
  /// In en, this message translates to:
  /// **'%s mentioned you in a comment in item %s'**
  String get statement_mention;

  /// No description provided for @statement_assign.
  ///
  /// In en, this message translates to:
  /// **'%s submitted item %s and need your approval.'**
  String get statement_assign;

  /// No description provided for @statement_approve.
  ///
  /// In en, this message translates to:
  /// **'%s approved your item %s'**
  String get statement_approve;

  /// No description provided for @statement_reject.
  ///
  /// In en, this message translates to:
  /// **'%s rejected your item %s'**
  String get statement_reject;

  /// No description provided for @statement_withdraw.
  ///
  /// In en, this message translates to:
  /// **'%s withdrawn their item %s'**
  String get statement_withdraw;

  /// No description provided for @statement_recall.
  ///
  /// In en, this message translates to:
  /// **'%s recalled their item %s'**
  String get statement_recall;

  /// No description provided for @statement_delegate.
  ///
  /// In en, this message translates to:
  /// **'%s delegated approval in item %s'**
  String get statement_delegate;

  /// No description provided for @statement_send_back.
  ///
  /// In en, this message translates to:
  /// **'%s sent back to you the item %s'**
  String get statement_send_back;

  /// No description provided for @onlineApproval_mention.
  ///
  /// In en, this message translates to:
  /// **'%s mentioned you in a comment in item %s'**
  String get onlineApproval_mention;

  /// No description provided for @onlineApproval_assign.
  ///
  /// In en, this message translates to:
  /// **'%s submitted item %s and need your approval.'**
  String get onlineApproval_assign;

  /// No description provided for @onlineApproval_approve.
  ///
  /// In en, this message translates to:
  /// **'%s approved your item %s'**
  String get onlineApproval_approve;

  /// No description provided for @onlineApproval_reject.
  ///
  /// In en, this message translates to:
  /// **'%s rejected your item %s'**
  String get onlineApproval_reject;

  /// No description provided for @onlineApproval_withdraw.
  ///
  /// In en, this message translates to:
  /// **'%s withdrawn their item %s'**
  String get onlineApproval_withdraw;

  /// No description provided for @onlineApproval_recall.
  ///
  /// In en, this message translates to:
  /// **'%s recalled their item %s'**
  String get onlineApproval_recall;

  /// No description provided for @onlineApproval_delegate.
  ///
  /// In en, this message translates to:
  /// **'%s delegated approval in item %s'**
  String get onlineApproval_delegate;

  /// No description provided for @onlineApproval_send_back.
  ///
  /// In en, this message translates to:
  /// **'%s sent back to you the item %s'**
  String get onlineApproval_send_back;

  /// No description provided for @payment_create.
  ///
  /// In en, this message translates to:
  /// **'%s created Payment Request %s.'**
  String get payment_create;

  /// No description provided for @payment_submit.
  ///
  /// In en, this message translates to:
  /// **'%s submitted Payment Request %s.'**
  String get payment_submit;

  /// No description provided for @payment_fully_approved.
  ///
  /// In en, this message translates to:
  /// **'Payment Request %s has been approved successfully.'**
  String get payment_fully_approved;

  /// No description provided for @payment_reject.
  ///
  /// In en, this message translates to:
  /// **'Payment Request %s has been rejected.'**
  String get payment_reject;

  /// No description provided for @payment_cancel.
  ///
  /// In en, this message translates to:
  /// **'Payment Request %s has been cancelled.'**
  String get payment_cancel;

  /// No description provided for @payment_paid.
  ///
  /// In en, this message translates to:
  /// **'Payment Request %s has been paid successfully.'**
  String get payment_paid;

  /// No description provided for @payment_posted.
  ///
  /// In en, this message translates to:
  /// **'Payment Request %s has been posted to eBankTransfer successfully.'**
  String get payment_posted;

  /// No description provided for @payment_mention.
  ///
  /// In en, this message translates to:
  /// **'%s has mentioned you in a comment of Payment Request %s.'**
  String get payment_mention;

  /// No description provided for @budgetrequest_mention.
  ///
  /// In en, this message translates to:
  /// **'%s has mentioned you in a comment of Budget Request %s.'**
  String get budgetrequest_mention;

  /// No description provided for @budgetrequest_reject.
  ///
  /// In en, this message translates to:
  /// **'Budget Request %s has been rejected.'**
  String get budgetrequest_reject;

  /// No description provided for @budgetrequest_cancel.
  ///
  /// In en, this message translates to:
  /// **'Budget Request %s has been cancelled.'**
  String get budgetrequest_cancel;

  /// No description provided for @budgetrequest_create.
  ///
  /// In en, this message translates to:
  /// **'%s created Budget Request %s for Budget %s.'**
  String get budgetrequest_create;

  /// No description provided for @budgetrequest_submit.
  ///
  /// In en, this message translates to:
  /// **'%s submitted Budget Request %s.'**
  String get budgetrequest_submit;

  /// No description provided for @budgetrequest_fully_approved.
  ///
  /// In en, this message translates to:
  /// **'Budget Request %s has been approved successfully.'**
  String get budgetrequest_fully_approved;

  /// No description provided for @budgetrequest_budget_adjustment_request_created.
  ///
  /// In en, this message translates to:
  /// **'%s created adjustment Budget Request %s for Budget %s.'**
  String get budgetrequest_budget_adjustment_request_created;

  /// No description provided for @expenseproposal_create.
  ///
  /// In en, this message translates to:
  /// **'%s created Expense Proposal %s.'**
  String get expenseproposal_create;

  /// No description provided for @expenseproposal_submit.
  ///
  /// In en, this message translates to:
  /// **'%s submitted Expense Proposal %s.'**
  String get expenseproposal_submit;

  /// No description provided for @expenseproposal_fully_approved.
  ///
  /// In en, this message translates to:
  /// **'Expense Proposal %s has been approved successfully.'**
  String get expenseproposal_fully_approved;

  /// No description provided for @expenseproposal_mention.
  ///
  /// In en, this message translates to:
  /// **'%s has mentioned you in a comment of Expense Proposal %s.'**
  String get expenseproposal_mention;

  /// No description provided for @expenseproposal_cancel.
  ///
  /// In en, this message translates to:
  /// **'Expense Proposal %s has been rejected.'**
  String get expenseproposal_cancel;

  /// No description provided for @expenseproposal_reject.
  ///
  /// In en, this message translates to:
  /// **'Expense Proposal %s has been cancelled.'**
  String get expenseproposal_reject;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'vi': return AppLocalizationsVi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
