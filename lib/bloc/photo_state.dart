part of 'photo_bloc.dart';

@immutable
sealed class PhotoState {}

final class PhotoInitial extends PhotoState {}

final class GroupState extends PhotoState {
  final List<ModelView> data;
  

  GroupState({this.data = const []});
}

class GroupLoaded extends PhotoState {}
