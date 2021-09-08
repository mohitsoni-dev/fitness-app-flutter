import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final padding = EdgeInsets.symmetric(horizontal: 18, vertical: 12);
  double gap = 10.0;
  int selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    // TODO: Replace these Texts with repective dart file
    // For example:
    //   Home(),
    //   History(),
    //   Profile(),
    //   Settings(),
    Text('Home', style: optionStyle),
    Text('Likes', style: optionStyle),
    Text('Search', style: optionStyle),
    Text('Settings', style: optionStyle),
  ];

  void _tabChanged(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _widgetOptions.elementAt(selectedIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 14.0),
          child: GNav(
            tabBackgroundGradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.lightBlue[100]!, Colors.cyan],
            ),
            gap: 8,
            tabBorderRadius: 15,
            color: Colors.grey[600],
            activeColor: Colors.white,
            iconSize: 18,
            textStyle: TextStyle(fontSize: 16, color: Colors.white),
            tabBackgroundColor: Colors.grey[800]!,
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 14),
            duration: Duration(milliseconds: 500),
            tabs: [
              GButton(icon: LineIcons.home, text: 'Home'),
              GButton(icon: LineIcons.heart, text: 'Likes'),
              GButton(icon: LineIcons.search, text: 'Search'),
              GButton(icon: LineIcons.cog, text: 'Settings'),
            ],
            selectedIndex: selectedIndex,
            onTabChange: _tabChanged,
          ),
        ),
      ),
    );
  }
}
