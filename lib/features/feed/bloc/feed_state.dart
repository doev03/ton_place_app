part of 'feed_bloc.dart';

@immutable
abstract class FeedState extends Equatable {
  const FeedState();

  @override
  List<Object?> get props => [];
}

class FeedInitial extends FeedState {
  final FeedData feedData;

  const FeedInitial(this.feedData);

  @override
  List<Object?> get props => [feedData];
}

class FeedInProgress extends FeedState {}

class FeedFailure extends FeedState {}
