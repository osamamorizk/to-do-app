import 'package:flutter/material.dart';

class ImageItem extends StatelessWidget {
  const ImageItem({super.key, required this.image, required this.isSlected});
  final ImageProvider<Object> image;
  final bool isSlected;

  @override
  Widget build(BuildContext context) {
    return isSlected
        ? Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            height: 123,
            width: 123,
            child: Center(
              child: Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8)),
                height: 120,
                width: 120,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Image(image: image),
                  ),
                ),
              ),
            ),
          )
        : Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            height: 120,
            width: 120,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Image(image: image),
              ),
            ),
          );
  }
}
