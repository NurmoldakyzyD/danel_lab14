import 'package:flutter_danelya9/data/repository/post_repository.dart';
import 'package:flutter_danelya9/domain/entities/post_entities.dart';

class FetchPosts {
  final PostRepository repository;

  FetchPosts(this.repository);

  Future<List<PostEntity>> call() async {
    return await repository.fetchPosts();
  }
}
