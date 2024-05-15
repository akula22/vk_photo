import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
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
       emit(GroupState(groups: groups));
    });
  }

  late final Repository _groupsRepository;

  // _onLoadGroups(GroupEvent event, Emitter<GroupState> emit) async {
  //   final groups = await _groupsRepository.fetchGroups();
  //   emit(GroupState(groups: groups));
  // }
}
