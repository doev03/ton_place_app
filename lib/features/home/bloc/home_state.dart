part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial(this.initData);

  final InitData initData;

  @override
  List<Object?> get props => [initData];
}

class HomeInProgress extends HomeState {

}

class HomeFailure extends HomeState {
  const HomeFailure(this.errorDescription);

  final String errorDescription;
}
