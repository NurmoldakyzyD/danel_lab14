import 'package:dio/dio.dart';
import 'package:flutter_danelya9/data/repository/apifit.dart';
import 'package:flutter_danelya9/data/models/userpage.dart';

class ApiProvider {
  final Dio dio = Dio();
  late final Apifit _apiService;

  ApiProvider() {
    _apiService = Apifit(dio);
  }

  Future<List<Post>> fetchPostsFromApi() async {
    return await _apiService.fetchPostsFromApi();
  }
}
