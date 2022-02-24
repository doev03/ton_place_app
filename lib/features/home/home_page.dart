import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ton_place/features/home/repositories/home_repository.dart';

import 'bloc/home_bloc.dart';
import 'home_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(repository: HomeRepository())..add(const HomeOpened()),
      child: const HomeScreen(),
    );
  }
}
