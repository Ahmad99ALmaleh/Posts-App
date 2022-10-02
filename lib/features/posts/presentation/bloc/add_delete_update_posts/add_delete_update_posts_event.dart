part of 'add_delete_update_posts_bloc.dart';

@immutable
abstract class AddDeleteUpdatePostsEvent extends Equatable {
  const AddDeleteUpdatePostsEvent();
  @override
  List <Object> get props => [];
}

class AddPostEvent extends AddDeleteUpdatePostsEvent{
  late final Post post;
  AddPostEvent({required this.post});
  @override
  List <Object> get props => [post];
}

class UpdatePostEvent extends AddDeleteUpdatePostsEvent{
  late final Post post;
  UpdatePostEvent({required this.post});
  @override
  List <Object> get props => [post];
}

class DeletePostEvent extends AddDeleteUpdatePostsEvent{
  late final int postId;
  DeletePostEvent({required this.postId});
  @override
  List <Object> get props => [postId];
}
