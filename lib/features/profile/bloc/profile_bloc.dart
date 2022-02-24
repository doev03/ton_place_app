import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:ton_place/features/profile/models/profile_data.dart';
import 'package:ton_place/features/profile/repositories/profile_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({required ProfileRepository repository})
      : _repository = repository,
        super(ProfileInProgress()) {
    on<ProfileOpened>(onProfileOpened);
  }

  final ProfileRepository _repository;

  void onProfileOpened(ProfileOpened event, Emitter<ProfileState> emit) async {
    try {
      final profile = await _repository.getUserData(event.id);

      return emit(ProfileInitial(event.id, profile));
    } catch (e) {
      rethrow;
    }
  }
}
