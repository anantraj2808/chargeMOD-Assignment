import 'package:chargemod_assignment/features/HomePage/Widgets/home_page.dart';
import 'package:chargemod_assignment/features/ProfilePage/Widgets/profile_page.dart';
import 'package:chargemod_assignment/utilities/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  int _selectedIndex = 0;
  List<Widget> widgetOptions = <Widget>[
    HomePage(),
    Container(),
    Container(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/home_icon.svg", color: _selectedIndex == 0 ? ColorConstants.chargemodOrange : ColorConstants.chargemodBlack,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/activity_icon.svg", color: _selectedIndex == 1 ? ColorConstants.chargemodOrange : ColorConstants.chargemodBlack,),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/community_icon.svg", color: _selectedIndex == 2 ? ColorConstants.chargemodOrange : ColorConstants.chargemodBlack,),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("assets/images/profile_icon.svg", color: _selectedIndex == 3 ? ColorConstants.chargemodOrange : ColorConstants.chargemodBlack,),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: ColorConstants.chargemodBlack,
        onTap: _onItemTapped,
      ),
    );
  }
}
