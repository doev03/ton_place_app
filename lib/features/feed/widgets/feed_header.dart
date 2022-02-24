import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ton_place/core/widgets/user_photo.dart';
import 'package:ton_place/features/home/bloc/home_bloc.dart';

import '../../../core/colors.dart';

class FeedHeader extends StatelessWidget {
  const FeedHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: state is HomeInitial ? () {
                  Navigator.pushNamed(context, 'profile', arguments: [state.initData.user!.id.toString()]);
                } : null,
                child: Container(
                  width: 48,
                  height: 48,
                  margin: const EdgeInsets.only(left: 4),
                  padding: const EdgeInsets.only(left: 12),
                  alignment: Alignment.center,
                  child: UserPhoto(
                    photoId: (state is HomeInitial) ? state.initData.user!.photoId! : 0,
                    photo: (state is HomeInitial) ? state.initData.user!.photo! : '',
                    width: 34,
                    height: 34,
                    shape: BoxShape.circle,
                  ),
                ),
              );
            },
          ),
          Text(
            'Новости',
            style: TextStyle(color: SchemeColors.foregroundPrimary, fontSize: 20, fontWeight: FontWeight.w800),
          ),
          Container(
            width: 48,
            height: 48,
            alignment: Alignment.center,
            margin: const EdgeInsets.only(right: 4),
            child: SizedBox(
              height: 28,
              width: 28,
              child: SvgPicture.asset(
                'assets/search.svg',
                color: RootColors.tint,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
