import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var title = 'Web Images';
    return MaterialApp(
      title: title,
      home: const Scaffold(
        body: BlurImage(
          url1:
              'https://w.namu.la/s/420422c9668360c3654fb8d4ba4b4921a22a8732d660e08d81cfa5281035aae6573a4f61927aaeecdcf6ee911af6ea5a4aa49bef54be3f63ada78ac5f914e1cfb4b78e644e2190944fb886f2688ffb91',
          url2:
              'https://uyjoqvxyzgvv9714092.cdn.ntruss.com/data2/content/image/2021/10/07/.cache/512/20211007320109.jpg',
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}

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
