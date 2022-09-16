import 'package:flutter/material.dart';

void main() {
  runApp(const GridviewPage());
}

class GridviewPage extends StatefulWidget {
  const GridviewPage({Key? key}) : super(key: key);

  @override
  GridviewPageState createState() => GridviewPageState();
}

class GridviewPageState extends State<GridviewPage> {
  List<Map<String, String>> movieData = [
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/1Lh9LER4xRQ3INFFi2dfS2hpRwv.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/oF80bdLeRri6PFm0yAT0gRNQoDG.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/8SAWREjfLyArr2pYo1gHihCthY8.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/1UkbPQspPbq1FPbFP4VV1ELCfSN.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/aNtAP8ZzUMdnCPoqYgVOcgI0Eh4.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/yXNVcG0C7Oymg9F9ecXa9MWVwj8.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/68ZwnPALUeweaFdT1z75oXJ4Xie.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/l8HyObVj8fPrzacAPtGWWLDhcfh.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/bZrStEjqKMRCywomPZiPkOWZpXL.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/qfB6QNaCtmGDy9ujvBOUs7UaPx.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/eRLlrhbdYE7XN6VtcZKy6o2BsOw.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/52SgH0kLiSpWdJDOZvhAyy34uhe.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/yjdOpEtlzlAnw4Kw0NGw25VrbIb.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/xs7Dx72wr2H14uxu0H0R9ljDZk7.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/zPDY58lk0YIxr9qsnGV64PEnjkI.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/pMyOSRURkxF6YId9vOTGsBH1jRb.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/jlmuSzTXOppShgYZbeetWTFTi6P.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/xJY3ttefDnnn6doYQo5QOROgdvV.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/w7PJ7fBEYOuaAMKfYa4zmw45v3N.jpg>'
    },
    {
      'posterPath':
          '<https://image.tmdb.org/t/p/w500/AviYDX3NuuyVQdZoLmLxNKp3zm8.jpg>'
    },
  ];

  String parseURL(Map<String, String> path) {
    String url = path['posterPath']!;
    return url.substring(1, url.length - 1);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Movie Poster",
              style: TextStyle(fontFamily: 'Playfair_Display')),
          centerTitle: false,
          backgroundColor: Colors.green,
        ),
        body: GridView.count(
          crossAxisCount: 2, //1 개의 행에 보여줄 item 개수
          childAspectRatio: 1, //item 의 가로 1, 세로 2 의 비율
          mainAxisSpacing: 10, //수평 Padding
          crossAxisSpacing: 10, //수직 Padding
          children: List.generate(20, (index) {
            //item 의 반목문 항목 형성
            return Image.network(parseURL(movieData[index]),
                fit: BoxFit.fitWidth);
          }),
        ),
      ),
    );
  }
}
