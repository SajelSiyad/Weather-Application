import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather/model/api_model.dart';
import 'package:weather/model/current_data_model.dart';

class ApiService {
  Dio dio = Dio();

  Future<CurrentDataModel?> getCurrentWeatherDatas(String location) async {
    try {
      Response response = await dio.get(
          "https://api.weatherapi.com/v1/current.json?key=00bca79e0f1b4e96b0274312233110&q=$location&aqi=yes");
      if (response.statusCode == 200) {
        String jsonstring = json.encode(response.data);
        return currentDataModelFromJson(jsonstring);
      } else {
        return null;
      }
    } on DioException catch (e) {
      log(e.message.toString());
    }
    return null;
  }

  Future<ApiModel?> getWeatherDatas(String date) async {
    try {
      Response response = await dio.get(
          "https://api.weatherapi.com/v1/history.json?key=00bca79e0f1b4e96b0274312233110&q=Kozhikode&dt=$date");
      if (response.statusCode == 200) {
        String jsonstring = json.encode(response.data);
        return apiModelFromJson(jsonstring);
      } else {
        return null;
      }
    } on DioException catch (e) {
      log(e.message.toString());
    }
    return null;
  }
}
