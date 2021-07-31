import 'package:flutter/material.dart';
import 'package:news_app/screens/Different_Sports/bodyOfDifferentSports.dart';
import 'package:news_app/screens/LiveMatches/live_matches_screen.dart';
<<<<<<< HEAD
import 'package:news_app/screens/Login_screen/login_screen.dart';
import 'package:news_app/screens/Place_Bets/place_bets.dart';
=======
import 'package:news_app/screens/PendingBets/pending_bets_screen.dart';
import 'package:news_app/screens/Place_Bets/place_bets.dart';
import 'package:news_app/screens/Settings/settings_screen.dart';
>>>>>>> 2892b94 (Second commit)

class HomePageLayout extends StatefulWidget {
  @override
  _HomePageLayoutState createState() => _HomePageLayoutState();
}

class _HomePageLayoutState extends State<HomePageLayout> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }

  bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: items,
        backgroundColor: Colors.purple[900],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) => _onItemTapped(index),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white38,
        iconSize: 20,
        selectedFontSize: 10,
        unselectedFontSize: 9.5,
      ),
      body: _pages.elementAt(_selectedIndex),
    );
  }

  final List<BottomNavigationBarItem> items = [
    Items.item(Icons.home_outlined, "Home"),
<<<<<<< HEAD
    Items.item(Icons.image_search_outlined, "About Us"),
=======
    Items.item(Icons.image_search_outlined, "Live news"),
>>>>>>> 2892b94 (Second commit)
    Items.item(Icons.compare_arrows_rounded, "Betting"),
    Items.item(Icons.wallet_giftcard_outlined, "Wallet"),
    Items.item(Icons.person, "Account"),
  ];

  final List<Widget> _pages = [
    BodyOfDifferentSports(),
    LiveMatchesScreen(),
    PlaceBets(),
<<<<<<< HEAD
    LiveMatchesScreen(),
    LoginScreen(),
=======
    PendingBetsScreen(),
    SetingsScreen(),
    // LoginScreen(),
>>>>>>> 2892b94 (Second commit)
  ];
}

class Items {
  static BottomNavigationBarItem item(
    IconData _iconData,
    String _label,
  ) {
    return BottomNavigationBarItem(
      icon: Icon(
        _iconData,
      ),
      label: _label,
    );
  }
}
