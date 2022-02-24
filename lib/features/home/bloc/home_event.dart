part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class HomeOpened extends HomeEvent {
  const HomeOpened();
}

class LikedPost extends HomeEvent {
  const LikedPost();
}
