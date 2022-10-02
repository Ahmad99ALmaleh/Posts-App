import 'package:clean_archeticture_posts_app/features/posts/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

class DeletePostUseCase{
  late final PostsRepository repository;

  DeletePostUseCase(this.repository);

  Future<Either<Failure,Unit>> call(int postId) async{
    return await repository.deletePost(postId);
  }
}