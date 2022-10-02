import 'package:equatable/equatable.dart';

class Post extends Equatable{

  late final int? id;
  late final String title;
  late final String body;

  Post({ this.id,required this.title,required this.body});

  @override
  // TODO: implement props
  List<Object?> get props => [id,title,body];

}