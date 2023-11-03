import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/model/api_model.dart';
import 'package:weather/model/current_data_model.dart';
import 'package:weather/service/api_service.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});

final getWeatherDatasProvider =
    FutureProvider.family<ApiModel?, String>((ref, date) async {
  return ref.read(apiServiceProvider).getWeatherDatas(date);
});

final getCurrentWeatherDatasProvider =
    FutureProvider<CurrentDataModel?>((ref) async {
  return ref.read(apiServiceProvider).getCurrentWeatherDatas();
});
