import 'package:afsesab/app/models/PostModel.dart';
import 'package:afsesab/app/shared/custom_dio/custom_dio.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:dio/dio.dart';

class HomeRepository extends Disposable {

  final CustomDio _dio;

  HomeRepository(this._dio);

  Future<List<PostModel>> getPosts() async {
    try {
      var response = await _dio.client.get("/posts");
      return (response.data as List)
          .map((item) => PostModel.fromJson(item))
          .toList();
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
