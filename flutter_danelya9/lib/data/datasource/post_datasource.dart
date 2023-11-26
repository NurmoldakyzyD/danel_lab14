import 'package:flutter_danelya9/data/models/userpage.dart';
import 'package:flutter_danelya9/data/repository/api.dart';

abstract class PostRemoteDataSource {
  Future<List<Post>> fetchPostsFromApi();
}

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final ApiProvider apiProvider;

  PostRemoteDataSourceImpl({required this.apiProvider});

  @override
  Future<List<Post>> fetchPostsFromApi() async {
    return await apiProvider.fetchPostsFromApi();
  }
}
