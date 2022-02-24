part of 'post_bloc.dart';

@immutable
abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object?> get props => [];
}

class PostOpened extends PostEvent {
  const PostOpened(this.postId);

  final int postId;

  @override
  List<Object?> get props => [postId];
}

class LikedPost extends PostEvent {
  const LikedPost(this.postId);

  final int postId;

  @override
  List<Object?> get props => [postId];
}
