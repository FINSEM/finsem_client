import 'package:finsem_client/ui/screens/donation_screen/donation_screen.dart';
import 'package:finsem_client/ui/screens/history_screen/history_screen.dart';
import 'package:finsem_client/ui/screens/home_screen/home_screen.dart';
import 'package:finsem_client/ui/screens/support_screen/support_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  RxInt selectedIndex = 0.obs;

  static final List<Widget> _NavScreens = <Widget>[
    HomeScreen(),
    DonationScreen(),
    SupportScreen(),
    HistoryScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _NavScreens.elementAt(selectedIndex.value),
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(0.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[200]!,
              color: Colors.black,
              tabs: const [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: LineIcons.helpingHands,
                  text: 'Donation',
                ),
                GButton(
                  icon: LineIcons.bullhorn,
                  text: 'Help',
                ),
                GButton(
                  icon: LineIcons.alternateExchange,
                  text: 'History',
                ),
              ],
              selectedIndex: selectedIndex.value,
              onTabChange: (index) {
                setState(() {
                  selectedIndex.value = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
