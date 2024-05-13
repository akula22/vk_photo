import 'package:flutter/material.dart';
import 'package:vk_photo_new/repository/repository.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'views/bloc_photo_view.dart';
// import 'photo/views/photo_view.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  //win manager resize
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
    WindowOptions windowOptions = const WindowOptions(
    size: Size(1800, 1000),
    windowButtonVisibility: false,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
    await windowManager.setMaximizable(false);
    await windowManager.setResizable(false);
  });
  // runApp(const ProviderScope(child: PhotoApp())); //  riverpod
    runApp(const PhotoApp()); //  bloc

}

class PhotoApp extends StatelessWidget {
  const PhotoApp({super.key});

  @override
  Widget build(BuildContext context) {
    var q = Repository.fetchGroups();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      // home: GetxPhotoView(),

      // home: const PhotoView(), /* riverpod */
      home: const BlocPhotoView(),
    );
  }
}
