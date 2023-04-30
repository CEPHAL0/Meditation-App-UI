import 'package:flutter/material.dart';
import 'bottom_nav_item.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 70,
      color: Colors.white,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            BottomNavItem(
              press: () {},
              svgSrc: 'assets/icons/calendar.svg',
              title: 'Today',
            ),
            BottomNavItem(
              press: () {},
              svgSrc: 'assets/icons/gym.svg',
              title: 'All Exercises',
            ),
            BottomNavItem(
              press: () {},
              svgSrc: 'assets/icons/Settings.svg',
              title: 'Settings',
            ),
          ]),
    );
  }
}
