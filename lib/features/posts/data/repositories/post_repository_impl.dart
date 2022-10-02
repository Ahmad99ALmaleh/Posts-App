import 'package:clean_archeticture_posts_app/core/error/exceptions.dart';
import 'package:clean_archeticture_posts_app/core/error/failures.dart';
import 'package:clean_archeticture_posts_app/core/network/network_info.dart';
import 'package:clean_archeticture_posts_app/features/posts/data/models/post_model.dart';
import 'package:clean_archeticture_posts_app/features/posts/domain/entities/posts.dart';
import 'package:clean_archeticture_posts_app/features/posts/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

import '../datasources/post_local_data_source.dart';
import '../datasources/post_remote_data_source.dart';

class PostRepositoryImpl implements PostsRepository{

  late final PostRemoteDataSource remoteDataSource;
  late final PostLocalDataSource localDataSource;
  late final NetworkInfo networkInfo;

  PostRepositoryImpl({required this.localDataSource, required this.remoteDataSource,required this.networkInfo});

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    if(await networkInfo.isConnected){
      try{
        final remotePosts = await remoteDataSource.getAllPosts();
        localDataSource.cachePosts(remotePosts);
        return right(remotePosts);
      }on ServerException{
        return left(ServerFailure());
      }
    }else{
      try{
        final localPosts = await localDataSource.getCachedPosts();
        return right(localPosts);
      }on EmptyCacheException{
        return left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addPost(Post post) async {
    final PostModel postModel = PostModel( title: post.title, body: post.body);
    if(await networkInfo.isConnected){
    try{
        await remoteDataSource.addPost(postModel);
        return right(unit);
     }on ServerException{
      return left(ServerFailure());
     }
    }else{
      return left(OffLineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int postId) async {
    if(await networkInfo.isConnected){
      try{
        await remoteDataSource.deletePost(postId);
        return right(unit);
      }on ServerException{
        return left(ServerFailure());
      }
    }else{
      return left(OffLineFailure());
    }
  }


  @override
  Future<Either<Failure, Unit>> updatePost(Post post) async {
    final PostModel postModel = PostModel(id: post.id, title: post.title, body: post.body);
    if(await networkInfo.isConnected){
      try{
        await remoteDataSource.updatePost(postModel);
        return right(unit);
      }on ServerException{
        return left(ServerFailure());
      }
    }else{
      return left(OffLineFailure());
    }
  }

  
}