import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ton_place/features/feed/bloc/feed_bloc.dart';
import 'package:ton_place/features/feed/feed_screen.dart';
import 'package:ton_place/features/feed/repository/feed_repository.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FeedBloc>(
      create: (context) => FeedBloc(repository: FeedRepository())..add(const FeedOpened('following', 0, false)),
      child: const FeedScreen(),
    );
  }
}
