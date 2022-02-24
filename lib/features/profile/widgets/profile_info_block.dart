import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:ton_place/core/colors.dart';
import 'package:ton_place/core/models/models.dart';
import 'package:ton_place/core/widgets/user_photo.dart';
import 'package:ton_place/features/profile/models/profile_data.dart';
import 'package:ton_place/features/profile/widgets/online_active_widget.dart';
import 'package:ton_place/features/profile/widgets/profile_counter.dart';

class ProfileInfoBlock extends StatelessWidget {
  const ProfileInfoBlock({
    Key? key,
    required this.profileData,
    required this.user,
    required this.isMe,
  }) : super(key: key);

  final ProfileData profileData;
  final User user;
  final bool isMe;

  String getBirthdayDate(String bDate) {
    final bDateList = bDate.split('.').map((e) => int.parse(e)).toList();
    final bDateTime = DateTime(bDateList[2], bDateList[1], bDateList[0]);
    return DateFormat('d MMMM yyyy', 'RU').format(bDateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 56),
      decoration: BoxDecoration(
        color: SchemeColors.backgroundPrimary,
        borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserPhoto(photoId: user.photoId!.toInt(), photo: user.photo!, width: 82, height: 82, borderRadius: BorderRadius.circular(12)),
                const SizedBox(width: 16),
                Flexible(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${user.firstName!} ${user.lastName}',
                        style: TextStyle(
                          color: SchemeColors.foregroundPrimary,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          height: 28.0 / 20.0,
                        ),
                      ),
                      OnlineActiveWidget(lastUpdate: user.lastUpdate!),
                      if (isMe || user.status!.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 22,
                                height: 22,
                                child: SvgPicture.asset('assets/im_icon.svg', color: SchemeColors.foregroundTertiary),
                              ),
                              const SizedBox(width: 8),
                              Flexible(
                                child: Text(
                                  isMe && user.status!.isEmpty ? 'Изменить статус' : user.status!,
                                  style: TextStyle(
                                    color: SchemeColors.foregroundPrimary,
                                    fontSize: 16,
                                    height: 22.0 / 16.0,
                                  ),
                                ),
                              ),
                              if (isMe) const SizedBox(width: 8),
                              if (isMe)
                                SizedBox(
                                  width: 8,
                                  height: 16,
                                  child: SvgPicture.asset('assets/arrow_right.svg', color: SchemeColors.foregroundPrimary),
                                )
                            ],
                          ),
                        )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Дата рождения:',
                  style: TextStyle(color: SchemeColors.foregroundPrimary, fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 8),
                Text(
                  getBirthdayDate(user.bDate!),
                  style: TextStyle(color: SchemeColors.foregroundPrimary, fontSize: 16),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 16),
            child: Row(
              children: [
                Flexible(
                  child: ProfileCounter(
                    count: profileData.posts!.length,
                    label: 'публикации',
                  ),
                ),
                const SizedBox(width: 12),
                Flexible(
                  child: ProfileCounter(
                    count: user.followers!,
                    label: 'подписчиков',
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 12),
                Flexible(
                  child: ProfileCounter(
                    count: user.followed!,
                    label: 'подписок',
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
