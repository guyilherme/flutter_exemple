import 'package:afsesab/app/shared/custom_dio/interceptor.dart';
import 'package:dio/dio.dart';
import 'package:afsesab/app/shared/const.dart';

class CustomDio{

  final Dio client;
  
  CustomDio(this.client) {
    client.options.baseUrl = BASE_URL;
    client.interceptors.add(CustomInterceptor());
    client.options.connectTimeout = 5000;
  }
}