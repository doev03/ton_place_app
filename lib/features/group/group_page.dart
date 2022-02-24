import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ton_place/features/group/bloc/group_bloc.dart';
import 'package:ton_place/features/group/repositories/group_repository.dart';

import 'group_screen.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({Key? key, required this.id}) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GroupBloc(repository: GroupRepository())..add(GroupOpened(id)),
      child: const GroupScreen(),
    );
  }
}
