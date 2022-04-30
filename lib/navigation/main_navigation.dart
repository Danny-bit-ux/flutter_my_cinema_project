import 'package:flutter/material.dart';
import 'package:flutter_application_tmdb/widgets/auth/auth_model.dart';
import 'package:flutter_application_tmdb/widgets/auth/auth_widget.dart';
import 'package:flutter_application_tmdb/widgets/main_screen/main_screen_widget.dart';
import 'package:flutter_application_tmdb/widgets/movie_details/movie_details_widget.dart';

abstract class MainNavigationRouteNames {
  static const auth = "/auth";
  static const mainScreen = "/main_screen";
  static const movieDetails = "/main_screen/movie_details_widget";
}

class MainNavigation {
  final routes = <String, Widget Function(BuildContext)>{
    '/auth': (context) => AuthProvider(model: AuthModel(), child: AuthWidget()),
    '/main_screen': (context) => MainScreenWidget(),
    '/main_screen/movie_details_widget': (context) {
      final id = ModalRoute.of(context)?.settings.arguments as int;
      if (id is int) {
        return MovieDetailsWidgets(
          movieId: id,
        );
      } else {
        return MovieDetailsWidgets(
          movieId: 0,
        );
      }
    },
  };
}
