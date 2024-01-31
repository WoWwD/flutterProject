import 'package:flutter/material.dart';
import 'package:flutter_project/presentation/screens/calls_screen.dart';
import 'package:flutter_project/presentation/screens/contacts_screen.dart';
import 'package:flutter_project/presentation/screens/home_screen.dart';
import 'package:flutter_project/presentation/screens/messages_screen.dart';
import '../../../theme/app_colors.dart';
import 'nav_bar_item.dart';

class MyNavBar extends StatefulWidget {
  const MyNavBar({super.key});

  @override
  State<MyNavBar> createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        padding: const EdgeInsets.all(16),
        color: AppColors.secondBackgroundColor,
        surfaceTintColor: AppColors.secondBackgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: generateNavBarItems()
        ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          HomeScreen(),
          CallsScreen(),
          MessagesScreen(),
          ContactsScreen()
        ],
      ),
    );
  }

  List<Widget> generateNavBarItems() {
    List<String> labels = [
      'Home',
      'Calls',
      'Messages',
      'Contacts'
    ];
    List<String> icons = [
      'assets/icons/navBar/home.png',
      'assets/icons/navBar/tablet.png',
      'assets/icons/navBar/chat.png',
      'assets/icons/navBar/user.png'
    ];
    List<Widget> items = [];
    for (int i = 0; i < labels.length; i++) {
      items.add(
        NavBarItem(
          icon: icons[i],
          label: labels[i],
          isSelected: _currentIndex == i,
          onTap: () {
            setState(() {
              _currentIndex = i;
            });
          },
        ),
      );
    }
    return items;
  }
}
