import 'package:flutter/material.dart';
import 'package:flutter_application_tmdb/theme/app_colors.dart';
import 'package:flutter_application_tmdb/widgets/auth/auth_model.dart';
import 'package:flutter_application_tmdb/widgets/auth/auth_widget.dart';
import 'package:flutter_application_tmdb/widgets/main_screen/main_screen_widget.dart';
import 'package:flutter_application_tmdb/widgets/movie_details/movie_details_widget.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Cinema',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.mainDarkBlue,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.mainDarkBlue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
        ),
      ),
      routes: {
        '/auth': (context) =>
            AuthProvider(model: AuthModel(), child: AuthWidget()),
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
      },
      initialRoute: '/auth',
    );
  }
}
