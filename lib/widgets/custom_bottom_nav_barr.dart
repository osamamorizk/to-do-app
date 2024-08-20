import 'package:flutter/material.dart';
import 'package:todo/consts.dart';
import 'package:todo/views/archived_view.dart';
import 'package:todo/views/home_view.dart';
import 'package:todo/views/profile_view.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  List<Widget> views = [
    HomeView(),
    ArchivedView(),
    ProfileView(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        backgroundColor: kColor,
        selectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
          BottomNavigationBarItem(icon: Icon(Icons.archive), label: 'Archived'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      body: views.elementAt(currentIndex),
    );
  }
}
