import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:ton_place/features/feed/repository/feed_repository.dart';

import '../models/feed_data.dart';

part 'feed_event.dart';

part 'feed_state.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  FeedBloc({required FeedRepository repository}) : _repository = repository, super(FeedInProgress()) {
    on<FeedOpened>(onFeedOpened);
  }

  final FeedRepository _repository;

  void onFeedOpened(FeedOpened event, Emitter<FeedState> emit) async {
    try {
      final feed = await _repository.feed(event.section, event.startFrom, event.suggestions);

      return emit(FeedInitial(feed));
    } catch (e) {
      rethrow;
    }
  }
}
