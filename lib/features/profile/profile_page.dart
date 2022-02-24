import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ton_place/features/profile/bloc/profile_bloc.dart';
import 'package:ton_place/features/profile/profile_screen.dart';
import 'package:ton_place/features/profile/repositories/profile_repository.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(repository: ProfileRepository())..add(ProfileOpened(id)),
      child: const ProfileScreen(),
    );
  }
}
