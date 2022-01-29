import 'package:youcondo/core/model/scheduling.dart';
import 'package:youcondo/core/themes/app_colors.dart';
import 'package:youcondo/src/features/help/view/help.dart';
import 'package:youcondo/src/features/home/view/home.dart';
import 'package:youcondo/src/features/search/view/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavigationScreen extends StatefulWidget {
  final Scheduling? scheduling;
  const NavigationScreen({Key? key, this.scheduling}) : super(key: key);

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;
  List<Widget> _navigationScreens = [];

  @override
  void initState() {
    super.initState();
    _setConfiguration();
  }

  _setConfiguration() {
    _selectedIndex =
        widget.scheduling != null ? widget.scheduling!.pageSelectedIndex! : 0;
    _navigationScreens = [
      HomeScreen(),
      SearchScreen(
        scheduling: widget.scheduling,
      ),
      HelpScreen(),
    ];
  }

  Color getIconColor(int index) {
    Color color = AppColors.stormDust;
    if (index == _selectedIndex) color = AppColors.violet;

    return color;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.springWood,
          selectedItemColor: AppColors.violet,
          currentIndex: _selectedIndex,
          elevation: 10,
          iconSize: 50,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: (index) => setState(() => _selectedIndex = index),
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/home.svg',
                color: getIconColor(0),
              ),
              label: 'Pagina Inicial',
            ),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/search.svg',
                    color: getIconColor(1)),
                label: 'Pesquisar'),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/help.svg',
                color: getIconColor(2),
              ),
              label: 'Ajuda',
            ),
          ]),
      body: _navigationScreens[_selectedIndex],
    );
  }
}
