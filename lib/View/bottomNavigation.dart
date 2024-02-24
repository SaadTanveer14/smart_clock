import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:smart_clock/Controller/SportsNewController.dart';
import 'package:smart_clock/Widgets/Matches.dart';
import 'package:smart_clock/Widgets/sportsNews.dart';
import 'package:smart_clock/homepage.dart';
import 'package:smart_clock/utils/Colors.dart';


class BottomNavigation extends StatelessWidget {
  
  late PersistentTabController _controller;

  BottomNavigation({super.key});
  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
        PersistentBottomNavBarItem(
            icon: Icon(CupertinoIcons.home),
            title: ("Home"),
            activeColorPrimary: CustomColor.primaryColor,
            inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
            icon: Icon(Icons.sports_soccer),
            title: ("Matches"),
            activeColorPrimary: CustomColor.primaryColor,
            inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
        PersistentBottomNavBarItem(
            icon: Icon(CupertinoIcons.news),
            title: ("HeadLines"),
            activeColorPrimary: CustomColor.primaryColor,
            inactiveColorPrimary: CupertinoColors.systemGrey,
        ),
      ];
    }
    List<Widget> _buildScreens() {
        return [
          const HomePage(),
          const Matches(screen: "mobile"),
          const SportNews(screen: "mobile",)
        ];
    }
  @override
  Widget build(BuildContext context) {
    _controller = PersistentTabController(initialIndex: 0);
    return PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: CustomColor.darkgreyColor, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: false, // Default is true.
        hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        decoration: NavBarDecoration(
          colorBehindNavBar: CustomColor.darkgreyColor,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        
        screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}