import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ton_place/core/colors.dart';
import 'package:ton_place/core/widgets/user_photo.dart';
import 'package:ton_place/features/home/bloc/home_bloc.dart';
import 'package:ton_place/features/other/widgets/cell_button.dart';
import 'package:ton_place/features/other/widgets/other_header.dart';

class OtherScreen extends StatelessWidget {
  const OtherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const OtherHeader(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    return GestureDetector(
                      onTap: () {
                        final initData = (context.read<HomeBloc>().state as HomeInitial).initData;
                        Navigator.pushNamed(context, 'profile', arguments: [initData.user!.id.toString()]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            UserPhoto(
                              photoId: (state as HomeInitial).initData.user!.photoId!,
                              photo: state.initData.user!.photo!,
                              borderRadius: BorderRadius.circular(12),
                              width: 52,
                              height: 52,
                            ),
                            const SizedBox(width: 16),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${state.initData.user!.firstName} ${state.initData.user!.lastName}', style: TextStyle(color: SchemeColors.foregroundPrimary, fontSize: 18)),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('Перейти в профиль', style: TextStyle(color: SchemeColors.foregroundTertiary, fontSize: 16)),
                                    const SizedBox(width: 8),
                                    SizedBox(width: 8, height: 16, child: SvgPicture.asset('assets/arrow_right.svg', color: SchemeColors.foregroundTertiary)),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 16),
                Column(
                  children: [
                    CellButton(
                      title: 'Баланс',
                      icon: 'assets/balance.svg',
                      onTap: () {},
                    ),
                    const SizedBox(height: 16),
                    CellButton(
                      title: 'Рефералы',
                      icon: 'assets/friends.svg',
                      onTap: () {},
                    ),
                    const SizedBox(height: 16),
                    CellButton(
                      title: 'Ред. профиль',
                      icon: 'assets/edit.svg',
                      onTap: () {},
                    ),
                    const SizedBox(height: 16),
                    CellButton(
                      title: 'Настройки',
                      icon: 'assets/settings.svg',
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
