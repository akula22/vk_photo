part of 'photo_bloc.dart';

@immutable
sealed class PhotoState {}

final class PhotoInitial extends PhotoState {}

class PhotoLoading extends PhotoState {}

class PhotoLoaded extends PhotoState {
  final List<ModelView> data;

  PhotoLoaded({required this.data});
}

class PhotoError extends PhotoState {
  final String error;
  PhotoError(this.error);
}