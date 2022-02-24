part of 'group_bloc.dart';

@immutable
abstract class GroupEvent extends Equatable {
  const GroupEvent();

  @override
  List<Object?> get props => [];
}

class GroupOpened extends GroupEvent {
  const GroupOpened(this.id);

  final String id;

  @override
  List<Object?> get props => [id];
}
