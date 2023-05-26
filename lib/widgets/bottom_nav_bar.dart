import 'package:flutter/material.dart';
import 'bottom_nav_item.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

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
              press: () {},
              svgSrc: 'assets/icons/calendar.svg',
              title: 'Today',
              isActive: activeIndex == 0,
            ),
            BottomNavItem(
              press: () {},
              svgSrc: 'assets/icons/gym.svg',
              title: 'All Exercises',
              isActive: activeIndex == 1,
            ),
            BottomNavItem(
              press: () {},
              svgSrc: 'assets/icons/Settings.svg',
              title: 'Settings',
              isActive: activeIndex == 2,
            ),
          ]),
    );
  }
}
