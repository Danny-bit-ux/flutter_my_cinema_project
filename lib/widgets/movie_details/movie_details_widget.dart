import 'package:flutter/material.dart';

import 'movie_details_main_info.dart';
import 'movie_details_main_screen_cast_widget.dart';

class MovieDetailsWidgets extends StatefulWidget {
  final int movieId;
  MovieDetailsWidgets({Key? key, required this.movieId}) : super(key: key);

  @override
  _MovieDetailsWidgetsState createState() => _MovieDetailsWidgetsState();
}

class _MovieDetailsWidgetsState extends State<MovieDetailsWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tom Clancy's Without Remorse"),
        centerTitle: true,
      ),
      body: ColoredBox(
        color: Color.fromRGBO(24, 23, 27, 1.0),
        child: ListView(
          children: [
            MovieDetailsMainInfo(),
            SizedBox(
              height: 10.0,
            ),
            MovieDetailsMainScreenCastWidget(),
          ],
        ),
      ),
    );
  }
}
