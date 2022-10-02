import 'package:clean_archeticture_posts_app/features/posts/presentation/pages/posts_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/util/snackbar_message.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../domain/entities/posts.dart';
import '../bloc/add_delete_update_posts/add_delete_update_posts_bloc.dart';
import '../widgets/post_add_update_page/form_widget.dart';



class PostAddUpdatePage extends StatelessWidget {
  final Post? post;
  final bool isUpdatePost;

   PostAddUpdatePage({this.post,required this.isUpdatePost});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar(){
    return  AppBar(
      title: Text(
        isUpdatePost ? "Edit Post" : "Add Post",
      ),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
            padding: EdgeInsets.all(10),
            child:
            BlocConsumer<AddDeleteUpdatePostsBloc, AddDeleteUpdatePostsState>(
              listener: (context, state) {
                if (state is MessageAddDeleteUpdatePostState) {
                  SnackBarMessage().showSuccessSnackBar(
                      message: state.message, context: context);
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => PostsPage()),
                          (route) => false);
                } else if (state is ErrorAddDeleteUpdatePostState) {
                  SnackBarMessage().showErrorSnackBar(
                      message: state.message, context: context);
                }
              },
              builder: (context, state) {
                if (state is LoadingAddDeleteUpdatePostState) {
                  return LoadingWidget();
                }

                return FormWidget(
                    isUpdatePost: isUpdatePost, post: isUpdatePost ? post : null);
              },
            )),
      ),
    );
  }


}
