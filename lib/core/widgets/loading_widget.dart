import 'package:clean_archeticture_posts_app/core/app_theme.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: SizedBox(
          height: 30.0,
          width: 30.0,
          child: CircularProgressIndicator(
            color: secondaryColor,
          ),
        ),
      ),
    );
  }
}
