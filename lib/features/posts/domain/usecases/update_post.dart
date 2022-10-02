import 'package:clean_archeticture_posts_app/features/posts/domain/entities/posts.dart';
import 'package:clean_archeticture_posts_app/features/posts/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

class UpdatePostUseCase{
  final PostsRepository repository;
  UpdatePostUseCase(this.repository);

  Future<Either<Failure,Unit>> call(Post post) async{
    return await repository.updatePost(post);
  }
}