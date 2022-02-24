import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:ton_place/features/home/models/init_data.dart';
import 'package:ton_place/features/home/repositories/home_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required HomeRepository repository})
      : _repository = repository,
        super(HomeInProgress()) {
    on<HomeOpened>(_onHomeOpened);
  }

  final HomeRepository _repository;

  void _onHomeOpened(
    HomeOpened event,
    Emitter<HomeState> emit,
  ) async {
    if (state is! HomeInitial || (state as HomeInitial).initData.user == null) {
      try {
        final data = await _repository.init();

        return emit(HomeInitial(data));
      } catch (e) {
        return emit(HomeFailure('Не удалось загрузить страницу'));
        rethrow;
      }
    }
  }
}
