import 'package:flutter/material.dart';
import 'package:flutter_application_tmdb/widgets/movie_list/movie_list_widget.dart';
import 'package:flutter_application_tmdb/widgets/resources/RadianPercentWidget.dart';

class MainScreenWidget extends StatefulWidget {
  MainScreenWidget({Key? key}) : super(key: key);

  @override
  _MainScreenWidgetState createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
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
      body: IndexedStack(
        index: _selectedTab,
        children: [
          Text(
            'Новости',
          ),
          MovieListWidget(),
          _RadianWidget()
        ],
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

class _RadianWidget extends StatelessWidget {
  const _RadianWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        child: RadianPercentWidget(
          percent: 0.72,
          fillColor: Colors.blue,
          freeColor: Colors.yellow,
          lineColor: Colors.red,
          lineWidth: 5,
          child: Text("72%", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
