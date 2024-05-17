import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vk_photo_new/models/ModelView.dart';
import 'package:vk_photo_new/models/Photo.dart';
import 'package:vk_photo_new/repository/repository.dart';

import '../models/Group.dart';

part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<GroupEvent, GroupState> {
  PhotoBloc({required Repository groupsRepository})
      : _groupsRepository = groupsRepository,
        super(GroupState()) {
         
    // ignore: void_checks
    on<GroupEvent>((GroupEvent event, Emitter<GroupState> emit) async* {
      List<ModelView> data = [];
      final groups = await _groupsRepository.fetchGroups();
      for (var group in groups) {
        print(group.domain);
        await Future.delayed(const Duration(milliseconds: 500));

        // запрос в вк
        var res = await Repository().fetchPhotos(group.domain ?? '');
        int colPhotoDomain = res.length;
        int timeAnimation = colPhotoDomain * 100;

        // формируем данные для вьюхи
        data.add(ModelView(
            title: group.title ?? 'none',
            domain: group.domain ?? 'none',
            colPhotoDomain: colPhotoDomain,
            timeAnimation: timeAnimation));
            yield GroupState(data: data);
        // emit(GroupState(data: data));
      }
    });
  }

  // Stream<GroupState> mapEventToState(GroupEvent event) async* {
  //   List<ModelView> data = [];
  //   final groups = await _groupsRepository.fetchGroups();
  //   for (var group in groups) {
  //     await Future.delayed(const Duration(milliseconds: 500));

  //     // запрос в вк
  //     var res = await Repository().fetchPhotos(group.domain ?? '');
  //     int colPhotoDomain = res.length;
  //     int timeAnimation = colPhotoDomain * 100;

  //     //  формируем данные для вьюхи
  //     data.add(ModelView(
  //         title: group.title ?? 'none',
  //         domain: group.domain ?? 'none',
  //         colPhotoDomain: colPhotoDomain,
  //         timeAnimation: timeAnimation));
  //     yield GroupState(data: data);
  //   }
  // }

  late final Repository _groupsRepository;

  // _onLoadGroups(GroupEvent event, Emitter<GroupState> emit) async {
  //   final groups = await _groupsRepository.fetchGroups();
  //   emit(GroupState(groups: groups));
  // }
}
