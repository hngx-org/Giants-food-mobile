import 'dart:convert';

import 'package:giants_free_lunch/core/app_export.dart';
import 'package:giants_free_lunch/services/api_client.dart';
import 'package:giants_free_lunch/services/models/lunch/lunch_model.dart';

class HomeController extends GetxController {
  RxList<LunchsModel> dataList = <LunchsModel>[].obs;
  @override
  void onInit() async {
    super.onInit();
    await getLunchesByUserId();
  }

  Future<void> getLunchesByUserId() async {
    print("got here");

    try {
      dynamic response = await ApiClient().getLunchesByUserId(headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer ${box.read("token").toString()}"
      }, userId: box.read('userID').toString());

      dataList.assignAll(response);
      print("---------- response ${dataList}1---------");
    } catch (e) {
      print('Error when fetching data : $e');
    }
  }
}
