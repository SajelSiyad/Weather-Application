import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/model/api_model.dart';
import 'package:weather/model/current_data_model.dart';
import 'package:weather/service/api_service.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  return ApiService();
});

final searchControllerProvider = StateProvider<TextEditingController>((ref) {
  return TextEditingController();
});

final getWeatherDatasProvider =
    FutureProvider.family<ApiModel?, String>((ref, date) async {
  return ref.read(apiServiceProvider).getWeatherDatas(date);
});

final getCurrentWeatherDatasProvider =
    FutureProvider.family<CurrentDataModel?, String>((ref, query) async {
  return ref.read(apiServiceProvider).getCurrentWeatherDatas(
      ref.watch(searchControllerProvider).text == "" ? "Kozhikode" : query);
});
