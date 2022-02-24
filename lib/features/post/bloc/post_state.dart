part of 'post_bloc.dart';

@immutable
abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object?> get props => [];
}

class PostInitial extends PostState {}

class LikeSuccessful extends PostState {
  final int likesCount;

  const LikeSuccessful(this.likesCount);

  @override
  List<Object?> get props => [likesCount];
}

class LikeFailure extends PostState {}
