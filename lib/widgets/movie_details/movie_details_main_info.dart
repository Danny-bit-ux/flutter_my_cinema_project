import 'package:flutter/material.dart';
import 'package:flutter_application_tmdb/widgets/resources/RadianPercentWidget.dart';

class MovieDetailsMainInfo extends StatelessWidget {
  const MovieDetailsMainInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _TopPosterWidget(),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: _MovieNameWidget(),
        ),
        _ScoreWidget(),
        _SummaryWidget(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: _OverviewNameWidget(),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: _OverviewTextWidget(),
        ),
        SizedBox(
          height: 20,
        ),
        _PeopleWidgets(),
      ],
    );
  }

  Text _OverviewNameWidget() {
    return Text(
      'Overview',
      style: TextStyle(
        color: Colors.white,
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class _TopPosterWidget extends StatelessWidget {
  const _TopPosterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var imgFilms = AssetImage("images/tmtopheader.jpg");
    return Stack(
      children: [
        Image(
          image: imgFilms,

          //'images/Fast&Furious.jpg'
        ),
//        Positioned(child: child)
      ],
    );
  }
}

class _MovieNameWidget extends StatelessWidget {
  const _MovieNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 3,
      text: TextSpan(
        children: [
          TextSpan(
            text: "Tom Clancy's Without Remorse",
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: " (2021)",
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w300,
            ),
          )
        ],
      ),
    );
  }
}

class _ScoreWidget extends StatelessWidget {
  const _ScoreWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      TextButton(
          onPressed: () {},
          child: Row(
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: RadianPercentWidget(
                  child: Text('72'),
                  percent: 0.72,
                  fillColor: Color.fromARGB(255, 10, 23, 25),
                  lineColor: Color.fromARGB(255, 37, 203, 103),
                  freeColor: Color.fromARGB(255, 25, 54, 31),
                  lineWidth: 5,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                'User Score',
              ),
            ],
          )),
      Container(height: 15, width: 1, color: Colors.grey),
      TextButton(
          onPressed: () {},
          child: Row(
            children: [
              Icon(Icons.play_arrow),
              Text(
                'Play Trailer',
              ),
            ],
          )),
    ]);
  }
}

class _SummaryWidget extends StatelessWidget {
  const _SummaryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Color.fromRGBO(22, 21, 25, 1.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 70,
        ),
        child: Text(
          'R 04/29/2021 (USA)  1h49m  Action, Adventure, Thriller, War',
          maxLines: 3,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w100,
          ),
        ),
      ),
    );
  }
}

class _OverviewTextWidget extends StatelessWidget {
  const _OverviewTextWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        'An elite Navy SEAL uncovers an international conspiracy while seeking justice for the murder of his predant wife',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16.0,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}

class _PeopleWidgets extends StatelessWidget {
  const _PeopleWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameStyle = TextStyle(
      color: Colors.white,
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
    );
    final jobTitleStyle = TextStyle(
      color: Colors.white,
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
    );
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Stefano Sollima",
                  style: nameStyle,
                ),
                Text("Director", style: jobTitleStyle),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Stefano Sollima",
                  style: nameStyle,
                ),
                Text("Director", style: jobTitleStyle),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Stefano Sollima",
                  style: nameStyle,
                ),
                Text("Director", style: jobTitleStyle),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Stefano Sollima",
                  style: nameStyle,
                ),
                Text("Director", style: jobTitleStyle),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
