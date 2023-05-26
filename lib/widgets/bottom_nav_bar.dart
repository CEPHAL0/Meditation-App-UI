import 'package:flutter/material.dart';
import 'bottom_nav_item.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    // Store the index
    int activeIndex = 0;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 70,
      color: Colors.white,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            BottomNavItem(
              press: () {
                setState(() {
                  _selectedIndex = 0;
                });
              },
              svgSrc: 'assets/icons/calendar.svg',
              title: 'Today',
              isActive: _selectedIndex == 0,
            ),
            BottomNavItem(
              press: () {
                setState(() {
                  _selectedIndex = 1;
                });
              },
              svgSrc: 'assets/icons/gym.svg',
              title: 'All Exercises',
              isActive: _selectedIndex == 1,
            ),
            BottomNavItem(
              press: () {
                setState(() {
                  _selectedIndex = 2;
                });
              },
              svgSrc: 'assets/icons/Settings.svg',
              title: 'Settings',
              isActive: _selectedIndex == 2,
            ),
          ]),
    );
  }
}
