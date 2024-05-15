import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vk_photo_new/bloc/photo_bloc.dart';
import 'package:vk_photo_new/repository/repository.dart';

class BlocPhotoView extends StatelessWidget {
  const BlocPhotoView({super.key});

  @override
  Widget build(BuildContext context) {
    final groups = BlocListener(listener:(context, state) => state);
    return Scaffold(
      body: ListView.builder(
        itemCount: groups.length,
        itemBuilder: (context, index) {
          return const Text('123');
        },
      ),
    );
  }
}
