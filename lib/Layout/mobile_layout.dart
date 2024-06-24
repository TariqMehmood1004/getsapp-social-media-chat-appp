import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tabler_icons/tabler_icons.dart';
import '../screens/contacts_list.dart';
import '../screens/status_screen.dart';
import '../utils/colors.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/custom_text_widget.dart';

class MobileLayoutScreen extends StatefulWidget {
  const MobileLayoutScreen({super.key});

  @override
  State<MobileLayoutScreen> createState() => _MobileLayoutScreenState();
}

class _MobileLayoutScreenState extends State<MobileLayoutScreen> {
  int _selectedTab = 0;
  late PageController _pageController;

  final _pages = [
    ContactsListScreen(),
    StatusScreen(),
    Center(
      child: Text("Communications"),
    ),
    Center(
      child: Text("Calls"),
    ),
    Center(
      child: Text("Profile"),
    )
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedTab);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        allowImplicitScrolling: true,
        scrollBehavior: ScrollBehavior(),
        onPageChanged: (index) {
          setState(() {
            _selectedTab = index;
          });
        },
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index) {
          setState(() {
            _selectedTab = index;
          });
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 300),
            curve: Curves.ease,
          );
        },
        selectedItemColor: colorGray,
        unselectedItemColor: colorGreen,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        iconSize: 18,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(TablerIcons.message), label: "Chats"),
          BottomNavigationBarItem(
              icon: Icon(TablerIcons.status_change), label: "Updates"),
          BottomNavigationBarItem(
              icon: Icon(TablerIcons.users), label: "Communications"),
          BottomNavigationBarItem(
              icon: Icon(TablerIcons.phone), label: "Calls"),
          BottomNavigationBarItem(
              icon: Icon(TablerIcons.user), label: "Profile"),
        ],
      ),
    );
  }
}
