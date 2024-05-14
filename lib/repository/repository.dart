import 'package:dio/dio.dart';
import 'package:vk_photo_new/conf/conf.dart';
import 'package:vk_photo_new/models/Group.dart';

class Repository {
  static fetchGroups() async {
    var dio = Dio();
    try {
      final response = await dio.get(groupApiUrl);
      if (response.statusCode == 200) {
        return (response.data as List).map((e) => Group.fromJson(e));
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
