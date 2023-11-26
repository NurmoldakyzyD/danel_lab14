import 'package:flutter_danelya9/data/datasource/post_datasource.dart';
import 'package:flutter_danelya9/domain/entities/post_entities.dart';

abstract class PostRepository {
  Future<List<PostEntity>> fetchPosts();
}

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;

  PostRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<PostEntity>> fetchPosts() async {
    final posts = await remoteDataSource.fetchPostsFromApi();
    return posts
        .map((post) => PostEntity(
              userId: post.userId,
              id: post.id,
              title: post.title,
              body: post.body,
            ))
        .toList();
  }
}
