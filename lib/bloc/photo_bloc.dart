import 'dart:io';

import 'package:dio/dio.dart';
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
   
    on<LoadPhoto>((event, emit) async {
      //  показываем загрузку
      emit(PhotoLoading());

      List<ModelView> data = [];
      int totalPhotos = 0;

      try {
        final groups = await groupsRepository.fetchGroups();
        for (var group in groups) {
          print(group.domain);
          await Future.delayed(const Duration(milliseconds: 500));

          // запрос в вк
          var res = await Repository().fetchPhotos(group.domain ?? '');
          int colPhotoDomain = res.length;
          int timeAnimation = colPhotoDomain * 200;
          totalPhotos = totalPhotos + colPhotoDomain;

      
          // формируем данные для вьюхи
          data.add(ModelView(
              title: group.title ?? 'none',
              domain: group.domain ?? 'none',
              colPhotoDomain: colPhotoDomain - 1,
              totalPhotos: totalPhotos,
              timeAnimation: timeAnimation));

          int num = 0;
          for (var el in res) {
            // await Future<void>.delayed(const Duration(milliseconds: 500));
            var url = el['url'];
            var date = el['date'];
            num++;

            if (url != null) {
              photoSave(url, group.domain ?? 'none', date, num);
            }
          }

          emit(PhotoLoaded(data: data));
        }
        emit(PhotoLoaded(data: data));
      } catch (error) {
        emit(PhotoError(error.toString()));
      }
      
    });
    
  }
 
}

void photoSave(url, domain, date, num) async {
  String os = Platform.operatingSystem; //in your code]
  String filePath = 'C:/Users/akula22/Pictures/';
  //  Если на винде
  if (os == 'windows') {
    filePath = 'C:/Users/akula22/Pictures/';
  } else if (os == 'linux') {
    filePath = '/home/akula22/Pictures/';
  }

  var dio = Dio();
  try {
    Response response = await dio.get(
      url,
      options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          validateStatus: (status) {
            return status! < 500;
          }),
    );
    await Future<void>.delayed(const Duration(milliseconds: 200));
    File file = File("$filePath/$domain-$date-$num.jpg");
    var raf = file.openSync(mode: FileMode.write);

    raf.writeFromSync(response.data);

    await raf.close();
  } catch (e) {
    print(e);
  }
}
