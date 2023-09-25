import 'package:giants_free_lunch/core/extentions/extenstion.dart';
import 'package:giants_free_lunch/services/models/lunch/employee_model.dart';
import 'package:giants_free_lunch/services/models/lunch/lunch_model.dart';
import '../core/app_export.dart';
import '../core/utils/progress_dialog_utils.dart';
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
    Map<String, dynamic> requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await httpClient.post(
        '$url/api/auth/login',
        headers: headers,
        body: requestData,
      );
      print("------------- ${response.body}");
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        return response.body;
      } else if (response.statusCode == 401) {
        print("------------- ${response.statusCode}");
        errorMethod('Email or password incorrect');
        return response.statusCode;
      } else {
        throw response.body != null ? response.body : 'Something when wrong';
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
      } else if (response.statusCode == 500) {
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

  Future<dynamic> addAccount({
    Map<String, String> headers = const {},
    Map requestData = const {},
    required int userId,
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await httpClient.post(
        '$url/api/bank-account/:$userId',
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

  Future<dynamic> acceptInvite({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await httpClient.post(
          '$url/api/organizations/accept-invite',
          headers: headers,
          body: requestData);
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

  Future<List<LunchsModel>> getLunchesByUserId({
    required String userId,
    Map<String, String> headers = const {},
  }) async {
    try {
      await isNetworkConnected();
      Response response = await httpClient.get(
        '$url/api/lunches/$userId',
        headers: headers,
      );
      print("------$response------");
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      if (response.isOk) {
        final responseData = response.body as List<dynamic>;
        final lunchList =
            responseData.map((json) => LunchsModel.fromJson(json)).toList();

        return lunchList;
      } else {
        throw Exception('Failed to fetch data: ${response.statusText}');
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

  Future<dynamic> sendLunch({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      Response response = await httpClient.post(
        '$url/api/lunches',
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

  Future<List<EmployeeModel>> getEmployeeByOrgId({
    required String orgId,
    Map<String, String> headers = const {},
  }) async {
    try {
      print('in org');
      await isNetworkConnected();
      Response response = await httpClient.get(
        '$url/api/organizations/$orgId/users',
        headers: headers,
      );
      print("------$response------");
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      if (response.isOk) {
        final responseData = response.body as List<dynamic>;
        final employeeList =
            responseData.map((json) => EmployeeModel.fromJson(json)).toList();

        return employeeList;
      } else {
        throw Exception('Failed to fetch data: ${response.statusText}');
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
