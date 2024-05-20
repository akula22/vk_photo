import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vk_photo_new/models/ModelView.dart';
import 'package:vk_photo_new/repository/repository.dart';

part 'photo_event.dart';
part 'photo_state.dart';

class PhotoBloc extends Bloc<PhotoEvent, PhotoState> {
  final Repository groupsRepository;
  PhotoBloc({required this.groupsRepository}) : super(PhotoInitial()) {
    // ignore: void_checks
    on<LoadPhoto>(( event, emit) async {
      //  показываем загрузку
      emit(PhotoLoading());

      List<ModelView> data = [];

      try {
        final groups = await groupsRepository.fetchGroups();
        for (var group in groups) {
          print(group.domain);
          await Future.delayed(const Duration(milliseconds: 500));

          // запрос в вк
          var res = await Repository().fetchPhotos(group.domain ?? '');
          int colPhotoDomain = res.length;
          int timeAnimation = colPhotoDomain * 200;

          // формируем данные для вьюхи
          data.add(ModelView(
              title: group.title ?? 'none',
              domain: group.domain ?? 'none',
              colPhotoDomain: colPhotoDomain,
              timeAnimation: timeAnimation));

              //  save photo
              photoSave();

          emit(PhotoLoaded(data: data));
        }
         emit(PhotoLoaded(data: data));
      } catch (error) {
        emit(PhotoError(error.toString()));
      }
    });
  }
}



void photoSave() async {
  String os = Platform.operatingSystem; //in your code]
  final String filePath;
  //  Если на винде
  if (os == 'windows') {
     filePath = '';
  } else if (os == 'linux') {
    filePath = '/home/akula22/Pictures';
  } 
}