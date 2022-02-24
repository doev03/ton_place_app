part of 'group_bloc.dart';

@immutable
abstract class GroupState extends Equatable {
  const GroupState();

  @override
  List<Object?> get props => [];
}

class GroupInitial extends GroupState {
  final String id;
  final GroupData groupData;

  const GroupInitial(this.id, this.groupData);

  @override
  List<Object?> get props => [id, groupData];
}

class GroupInProgress extends GroupState {}

class GroupFailure extends GroupInProgress {}
