import 'package:giants_free_lunch/services/models/postSignUp/sign_up_response.dart';

import '../core/app_export.dart';
import '../core/utils/progress_dialog_utils.dart';
import '../services/models/postLogin/post_post_login_resp.dart';
import '../services/models/postOrganization/post_post_organization_invite_resp.dart';

class ApiClient extends GetConnect {
  var url = "https://giants-food-backend-production.up.railway.app";

  @override
  void onInit() {
    super.onInit();
    httpClient.timeout = const Duration(seconds: 60);
  }

  ///method can be used for checking internet connection
  ///returns [bool] based on availability of internet
  Future isNetworkConnected() async {
    if (!await Get.find<NetworkInfo>().isConnected()) {
      throw NoInternetException('No Internet Found!');
    }
  }

  /// is `true` when the response status code is between 200 and 299
  ///
  /// user can modify this method with custom logics based on their API response
  bool _isSuccessCall(Response response) {
    return response.isOk;
  }

  /// Performs API call for https://giants-food-backend-production.up.railway.app/api/organization/invite
  ///
  /// Sends a POST request to the server's 'https://giants-food-backend-production.up.railway.app/api/organization/invite' endpoint
  /// with the provided headers and request data
  /// Returns a [PostPostOrganizationInviteResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<dynamic> postOrganizationInvite({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await httpClient.post(
        '$url/api/organizations/invite',
        headers: headers,
        body: requestData,
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return response.body;
      } else {
        throw response.body != null ? response.body : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Performs API call for https://giants-food-backend-production.up.railway.app/api/auth/login
  ///
  /// Sends a POST request to the server's 'https://giants-food-backend-production.up.railway.app/api/auth/login' endpoint
  /// with the provided headers and request data
  /// Returns a [PostPostLoginResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<dynamic> postLogin({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await httpClient.post(
        '$url/api/auth/login',
        headers: headers,
        body: requestData,
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return response.body;
      } else if (response.statusCode == 400) {
        print("------------- ${response.statusCode}");
        return response.statusCode;
      } else {
        throw response.body != null
            ? PostPostLoginResp.fromJson(response.body)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Future<dynamic> postSignUp1({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await httpClient.post(
        '$url/api/auth/signup',
        headers: headers,
        body: requestData,
      );
      print("------------- $response");
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return response.body;
      } else if (response.statusCode == 400) {
        print("------------- ${response.statusCode}");
        return response.statusCode;
      } else {
        throw response.body != null ? response.body : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Future<dynamic> postSignUp2({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await httpClient.post(
        '$url/api/organizations',
        headers: headers,
        body: requestData,
      );
      print("------------- $response");
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return response.body;
      } else if (response.statusCode == 400) {
        print("------------- ${response.statusCode}");
        return response.statusCode;
      } else {
        throw response.body != null ? response.body : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Future<dynamic> postGiveLunch({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await httpClient.post(
        '$url/api/organizations/invite',
        headers: headers,
        body: requestData,
      );
      print("------------- $response");
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return response.body;
      } else if (response.statusCode == 400) {
        print("------------- ${response.statusCode}");
        return response.statusCode;
      } else {
        throw response.body != null ? response.body : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
