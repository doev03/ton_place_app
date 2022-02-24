import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ton_place/core/colors.dart';
import 'package:ton_place/core/constants.dart';
import 'package:ton_place/core/widgets/app_back_button.dart';
import 'package:ton_place/core/widgets/user_photo.dart';
import 'package:url_launcher/url_launcher.dart';

import 'bloc/group_bloc.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupBloc, GroupState>(
      builder: (context, state) {
        if (state is GroupInitial) {
          final group = state.groupData.groups![state.id];
          final canPost = state.groupData.canPost!;

          return Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(top: 56),
                      decoration: BoxDecoration(
                        color: SchemeColors.backgroundPrimary,
                        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16)),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                            child: Row(
                              children: [
                                UserPhoto(photoId: group!.photoId!.toInt(), photo: group.photo!, width: 82, height: 82, borderRadius: BorderRadius.circular(12)),
                                const SizedBox(width: 16),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      group.name!,
                                      style: TextStyle(
                                        color: SchemeColors.foregroundPrimary,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800,
                                        height: 28.0 / 20.0,
                                      ),
                                    ),
                                    if (canPost || group.status!.isNotEmpty)
                                      GestureDetector(
                                        onTap: canPost ? () {} : null,
                                        child: Padding(
                                          padding: const EdgeInsets.only(top: 4),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: 22,
                                                height: 22,
                                                child: SvgPicture.asset('assets/im_icon.svg', color: SchemeColors.foregroundTertiary),
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                canPost && group.status!.isEmpty ? 'Изменить статус' : group.status!,
                                                style: TextStyle(
                                                  color: SchemeColors.foregroundPrimary,
                                                  fontSize: 16,
                                                  height: 22.0 / 16.0,
                                                ),
                                              ),
                                              if (canPost) const SizedBox(width: 8),
                                              if (canPost)
                                                SizedBox(
                                                  width: 8,
                                                  height: 16,
                                                  child: SvgPicture.asset('assets/arrow_right.svg', color: SchemeColors.foregroundPrimary),
                                                )
                                            ],
                                          ),
                                        ),
                                      )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Описание:',
                                  style: TextStyle(
                                    color: SchemeColors.foregroundPrimary,
                                    fontSize: 14,
                                    height: 18.0 / 14.0,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  group.description!,
                                  style: TextStyle(
                                    color: SchemeColors.foregroundPrimary,
                                    fontSize: 17,
                                    height: 23.0 / 17.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 12),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Сайт:',
                                  style: TextStyle(
                                    color: SchemeColors.foregroundPrimary,
                                    fontSize: 14,
                                    height: 18.0 / 14.0,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                RichText(
                                  text: TextSpan(
                                    text: group.description!,
                                    style: TextStyle(
                                      color: SchemeColors.foregroundPrimary,
                                      fontSize: 17,
                                      height: 23.0 / 17.0,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        final matcher = RegExp(urlRegExp);
                                        final match = matcher.stringMatch(group.link!);

                                        String url = '';
                                        if (match != null && match.length == group.link!.length) {
                                          url = group.link!;
                                        } else {
                                          url = 'https://ton.place/${group.link}';
                                        }

                                        if (await canLaunch(url)) {
                                          await launch(url);
                                        }
                                      },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 100,
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
