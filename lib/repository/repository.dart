import 'package:dio/dio.dart';
import 'package:vk_photo_new/conf/conf.dart';
import 'package:vk_photo_new/models/Group.dart';

class Repository {
  static fetchGroups() async {
    var dio = Dio();  
    final response = await dio.get(groupApiUrl);
    if(response.statusCode == 200){
      final groups = response.data;
      // List data = Group.fromJson(response.data) as List;

      // print(groups[0]['title'].toString());
    }
  }
}