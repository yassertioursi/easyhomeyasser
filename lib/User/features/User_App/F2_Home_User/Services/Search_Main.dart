import 'package:dio/dio.dart';
import 'package:easyhome/User/features/F1_Login&Signup/common_widgets/dialogs.dart';
import 'package:easyhome/Models/User_model.dart';
import 'package:flutter/material.dart';

Dio dio = new Dio();

class Search {
  late String getUrl;
  late List workers;

  Future<String> search_workers() async {
    try {
      Response response = await dio.get(getUrl);
      if (response.statusCode == 200) {
        print("true ");
        print(response.data);
        workers = response.data["data"]["data"];
        return "true";
      } else {
        print(false);
        return "false";
      }
    } on DioError catch (error) {
      if (error.response != null) {
        print('Error Response data: ${error.response!.data}');

        print('Error Response status: ${error.response!.statusCode}');
        print('Error Response headers: ${error.response!.headers}');
      } else {
        print('Error: $error');
      }
      return "false";
    }
  }
}
