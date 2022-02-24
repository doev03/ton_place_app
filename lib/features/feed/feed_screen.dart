import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ton_place/core/colors.dart';
import 'package:ton_place/core/models/models.dart';
import 'package:ton_place/features/feed/widgets/feed_header.dart';
import 'package:ton_place/features/post/widgets/post_widget.dart';

import 'bloc/feed_bloc.dart';
import 'models/feed_data.dart' show User, Group;

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeedBloc, FeedState>(
      builder: (context, state) {
        if (state is FeedInitial) {
          return Container(
            color: SchemeColors.backgroundZero,
            child: Column(
              children: [
                const FeedHeader(),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.feedData.feed!.length,
                    itemBuilder: (context, i) {
                      final post = state.feedData.posts![state.feedData.feed![i].object.toString()]!;

                      User? user;
                      Group? group;
                      if (post.ownerId! < 0) {
                        group = state.feedData.groups![post.ownerId!.abs().toString()];
                      } else {
                        user = state.feedData.users![post.ownerId.toString()]!;
                      }

                      return PostWidget(user: user, group: group, post: post);
                    },
                  ),
                ),
              ],
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
