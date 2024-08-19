import 'package:flutter/material.dart';
import 'package:todo/consts.dart';
import 'package:todo/widgets/Image_item.dart';

class ImageList extends StatefulWidget {
  const ImageList({super.key});

  @override
  State<ImageList> createState() => _ImageListState();
}

class _ImageListState extends State<ImageList> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: imagesList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  currentIndex = index;
                  setState(() {});
                },
                child: ImageItem(
                  image: imagesList[index],
                  isSlected: currentIndex == index,
                ),
              );
            }));
  }
}
