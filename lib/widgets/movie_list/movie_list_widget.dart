import 'package:flutter/material.dart';

class Movie {
  final String imageName;
  final String title;
  final String time;
  final String description;

  Movie(
      {required this.imageName,
      required this.title,
      required this.time,
      required this.description});
}

class MovieListWidget extends StatefulWidget {
  MovieListWidget({Key? key}) : super(key: key);

  @override
  _MovieListWidgetState createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = [
    Movie(
        imageName: 'images/Fast&Furious.jpg',
        title: 'Форсаж',
        time: 'April 7, 2009',
        description:
            '«Форса́ж 4» — американский криминальный боевик, снятый режиссёром Джастином Лином.'),
    Movie(
        imageName: 'images/Fast&Furious.jpg',
        title: 'Смертельная битва',
        time: 'April 7, 2009',
        description:
            '«Форса́ж 4» — американский криминальный боевик, снятый режиссёром Джастином Лином.'),
    Movie(
        imageName: 'images/Fast&Furious.jpg',
        title: 'Прибытие',
        time: 'April 7, 2009',
        description:
            '«Форса́ж 4» — американский криминальный боевик, снятый режиссёром Джастином Лином.'),
    Movie(
        imageName: 'images/Fast&Furious.jpg',
        title: 'Назад в будущее',
        time: 'April 7, 2009',
        description:
            '«Форса́ж 4» — американский криминальный боевик, снятый режиссёром Джастином Лином.'),
    Movie(
        imageName: 'images/Fast&Furious.jpg',
        title: 'Фиксики',
        time: 'April 7, 2009',
        description:
            '«Форса́ж 4» — американский криминальный боевик, снятый режиссёром Джастином Лином.'),
    Movie(
        imageName: 'images/Fast&Furious.jpg',
        title: 'Смешарики',
        time: 'April 7, 2009',
        description:
            '«Форса́ж 4» — американский криминальный боевик, снятый режиссёром Джастином Лином.'),
    Movie(
        imageName: 'images/Fast&Furious.jpg',
        title: 'Свинка Пеппа',
        time: 'April 7, 2009',
        description:
            '«Форса́ж 4» — американский криминальный боевик, снятый режиссёром Джастином Лином.'),
  ];

  var _filteredMovies = <Movie>[];

  final _searchController = TextEditingController();

  void _searchMovies() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredMovies = _movies.where((Movie movie) {
        return movie.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredMovies = _movies;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _filteredMovies = _movies;
    _searchController.addListener(_searchMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: EdgeInsets.only(
              top: 70,
            ),
            itemCount: _filteredMovies.length,
            itemExtent: 163,
            itemBuilder: (BuildContext context, int index) {
              final movie = _filteredMovies[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.2),
                        ),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          )
                        ],
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Row(
                        children: [
                          Image(
                            image: AssetImage(movie.imageName),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  movie.title,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  movie.time,
                                  style: TextStyle(color: Colors.grey),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  movie.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          print('11');
                        },
                      ),
                    )
                  ],
                ),
              );
            }),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: "Поиск",
              filled: true,
              fillColor: Colors.white.withAlpha(235),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
