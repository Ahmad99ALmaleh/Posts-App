import 'package:clean_archeticture_posts_app/core/app_theme.dart';
import 'package:clean_archeticture_posts_app/features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/posts/presentation/bloc/add_delete_update_posts/add_delete_update_posts_bloc.dart';
import 'features/posts/presentation/pages/posts_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp( MyApp() );
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => di.sl<PostsBloc>()..add(GetAllPostsEvent())),
          BlocProvider(create: (_) => di.sl<AddDeleteUpdatePostsBloc>()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: appTheme,
          debugShowCheckedModeBanner: false,
          home: PostsPage(),
        ));
  }
}
