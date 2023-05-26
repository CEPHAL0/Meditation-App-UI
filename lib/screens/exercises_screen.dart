import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_app/constants.dart';
import 'package:meditation_app/widgets/bottom_nav_bar.dart';
import 'package:meditation_app/widgets/search_bar.dart';
import 'package:meditation_app/widgets/session_card.dart';

class ExercisesScreen extends StatelessWidget {
  const ExercisesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: AssetImage('assets/images/gym_cover.png'),
                  fit: BoxFit.cover,
                  opacity: 90,
                )),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * .05,
                ),
                Text("Exercises",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontWeight: FontWeight.w900)),
                Text(
                  "30-60 MIN Course",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 40),
                SizedBox(
                  width: size.width * .6,
                  child: Text(
                    "\nRemain active and \nboost your metabolism with light exercises",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 8, 15, 36),
                    ),
                  ),
                ),
                SizedBox(
                  child: SearchBar(),
                  width: size.width * .5,
                ),
                Wrap(
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    SessionCard(
                      sessionNum: 1,
                    ),
                    SessionCard(
                      sessionNum: 2,
                    ),
                    SessionCard(
                      sessionNum: 3,
                    ),
                    SessionCard(
                      sessionNum: 4,
                    ),
                    SessionCard(
                      sessionNum: 5,
                    ),
                    SessionCard(
                      sessionNum: 6,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "Meditation",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  height: 90,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 17),
                          spreadRadius: -13,
                          blurRadius: 23,
                          color: kShadowColor,
                        )
                      ]),
                  child: Row(
                    children: [
                      SvgPicture.asset("assets/icons/gym.svg"),
                      SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "BASIC 2",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(),
                            ),
                            Text(
                              "Start your intense workouts",
                              style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: SvgPicture.asset("assets/icons/Lock.svg"),
                      )
                    ],
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
