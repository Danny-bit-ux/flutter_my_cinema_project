import 'package:flutter/material.dart';
import 'package:flutter_application_tmdb/widgets/movie_list/movie_list_widget.dart';

class MainScreenWidget extends StatefulWidget {
  MainScreenWidget({Key? key}) : super(key: key);

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  static final List<Widget> _widgetOptions = <Widget>[
    Text(
      'Новости',
    ),
    MovieListWidget(),
    Text(
      'Аккаунт',
    ),
  ];
  int _selectedTab = 0;

  void _onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyCinema"),
        centerTitle: true,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedTab),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.feed), label: 'Новости'),
          BottomNavigationBarItem(
              icon: Icon(Icons.movie_creation), label: 'Фильмы'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_box), label: 'Аккаунт'),
        ],
        onTap: _onSelectTab,
      ),
    );
  }
}
