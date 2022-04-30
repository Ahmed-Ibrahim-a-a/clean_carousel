import 'dart:ui';

import 'package:flutter/material.dart';

class CarouselPage extends StatefulWidget {
  CarouselPage({Key? key}) : super(key: key);

  @override
  State<CarouselPage> createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  List<String> images = [
    "https://cdn.dribbble.com/users/3281732/screenshots/8159457/media/9e7bfb83b0bd704e941baa7a44282b22.jpg?compress=1&resize=400x300&vertical=top",
    "https://cdn.dribbble.com/users/3281732/screenshots/9165292/media/ccbfbce040e1941972dbc6a378c35e98.jpg?compress=1&resize=400x300&vertical=top",
    "https://cdn.dribbble.com/users/3281732/screenshots/7226813/media/b3c0be6dd52619d555f25af859833fc6.jpg?compress=1&resize=320x240&vertical=top",
    "https://cdn.dribbble.com/users/3281732/screenshots/6784133/samji_illustrator_4x.jpeg?compress=1&resize=400x300&vertical=top",
    "https://cdn.dribbble.com/users/3281732/screenshots/7030316/media/2ebdf96be09ef0491e310f15505fb03d.jpg?compress=1&resize=400x300&vertical=top",
    "https://cdn.dribbble.com/users/3281732/screenshots/13130602/media/592ccac0a949b39f058a297fd1faa38e.jpg?compress=1&resize=320x240&vertical=top",
  ];
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: Container(
            key: ValueKey<String>(images[_currentPage]),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(images[_currentPage]), fit: BoxFit.cover),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(
                color: Colors.black.withOpacity(0.2),
              ),
            ),
          ),
        ),
        FractionallySizedBox(
          heightFactor: 0.55,
          child: PageView.builder(
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemCount: images.length,
            itemBuilder: (context, index) {
              return FractionallySizedBox(
                widthFactor: 0.8,
                child: Container(
                    margin: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(images[index]),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(32),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: Offset(0, 5), // changes position of shadow
                          )
                        ])),
              );
            },
          ),
        )
      ],
    );
  }
}
