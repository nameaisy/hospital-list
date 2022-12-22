import 'dart:convert';
import 'dart:core';
import 'dart:ui';


import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

import '../../models/hospital_list_model.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = 'http://lovemonster.my.id/hospital';

  Future<List<HospitalListModel>> fetchHospitalList() async {
    try {
      List<HospitalListModel> hospitalList = [];
      Response response = await _dio.get(_url);
      print(response.data);
      hospitalList = hospitalListModelFromJson(response.data);
      return hospitalList;
      } catch (error, stacktrace) {
        print("Exception occurred: $error stackTrace: $stacktrace");
        return Future.error("");
      }
    }
}