import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vk_photo_new/bloc/photo_bloc.dart';
import 'package:vk_photo_new/views/bloc_photo_view2.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'repository/repository.dart';
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
  //nout test
}

class PhotoApp extends StatelessWidget {
  const PhotoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create:(context) => Repository(),
      child: MultiBlocProvider(
        providers: [ 
          BlocProvider(create:(context) => PhotoBloc(groupsRepository:RepositoryProvider.of<Repository>(context)),),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          // home: GetxPhotoView(),
        
          // home: const PhotoView(), /* riverpod */
          home: const BlocPhotoView2(),
        ),
      ),
    );
  }
}
