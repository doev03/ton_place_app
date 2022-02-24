part of 'profile_bloc.dart';

@immutable
abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {
  final String id;
  final ProfileData profileData;

  const ProfileInitial(this.id, this.profileData);

  @override
  List<Object?> get props => [profileData];
}

class ProfileInProgress extends ProfileState {}

class ProfileFailure extends ProfileInProgress {}
