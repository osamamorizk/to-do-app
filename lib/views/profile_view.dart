import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:todo/consts.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBackground,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: kColor,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: ProfileWidget(),
    );
  }
}

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({super.key});

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 70,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    "Email:  osama@gmail.com",
                    style: TextStyle(color: kColorHints, fontSize: 22),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Tasks Overview",
                style: TextStyle(color: kColorHints, fontSize: 22),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              StatisticsContainer(
                title: 'Todo',
                numTask: 8,
              ),
              StatisticsContainer(
                title: 'Done',
                numTask: 4,
              ),
            ],
          ),
          const SizedBox(
            height: 35,
          ),
          CircularPercentIndicator(
            footer: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 80,
                  child: ListTile(
                    horizontalTitleGap: 5,
                    contentPadding: EdgeInsets.all(0),
                    leading: Container(
                      color: kColor,
                      height: 20,
                      width: 20,
                    ),
                    title: const Text(
                      'Done',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: kColorHints,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: ListTile(
                    horizontalTitleGap: 5,
                    contentPadding: EdgeInsets.only(left: 10),
                    leading: Container(
                      color: Colors.white,
                      height: 20,
                      width: 20,
                    ),
                    title: const Text(
                      'Todo',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: kColorHints,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            header: const Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: Text(
                "Your Progress",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: kColorHints,
                ),
              ),
            ),
            radius: 115.0,
            animation: true,
            animationDuration: 1200,
            lineWidth: 25.0,
            percent: .50,
            center: const Text(
              "50 %",
              style: TextStyle(
                  color: kColorHints,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0),
            ),
            circularStrokeCap: CircularStrokeCap.butt,
            backgroundColor: Colors.white,
            progressColor: kColor,
          ),
        ],
      ),
    );
  }
}

class StatisticsContainer extends StatelessWidget {
  const StatisticsContainer(
      {super.key, required this.title, required this.numTask});
  final String title;
  final int numTask;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(color: kColorHints, fontSize: 25),
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text(
                  '$numTask',
                  style: TextStyle(color: kColorHints, fontSize: 25),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
