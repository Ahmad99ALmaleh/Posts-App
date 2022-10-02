import 'package:clean_archeticture_posts_app/features/posts/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/posts.dart';

class AddPostUseCase{
  late final PostsRepository repository;

  AddPostUseCase(this.repository);

  Future<Either<Failure,Unit>> call(Post post) async{
    return await repository.addPost(post);
  }
}