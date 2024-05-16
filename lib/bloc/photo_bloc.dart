import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vk_photo_new/models/Photo.dart';
import 'package:vk_photo_new/repository/repository.dart';

import '../models/Group.dart';

part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<GroupEvent, GroupState> {
  PhotoBloc({required Repository groupsRepository})
      : _groupsRepository = groupsRepository,
        super(GroupState()) {
    on<GroupEvent>((GroupEvent event, Emitter<GroupState> emit) async {
      final groups = await _groupsRepository.fetchGroups();
      //
      for (var group in groups) {
        await Future.delayed(const Duration(milliseconds: 500));
        var res = await Repository().fetchPhotos(group.domain ?? '');
      }
      emit(GroupState(groups: groups));
    });
  }

  late final Repository _groupsRepository;

  // _onLoadGroups(GroupEvent event, Emitter<GroupState> emit) async {
  //   final groups = await _groupsRepository.fetchGroups();
  //   emit(GroupState(groups: groups));
  // }
}
