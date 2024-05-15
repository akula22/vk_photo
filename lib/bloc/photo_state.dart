part of 'photo_bloc.dart';

@immutable
sealed class PhotoState {}

final class PhotoInitial extends PhotoState {}

final class GroupState extends PhotoState {
  final List<Group> groups;

  GroupState({this.groups = const []});
}
