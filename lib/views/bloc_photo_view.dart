import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vk_photo_new/bloc/photo_bloc.dart';
import 'package:vk_photo_new/repository/repository.dart';

class BlocPhotoView extends StatelessWidget {
  const BlocPhotoView({super.key});

  @override
  Widget build(BuildContext context) {
    final groups = context.select((PhotoBloc bloc) => bloc.state.groups);
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: FloatingActionButton(onPressed:() =>  context.read<PhotoBloc>().add(GroupEvent()))),
          Expanded(
          child: ListView.builder(
            itemCount: groups.length,
            itemBuilder: (context, index) {
              return  Text(groups[index].title ?? '');
            },
          ),
        )],
      ),
    );
  }
}
