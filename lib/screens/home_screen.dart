import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_app/constants.dart';
import 'package:meditation_app/screens/details_screen.dart';
import 'package:meditation_app/widgets/bottom_nav_bar.dart';
import 'package:meditation_app/widgets/search_bar.dart';
import '../widgets/category_card.dart';
import 'package:meditation_app/screens/all_exercises.dart';

class HomeScreen extends StatefulWidget {
  // final int _selectedIndex = 0;
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Variable to store the height and width of our device
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Builder(builder: (context) {
        return IndexedStack(
          index: _selectedIndex,
          children: [
            Stack(
              children: <Widget>[
                Container(
                  // The height of the container is 45% of our device height
                  height: size.height * .45,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5CEB8),
                    image: DecorationImage(
                      alignment: Alignment.centerLeft,
                      image:
                          AssetImage("assets/images/undraw_pilates_gpdb.png"),
                    ),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            alignment: Alignment.center,
                            height: 52,
                            width: 52,
                            decoration: BoxDecoration(
                              color: Color(0xFFF2BEA1),
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset("assets/icons/menu.svg"),
                          ),
                        ),
                        Text(
                          "Welcome\nJohn",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(fontWeight: FontWeight.w900),
                        ),
                        SearchBar(),
                        Expanded(
                          child: GridView.count(
                            childAspectRatio: .85,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            crossAxisCount: 2,
                            children: <Widget>[
                              CategoryCard(
                                svgSrc: 'assets/icons/Hamburger.svg',
                                title: "Diet Recommendation",
                                press: () {},
                              ),
                              CategoryCard(
                                svgSrc: 'assets/icons/Exercises.svg',
                                title: "Perform Exercises",
                                press: () {},
                              ),
                              CategoryCard(
                                svgSrc: 'assets/icons/Meditation.svg',
                                title: "Perform Meditation",
                                press: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return DetailsScreen();
                                  }));
                                },
                              ),
                              CategoryCard(
                                title: "Track Yoga",
                                svgSrc: "assets/icons/yoga.svg",
                                press: () {},
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            AllExercisesScreen()
          ],
        );
      }),
    );
  }
}
