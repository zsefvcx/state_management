
import 'package:flutter/material.dart';
import 'package:furniture_store/presentation/pages/shopping_basket_page.dart';
import 'package:furniture_store/presentation/pages/store_home_page.dart';
import 'package:furniture_store/presentation/route_generator.dart';
import 'package:furniture_store/presentation/widgets/number_icon_widget.dart';

class TabItem {
  int id;
  String routeName;
  String title;
  Icon icon;
  Icon iconActivation;
  Color color;

  TabItem({
    required this.id,
    required this.routeName,
    required this.title,
    required this.icon,
    required this.iconActivation,
    required this.color,
  });
}

final List<TabItem> _tabItemsBar = [
  TabItem(
    id: 0,
    routeName: StoreHomePage.routeName,
    color: Colors.white,
    icon: const Icon(Icons.home, color: Colors.blue),
    iconActivation: const Icon(Icons.home_outlined, color: Colors.blue),
    title: 'Store',
  ),
  TabItem(
    id: 1,
    routeName: '/favorite',
    color: Colors.white,
    icon: const Icon(Icons.favorite, color: Colors.blue),
    iconActivation: const Icon(Icons.favorite_outline, color: Colors.blue),
    title: 'Favorite',
  ),
  TabItem(
    id: 2,
    routeName: ShoppingBasketPage.routeName,
    color: Colors.white,
    icon: const Icon(Icons.shopping_basket, color: Colors.blue),
    iconActivation: const Icon(Icons.shopping_basket_outlined, color: Colors.blue),
    title: 'Basket',
  ),
];

class NavigatorWidget extends StatefulWidget {
  const NavigatorWidget({
    super.key,
  });


  @override
  State<NavigatorWidget> createState() => _NavigatorWidgetState();
}

class _NavigatorWidgetState extends State<NavigatorWidget> {

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      height: 85,
      color: Theme.of(context).colorScheme.inversePrimary,
      elevation: 0,
      child: BottomNavigationBar(
        elevation: 0,

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        onTap: (value) {
          setState(() {});
          if(value == RouteGenerator.currentIndex.index) return;
          setState(() {
            RouteGenerator.currentIndex.index = value;
          });
          Navigator.of(context).pushReplacementNamed(_tabItemsBar[value].routeName,
            arguments: {
               'TabIndex':value,
            },
          );
        },
        currentIndex: RouteGenerator.currentIndex.index,
        items: [
          ..._tabItemsBar.map((e) => BottomNavigationBarItem(
              icon:  e.id == 2?
              NumberIconWidget(icon: e.icon, type: 0,)
              :e.id == 1?NumberIconWidget(icon: e.icon, type: 1,):e.icon,
              label: e.title,
              backgroundColor: e.color,
              activeIcon: e.iconActivation,
            ),
          ),
        ],
      ),
    );
  }
}