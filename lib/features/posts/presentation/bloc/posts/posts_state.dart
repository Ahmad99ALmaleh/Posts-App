part of 'posts_bloc.dart';

@immutable
abstract class PostsState extends Equatable {
  const PostsState();
  @override
  List <Object> get props => [];
}

class PostsInitial extends PostsState {}

class LoadingPostsState extends PostsState{}

class LoadedPostsState extends PostsState{
  late final List<Post> posts;
  LoadedPostsState({required this.posts});
  @override
  List <Object> get props => [posts];
}

class ErrorPostsState extends PostsState{
  late final String message;
  ErrorPostsState({required this.message});
  @override
  List <Object> get props => [message];
}
