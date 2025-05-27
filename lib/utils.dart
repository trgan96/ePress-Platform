import 'package:ptth/src/generated/l10n/app_localizations.dart';
import 'package:ptth/src/generated/l10n/app_localizations_en.dart';
import 'package:ptth/src/generated/l10n/app_localizations_vi.dart';

class Utils {
  static AppLocalizations getAppLocalizations(String language) {
    return language == "vi" ? AppLocalizationsVi() : AppLocalizationsEn();
  }

  static String getObject(String language, String key) {
    AppLocalizations appLocalizations = getAppLocalizations(language);
    switch (key.toLowerCase()) {
      case "script":
        return appLocalizations.script;
      case "topic":
        return appLocalizations.topic;
      case "externalproduction":
        return appLocalizations.externalProduction;
      case "internalproduction":
        return appLocalizations.internalProduction;
      case "postproduction":
        return appLocalizations.postProduction;
      case "broadcastschedule":
        return appLocalizations.broadcastSchedule;
      case "task":
        return appLocalizations.task;
      case "erequest":
        return appLocalizations.eRequest;
      case "statement":
        return appLocalizations.statement;
      case "royalties":
        return appLocalizations.royalties;
      case "onlineapproval":
        return appLocalizations.onlineApproval;
    }
    return "";
  }

  static String getAction(String language, String key) {
    AppLocalizations appLocalizations = getAppLocalizations(language);
    switch (key.toLowerCase()) {
      case "withdraw":
        return appLocalizations.withdraw;
      case "delegate":
        return appLocalizations.delegate_;
      case "approve":
        return appLocalizations.approve;
      case "assign":
        return appLocalizations.assign;
      case "recall":
        return appLocalizations.recall;
      case "reject":
        return appLocalizations.reject;
      case "send_back":
        return appLocalizations.send_back;
      case "mention":
        return appLocalizations.mention;
      case "change_task_completed":
        return appLocalizations.change_task_completed;
      case "change_status_task":
        return appLocalizations.change_status_task;
      case "evaluate":
        return appLocalizations.evaluate;
      case "reevaluate":
        return appLocalizations.reevaluate;
    }
    return "";
  }

  static String getBody(String language, String key) {
    AppLocalizations appLocalizations = getAppLocalizations(language);
    switch (key.toLowerCase()) {
      case "script_mention":
        return appLocalizations.script_mention;
      case "script_assign":
        return appLocalizations.script_assign;
      case "script_approve":
        return appLocalizations.script_approve;
      case "script_reject":
        return appLocalizations.script_reject;
      case "script_withdraw":
        return appLocalizations.script_withdraw;
      case "script_recall":
        return appLocalizations.script_recall;
      case "script_delegate":
        return appLocalizations.script_delegate;
      case "script_send_back":
        return appLocalizations.script_send_back;

      case "topic_mention":
        return appLocalizations.topic_mention;
      case "topic_assign":
        return appLocalizations.topic_assign;
      case "topic_approve":
        return appLocalizations.topic_approve;
      case "topic_reject":
        return appLocalizations.topic_reject;
      case "topic_withdraw":
        return appLocalizations.topic_withdraw;
      case "topic_recall":
        return appLocalizations.topic_recall;
      case "topic_delegate":
        return appLocalizations.topic_delegate;
      case "topic_send_back":
        return appLocalizations.topic_send_back;

      case "externalproduction_mention":
        return appLocalizations.externalProduction_mention;
      case "externalproduction_assign":
        return appLocalizations.externalProduction_assign;
      case "externalproduction_approve":
        return appLocalizations.externalProduction_approve;
      case "externalproduction_reject":
        return appLocalizations.externalProduction_reject;
      case "externalproduction_withdraw":
        return appLocalizations.externalProduction_withdraw;
      case "externalproduction_recall":
        return appLocalizations.externalProduction_recall;
      case "externalproduction_delegate":
        return appLocalizations.externalProduction_delegate;
      case "externalproduction_send_back":
        return appLocalizations.externalProduction_send_back;

      case "internalproduction_mention":
        return appLocalizations.internalProduction_mention;
      case "internalproduction_assign":
        return appLocalizations.internalProduction_assign;
      case "internalproduction_approve":
        return appLocalizations.internalProduction_approve;
      case "internalproduction_reject":
        return appLocalizations.internalProduction_reject;
      case "internalproduction_withdraw":
        return appLocalizations.internalProduction_withdraw;
      case "internalproduction_recall":
        return appLocalizations.internalProduction_recall;
      case "internalproduction_delegate":
        return appLocalizations.internalProduction_delegate;
      case "internalproduction_send_back":
        return appLocalizations.internalProduction_send_back;

      case "postproduction_mention":
        return appLocalizations.postProduction_mention;
      case "postproduction_assign":
        return appLocalizations.postProduction_assign;
      case "postproduction_approve":
        return appLocalizations.postProduction_approve;
      case "postproduction_reject":
        return appLocalizations.postProduction_reject;
      case "postproduction_withdraw":
        return appLocalizations.postProduction_withdraw;
      case "postproduction_recall":
        return appLocalizations.postProduction_recall;
      case "postproduction_delegate":
        return appLocalizations.postProduction_delegate;
      case "postproduction_send_back":
        return appLocalizations.postProduction_send_back;

      case "broadcastschedule_mention":
        return appLocalizations.broadcastSchedule_mention;
      case "broadcastschedule_assign":
        return appLocalizations.broadcastSchedule_assign;
      case "broadcastschedule_approve":
        return appLocalizations.broadcastSchedule_approve;
      case "broadcastschedule_reject":
        return appLocalizations.broadcastSchedule_reject;
      case "broadcastschedule_withdraw":
        return appLocalizations.broadcastSchedule_withdraw;
      case "broadcastschedule_recall":
        return appLocalizations.broadcastSchedule_recall;
      case "broadcastschedule_delegate":
        return appLocalizations.broadcastSchedule_delegate;
      case "broadcastschedule_send_back":
        return appLocalizations.broadcastSchedule_send_back;

      case "royalties_evaluate":
        return appLocalizations.royalties_evaluate;
      case "royalties_reevaluate":
        return appLocalizations.royalties_reevaluate;
      case "royalties_mention":
        return appLocalizations.royalties_mention;

      case "erequest_mention":
        return appLocalizations.eRequest_mention;
      case "erequest_assign":
        return appLocalizations.eRequest_assign;
      case "erequest_approve":
        return appLocalizations.eRequest_approve;
      case "erequest_reject":
        return appLocalizations.eRequest_reject;
      case "erequest_withdraw":
        return appLocalizations.eRequest_withdraw;
      case "erequest_recall":
        return appLocalizations.eRequest_recall;
      case "erequest_delegate":
        return appLocalizations.eRequest_delegate;
      case "erequest_send_back":
        return appLocalizations.eRequest_send_back;

      case "statement_mention":
        return appLocalizations.statement_mention;
      case "statement_assign":
        return appLocalizations.statement_assign;
      case "statement_approve":
        return appLocalizations.statement_approve;
      case "statement_reject":
        return appLocalizations.statement_reject;
      case "statement_withdraw":
        return appLocalizations.statement_withdraw;
      case "statement_recall":
        return appLocalizations.statement_recall;
      case "statement_delegate":
        return appLocalizations.statement_delegate;
      case "statement_send_back":
        return appLocalizations.statement_send_back;

      case "onlineapproval_mention":
        return appLocalizations.onlineApproval_mention;
      case "onlineapproval_assign":
        return appLocalizations.onlineApproval_assign;
      case "onlineapproval_approve":
        return appLocalizations.onlineApproval_approve;
      case "onlineapproval_reject":
        return appLocalizations.onlineApproval_reject;
      case "onlineapproval_withdraw":
        return appLocalizations.onlineApproval_withdraw;
      case "onlineapproval_recall":
        return appLocalizations.onlineApproval_recall;
      case "onlineapproval_delegate":
        return appLocalizations.onlineApproval_delegate;
      case "onlineapproval_send_back":
        return appLocalizations.onlineApproval_send_back;
    }
    return "";
  }

  static String getUrl(
    String id,
    String parentId,
    String type,
    String action,
    String payeeType,
    String appName,
  ) {
    if (appName == 'p2p') {
      return getP2PRedirectUrl(id, parentId, type, action, payeeType);
    }
    return getRedirectUrl(id, type, action);
  }

  static String getRedirectUrl(String id, String type, String action) {
    String tabRouting = "";
    String redirect = "";
    switch (type.toLowerCase()) {
      case "erequest":
        tabRouting = (action == "mention") ? "preview" : "overview";
        redirect = "/request-form-list/request/${id}/${tabRouting}";
        break;
      case "script":
        tabRouting = (action == "mention") ? "preview" : "overview";
        redirect = "/script/${id}/${tabRouting}";
        break;
      case "topic":
        tabRouting = (action == "mention") ? "preview" : "overview";
        redirect = "/topic/${id}/${tabRouting}";
        break;
      case "externalproduction":
        tabRouting = (action == "mention") ? "comment" : "overview";
        redirect = "/external-production/${id}/${tabRouting}";
        break;
      case "internalproduction":
        tabRouting = (action == "mention") ? "comment" : "overview";
        redirect = "/internal-production/${id}/${tabRouting}";
        break;
      case "postproduction":
        tabRouting = (action == "mention") ? "preview" : "overview";
        redirect = "/post-production/${id}/${tabRouting}";
        break;
      case "broadcastschedule":
        tabRouting = (action == "mention") ? "comment" : "overview";
        redirect = "/broadcast-schedule/${id}/${tabRouting}";
        break;
      case 'onlineapproval':
        tabRouting = (action == "mention") ? "preview" : "overview";
        redirect = "/online-approval/${id}/${tabRouting}";
        break;
      case "royalties":
      case "royalty":
        tabRouting = (action == "mention") ? "comment" : "overview";
        redirect = "/royalties/${id}/${tabRouting}";
        break;
      case "statement":
        tabRouting = (action == "mention") ? "comment" : "overview";
        redirect = "/royalty-statement/${id}/${tabRouting}";
        break;
      case "task":
        break;
    }
    switch (type.toLowerCase()) {
      case 'onlineapproval':
        redirect = '/app/eRequest' + redirect;
        break;
      case "royalties":
      case "royalty":
      case "statement":
        redirect = '/app/eRoyalty' + redirect;
        break;
      default:
        redirect = '/app/ePress' + redirect;
    }
    print("aaaaaaaaaa redirect = " + redirect);
    return redirect;
  }

  static String getRouteName(String payeeType) {
    switch (payeeType.toLowerCase()) {
      case 'vendor':
        return 'vendor/vendor-detail';
      case 'staff':
        return 'staff/staff-detail';
      case 'customer':
        return 'customer/customer-detail';
    }
    return 'unknown';
  }

  static String getP2PRedirectUrl(
    String id,
    String parentId,
    String type,
    String action,
    String payeeType,
  ) {
    String tabRouting = 'detail';
    String markOpenDiscussion =
        (action == 'mention') ? '?opendiscussion=true' : '';
    String url = "";
    switch (type.toLowerCase()) {
      case 'budgetrequest':
        url =
            "/app/eBudget/team_budget/${parentId}/budgetrequest/${id}/${tabRouting}${markOpenDiscussion}";
        break;
      case 'expenseproposal':
        url =
            "/app/eBudget/expense_proposal/expense/${id}/${tabRouting}${markOpenDiscussion}";
        break;
      case 'payment':
        tabRouting = 'general';
        url =
            "/app/ePayment/${getRouteName(payeeType)}/${id}/${tabRouting}${markOpenDiscussion}";
        break;
    }
    return url;
  }
}
