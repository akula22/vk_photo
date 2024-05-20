// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'photo_bloc.dart';

@immutable
sealed class PhotoState {}

final class PhotoInitial extends PhotoState {}

class PhotoLoading extends PhotoState {}

// ignore: must_be_immutable
class TotalPhotos extends PhotoState {
  int totalPhotos;
  TotalPhotos(
    this.totalPhotos,
  );
}

class PhotoLoaded extends PhotoState {
  final List<ModelView> data;

  PhotoLoaded({required this.data});
}

class PhotoError extends PhotoState {
  final String error;
  PhotoError(this.error);
}