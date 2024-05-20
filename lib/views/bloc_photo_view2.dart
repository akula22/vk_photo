import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vk_photo_new/bloc/photo_bloc.dart';
import 'package:vk_photo_new/repository/repository.dart';
import 'package:url_launcher/url_launcher.dart';

class BlocPhotoView2 extends StatelessWidget {
  const BlocPhotoView2({super.key});

  @override
  Widget build(BuildContext context) {
    // final data = context.select((PhotoBloc bloc) => bloc.state.data);

    return BlocProvider(
      create: (context) =>
          PhotoBloc(groupsRepository: Repository())..add(LoadPhoto()),
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  hoverColor: const Color.fromARGB(121, 197, 10, 10),
                  onPressed: () => PhotoBloc(groupsRepository: Repository())
                    ..add(LoadPhoto()),
                  icon: const Icon(
                    Icons.touch_app,
                    color: Colors.yellowAccent,
                    size: 36,
                  )),
              const Text(
                'VK ',
                style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontWeight: FontWeight.bold),
              ),
              Image.asset('assets/images/logo_small.png'),
              const Text(
                ' PHOTO',
                style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 20),
            ],
          ),
        ),
        body: BlocBuilder<PhotoBloc, PhotoState>(
          builder: (context, state) {
            if (state is PhotoLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PhotoLoaded) {
              final data = state.data;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 16)
                        .copyWith(bottom: 5),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.circular(6)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        if (index == 0)
                          Stack(children: [
                           
                            Padding(
                              padding: const EdgeInsets.only(left: 393, top: 0),
                              child: Text('Всего фоток: ${data[index].totalPhotos}',
                                  style: const TextStyle(
                                      fontSize: 18, color: Colors.amber)),
                            ),
                          ]),
                        Expanded(
                          flex: 2,
                          child: GestureDetector(
                              onTap: () {
                                final Uri url = Uri.parse(
                                    'https://vk.com/${data[index].domain}');
                                _launchInBrowser(url);
                              },
                              child: Text(
                                data[index].title,
                                style: const TextStyle(
                                    decoration: TextDecoration.underline),
                              )),
                        ),
                        Expanded(
                            flex: 1,
                            child: Text(data[index].colPhotoDomain.toString())),
                        Expanded(
                          flex: 10,
                          child: FAProgressBar(
                            currentValue: data[index].colPhotoDomain.toDouble(),
                            maxValue: 30,
                            // displayText: '%',
                            size: 10,
                            progressColor: Colors.green.shade500,
                            animatedDuration: Duration(
                                milliseconds: data[index].timeAnimation),
                            borderRadius: BorderRadius.circular(5),
                            backgroundColor: Colors.grey.shade800,
                            // displayTextStyle: const TextStyle(fontSize: 8, color: Colors.white, fontWeight: FontWeight.bold),
                            // changeColorValue: 50,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else if (state is PhotoError) {
              return Text(state.error);
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

Future<void> _launchInBrowser(Uri url) async {
  if (!await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  )) {
    throw Exception('Could not launch $url');
  }
}

Future<void> launchUrlStart({required String url}) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw 'Could not launch $url';
  }
}
