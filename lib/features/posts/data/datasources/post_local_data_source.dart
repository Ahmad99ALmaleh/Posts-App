import 'dart:convert';

import 'package:clean_archeticture_posts_app/core/error/exceptions.dart';
import 'package:clean_archeticture_posts_app/features/posts/data/models/post_model.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PostLocalDataSource{
  Future<List<PostModel>> getCachedPosts();
  Future<Unit> cachePosts(List<PostModel> postModels);
}

class PostLocalDataSourceImpl implements PostLocalDataSource{
  late final SharedPreferences sharedPreferences;

  PostLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<Unit> cachePosts(List<PostModel> postModels) {
    List postModelsToJson = postModels
        .map<Map<String,dynamic>>((postModel) => postModel.toJson())
        .toList();
    sharedPreferences.setString("CASHED_POSTS", jsonEncode(postModelsToJson));
    return Future.value(unit);
  }

  @override
  Future<List<PostModel>> getCachedPosts() {
    final jsonString = sharedPreferences.getString("CASHED_POSTS");
    if(jsonString != null){
      List decodeJsonData = json.decode(jsonString);
      List<PostModel> jsonToPostModels = decodeJsonData
          .map<PostModel>((jsonPostModel) => PostModel.fromJson(jsonPostModel))
          .toList();
      return Future.value(jsonToPostModels);
    }else{
      throw EmptyCacheException();
    }

  }
  
}