import 'package:flutter/material.dart';

class BlurImage extends StatelessWidget {
  const BlurImage({Key? key, required this.url1, required this.url2})
      : super(key: key);
  final String url1;
  final String url2;

  Image img1() {
    return Image.network(url1);
  }

  Image img2() {
    return Image.network(
      url2,
      fit: BoxFit.cover,
    );
  }

  Container imgBox(Image img) {
    return Container(
      foregroundDecoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black,
            Colors.transparent,
            Colors.transparent,
            Colors.black
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0, 0.4, 0.6, 1],
        ),
      ),
      child: img,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            imgBox(img1()),
            imgBox(img2()),
            const Text('Title: Squid Game 2021',
                style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
