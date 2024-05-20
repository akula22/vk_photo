part of 'photo_bloc.dart';

@immutable
sealed class PhotoEvent {}
 

class LoadPhoto extends PhotoEvent {}

