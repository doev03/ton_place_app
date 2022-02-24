part of 'feed_bloc.dart';

@immutable
abstract class FeedEvent extends Equatable {
  const FeedEvent();

  @override
  List<Object?> get props => [];
}

class FeedOpened extends FeedEvent {
  final String section;
  final int startFrom;
  final bool suggestions;

  const FeedOpened(this.section, this.startFrom, this.suggestions);

  @override
  List<Object?> get props => [section, startFrom, suggestions];
}
