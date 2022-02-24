import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ton_place/core/colors.dart';
import 'package:ton_place/core/models/models.dart';
import 'package:ton_place/core/widgets/user_photo.dart';
import 'package:ton_place/features/post/widgets/post_widget.dart';
import 'package:ton_place/features/home/bloc/home_bloc.dart';
import 'package:ton_place/features/profile/bloc/profile_bloc.dart';
import 'package:ton_place/features/profile/widgets/profile_info_block.dart';

import '../../core/widgets/app_back_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        if (state is ProfileInitial) {
          final user = state.profileData.users![state.id];

          final isMe = user!.id == (context.read<HomeBloc>().state as HomeInitial).initData.user!.id;

          return Stack(
            children: [
              RefreshIndicator(
                onRefresh: () async {
                  context.read<ProfileBloc>().add(ProfileOpened(user.id.toString()));
                },
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfileInfoBlock(profileData: state.profileData, user: user, isMe: isMe),
                      const SizedBox(height: 16),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                            color: SchemeColors.backgroundPrimary,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            children: [
                              UserPhoto(photoId: user.photoId!, photo: user.photo!, borderRadius: BorderRadius.circular(12), width: 42, height: 42),
                              const SizedBox(width: 12),
                              Flexible(
                                child: Container(
                                  constraints: const BoxConstraints(minHeight: 44),
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(color: SchemeColors.backgroundSecondary, borderRadius: BorderRadius.circular(16)),
                                  child: Text(
                                    'Новая запись',
                                    style: TextStyle(color: SchemeColors.foregroundTertiary, fontSize: 18, height: 24.0 / 18.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ListView.builder(
                        itemCount: state.profileData.posts!.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, i) {
                          final post = state.profileData.posts![i];

                          User? user;
                          Group? group;
                          if (post.ownerId! < 0) {
                            group = state.profileData.groups![post.ownerId!.abs().toString()];
                          } else {
                            user = state.profileData.users![post.ownerId.toString()]!;
                          }

                          return PostWidget(user: user, group: group, post: post);
                        },
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 56,
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [SchemeColors.backgroundPrimary, const Color.fromRGBO(21, 28, 41, 0)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 4, top: 4),
                  child: AppBackButton(),
                ),
              ),
            ],
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
