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
  Future<PostPostOrganizationInviteResp> postOrganizationInvite({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await httpClient.post(
        '$url/api/organization/invite',
        headers: headers,
        body: requestData,
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return PostPostOrganizationInviteResp.fromJson(response.body);
      } else {
        throw response.body != null
            ? PostPostOrganizationInviteResp.fromJson(response.body)
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

  /// Performs API call for https://giants-food-backend-production.up.railway.app/api/auth/login
  ///
  /// Sends a POST request to the server's 'https://giants-food-backend-production.up.railway.app/api/auth/login' endpoint
  /// with the provided headers and request data
  /// Returns a [PostPostLoginResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<PostPostLoginResp> postLogin({
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
        return PostPostLoginResp.fromJson(response.body);
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
}