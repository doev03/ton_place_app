import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ton_place/features/post/post_screen.dart';
import 'package:ton_place/features/post/repositories/post_repository.dart';

import 'bloc/post_bloc.dart';

class PostPage extends StatelessWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc(repository: PostRepository()),
      child: const PostScreen(),
    );
  }
}
