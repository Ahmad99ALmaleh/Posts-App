import 'package:clean_archeticture_posts_app/features/posts/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/posts.dart';

class GetAllPostsUseCase{
  final PostsRepository repository;

  GetAllPostsUseCase(this.repository);

  Future<Either<Failure,List<Post>>> call() async {
    return await repository.getAllPosts();
  }

}