import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:healthypet/providers/navigation_bar_provider.dart';
import 'package:healthypet/screens/beranda_screen.dart';
import 'package:healthypet/utils/color_themes.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<NavigationBarProvider>(
        builder: (context, value, child) {
          return IndexedStack(
            index: value.currentIndex,
            children: const [
              BerandaScreen(),
              Center(child: Text('Favorite Screen')),
              Center(child: Text('Message Screen')),
              Center(child: Text('User Screen')),
            ],
          );
        },
      ),
      bottomNavigationBar: bottomNavigationBarCutom(),
    );
  }

  Widget bottomNavigationBarCutom() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(45),
          topRight: Radius.circular(45),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05),
            offset: Offset(0, -10),
            blurRadius: 30,
            spreadRadius: 0,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(45),
          topRight: Radius.circular(45),
        ),
        child: Consumer<NavigationBarProvider>(
          builder: (context, state, child) {
            return BottomNavigationBar(
              currentIndex: state.currentIndex,
              onTap: (value) => state.currentIndex = value,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              backgroundColor: Colors.white,
              items: [
                bottomNavigationBarItemCustom(
                  label: 'Beranda',
                  iconName: 'assets/icons/home.svg',
                  index: 0,
                  currentIndex: state.currentIndex,
                ),
                bottomNavigationBarItemCustom(
                  label: 'Favorite',
                  iconName: 'assets/icons/heart.svg',
                  index: 1,
                  currentIndex: state.currentIndex,
                ),
                bottomNavigationBarItemCustom(
                  label: 'Messages',
                  iconName: 'assets/icons/message-circle.svg',
                  index: 2,
                  currentIndex: state.currentIndex,
                ),
                bottomNavigationBarItemCustom(
                  label: 'User',
                  iconName: 'assets/icons/user.svg',
                  index: 3,
                  currentIndex: state.currentIndex,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  BottomNavigationBarItem bottomNavigationBarItemCustom(
      {String? label, String? iconName, int? index, int? currentIndex}) {
    return BottomNavigationBarItem(
      icon: Column(
        children: [
          SvgPicture.asset(
            iconName!,
            color: currentIndex == index
                ? ColorsThemes.bottomNavigationColorActive
                : ColorsThemes.bottomNavigationColorNonActive,
          ),
          const SizedBox(height: 3),
          currentIndex == index
              ? Container(
                  width: 12,
                  height: 2,
                  decoration: BoxDecoration(
                    color: ColorsThemes.primaryColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
      label: label,
    );
  }
}
