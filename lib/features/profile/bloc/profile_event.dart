part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class ProfileOpened extends ProfileEvent {
  const ProfileOpened(this.id);

  final String id;

  @override
  List<Object?> get props => [id];
}
