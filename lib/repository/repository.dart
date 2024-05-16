import 'package:dio/dio.dart';
import 'package:vk_photo_new/conf/conf.dart';
import 'package:vk_photo_new/models/Group.dart';
import 'package:vk_photo_new/models/Photo.dart';

class Repository {
  //
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

  //
  Future fetchPhotos(String domain) async {
    var dio = Dio();
    List<Map> pics = [{}];
    var url =
        'http://api.vk.com/method/wall.get?domain=$domain&count=10&filter=all&access_token=$vkToken&v=5.131';

    final response = await dio.get(url,
        options: Options(
          headers: {
            "User-Agent":
                "VK_Music/4.2.1 (Android 5.1.1; SDK 22; x86_64; unknown Android SDK built for x86_64; en; 320x240)",
            "Content-Type": "application/json"
          },
        ));
         await Future<void>.delayed(const Duration(milliseconds: 500));
     if (response.statusCode == 200) {
       final data = Photo.fromJson(response.data['response']);
 
       data.items?.forEach((element) {
         if (element.markedAsAds == 0) {
           element.attachments?.forEach((attachments) {
              int? date = attachments.photo?.date;
              if (date != null) {
                var yesterday = DateTime.now().subtract(const Duration(days: 1));
                final DateTime vktime =
                    DateTime.fromMillisecondsSinceEpoch(date * 1000);
                final shortDate =
                    "${vktime.day}-${vktime.month}_${vktime.hour}-${vktime.minute}";
  
                if (vktime.isAfter(yesterday)) {
 4                pics.add({
                    'url': attachments.photo?.sizes?.last.url,
                    'date': shortDate
                  });
                }
              }
            });
          }
        });
      }
     return pics;
   }
 }

