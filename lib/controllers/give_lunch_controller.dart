import 'package:flutter/material.dart';
import 'package:giants_free_lunch/core/app_export.dart';
import 'package:giants_free_lunch/services/api_client.dart';
import 'package:giants_free_lunch/services/models/lunch/employee_model.dart';

class GiveLunchController extends GetxController {
  RxList<EmployeeModel> dataList = <EmployeeModel>[].obs;
  final searchControl = TextEditingController();

  @override
  void onInit() async {
    await getEmployeeByOrgId();
    // TODO: implement onInit
    super.onInit();
  }

  Future<void> getEmployeeByOrgId() async {
    try {
      print('here');
      dynamic response = await ApiClient().getEmployeeByOrgId(headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${box.read("token").toString()}"
      }, orgId: box.read('orgId').toString());
      print(response);
      print(box.read('orgId'));
      dataList.assignAll(response);
    } catch (e) {
      print('Error when fetching data : $e');
    }
  }
}
