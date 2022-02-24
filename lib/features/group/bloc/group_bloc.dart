import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../models/group_data.dart';
import '../repositories/group_repository.dart';

part 'group_event.dart';

part 'group_state.dart';

class GroupBloc extends Bloc<GroupEvent, GroupState> {
  GroupBloc({required GroupRepository repository})
      : _repository = repository,
        super(GroupInProgress()) {
    on<GroupEvent>((event, emit) {

    });
  }

  final GroupRepository _repository;

  void onGroupOpened(GroupOpened event, Emitter<GroupState> emit) async {
    try {
      final group = await _repository.getGroupData(event.id);

      return emit(GroupInitial(event.id, group));
    } catch (e) {
      rethrow;
    }
  }
}
