import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ton_place/core/colors.dart';
import 'package:ton_place/features/feed/feed_page.dart';
import 'package:ton_place/features/group/group_page.dart';
import 'package:ton_place/features/home/failure_screen.dart';
import 'package:ton_place/features/home/widgets/bottom_menu_item.dart';
import 'package:ton_place/features/other/other_page.dart';
import 'package:ton_place/features/profile/profile_page.dart';

import 'bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget bodyPage = const FeedPage();
  final selectedPageNotifier = ValueNotifier(0);

  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: SchemeColors.backgroundZero,
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state is HomeInProgress) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is HomeFailure) {
              return FailureScreen(
                callback: () {
                  context.read<HomeBloc>().add(const HomeOpened());
                },
              );
            }
            if (state is HomeInitial) {
              final bottomMenuItemWidth = MediaQuery.of(context).size.width / 5;
              return SafeArea(
                child: Column(
                  children: [
                    Flexible(
                      child: Navigator(
                        key: navigatorKey,
                        initialRoute: 'feed',
                        onGenerateRoute: (routeSettings) {
                          List<String>? arguments;
                          if (routeSettings.arguments != null) {
                            arguments = routeSettings.arguments as List<String>;
                          }

                          switch (routeSettings.name) {
                            case 'feed':
                              return MaterialPageRoute(builder: (context) => const FeedPage());
                            case 'other':
                              return MaterialPageRoute(builder: (context) => const OtherPage());
                            case 'profile':
                              return MaterialPageRoute(builder: (context) => ProfilePage(id: arguments![0]));
                            case 'group':
                              return MaterialPageRoute(builder: (context) => GroupPage(id: arguments![0]));
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(color: SchemeColors.backgroundPrimary, border: Border(top: BorderSide(color: Colors.white.withOpacity(0.08), width: 0.5))),
                      child: ValueListenableBuilder(
                        valueListenable: selectedPageNotifier,
                        builder: (context, value, child) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BottomMenuItem(
                                icon: 'assets/feed_icon.svg',
                                label: 'Новости',
                                width: bottomMenuItemWidth,
                                isActive: value == 0,
                                onTap: () {
                                  navigatorKey.currentState!.pushNamedAndRemoveUntil('feed', ModalRoute.withName('feed'));
                                  selectedPageNotifier.value = 0;
                                },
                              ),
                              BottomMenuItem(
                                icon: 'assets/groups_icon.svg',
                                label: 'Сообщества',
                                width: bottomMenuItemWidth,
                                isActive: value == 1,
                                onTap: () {},
                              ),
                              BottomMenuItem(
                                icon: 'assets/im_icon.svg',
                                label: 'Сообщения',
                                width: bottomMenuItemWidth,
                                isActive: value == 2,
                                dialogsCount: state.initData.newDialogs!,
                                onTap: () {},
                              ),
                              BottomMenuItem(
                                icon: 'assets/notify_icon.svg',
                                label: 'Обновления',
                                width: bottomMenuItemWidth,
                                isActive: value == 3,
                                hasSubscriptions: state.initData.hasSubscription!,
                                onTap: () {},
                              ),
                              BottomMenuItem(
                                icon: 'assets/other_icon.svg',
                                label: 'Профиль',
                                width: bottomMenuItemWidth,
                                isActive: value == 4,
                                onTap: () {
                                  navigatorKey.currentState!.pushNamedAndRemoveUntil('other', ModalRoute.withName('other'));
                                  selectedPageNotifier.value = 4;
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}