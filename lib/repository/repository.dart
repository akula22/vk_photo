import 'package:dio/dio.dart';
import 'package:vk_photo_new/conf/conf.dart';
import 'package:vk_photo_new/models/Group.dart';

class Repository {
  Future<List<Group>> fetchGroups() async {
    var dio = Dio();
    try {
      final response = await dio.get(groupApiUrl);
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((json) => Group.fromJson(json))
            .toList();
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
