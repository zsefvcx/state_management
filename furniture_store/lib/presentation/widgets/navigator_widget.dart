

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:furniture_store/domain/bloc/favorites_bloc.dart';
import 'package:furniture_store/domain/bloc/shopping_basket_bloc.dart';
import 'package:furniture_store/presentation/pages/shopping_basket_page.dart';
import 'package:furniture_store/presentation/pages/store_home_page.dart';
import 'package:furniture_store/presentation/route_generator.dart';
import 'package:provider/provider.dart';

class TabItem {
  int id;
  String routename;
  String title;
  Icon icon;
  Icon iconActivation;
  Color color;

  TabItem({
    required this.id,
    required this.routename,
    required this.title,
    required this.icon,
    required this.iconActivation,
    required this.color,
  });
}

final List<TabItem> _tabItemsBar = [
  TabItem(
    id: 0,
    routename: StoreHomePage.routeName,
    color: Colors.white,
    icon: const Icon(Icons.home),
    iconActivation: const Icon(Icons.home_outlined),
    title: 'Store',
  ),
  TabItem(
    id: 1,
    routename: '/favorite',
    color: Colors.white,
    icon: const Icon(Icons.favorite),
    iconActivation: const Icon(Icons.favorite_outline),
    title: 'Favorite',
  ),
  TabItem(
    id: 2,
    routename: ShoppingBasketPage.routeName,
    color: Colors.white,
    icon: const Icon(Icons.shopping_basket),
    iconActivation: const Icon(Icons.shopping_basket_outlined),
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
    if (kDebugMode) {
      print('build NavigatorWidget');
    }
    return BottomAppBar(

      // shape: const CircularNotchedRectangle(),
      // clipBehavior: Clip.antiAlias,
      // notchMargin: 15,
      height: 85,
      //color: Theme.of(context).colorScheme.inversePrimary,
      elevation: 0,
      child: BottomNavigationBar(
        onTap: (value) {
          setState(() {});
          if(value == RouteGenerator.currentIndex.index) return;
          setState(() {
            RouteGenerator.currentIndex.index = value;
          });
          Navigator.of(context).pushReplacementNamed(_tabItemsBar[value].routename,
            arguments: {
               'TabIndex':value,
            },
          );
        },
        //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        currentIndex: RouteGenerator.currentIndex.index,
        items: [
          ..._tabItemsBar.map((e) => BottomNavigationBarItem(
              icon:  e.id == 2?Consumer<ShoppingBasketBloc>(builder: (_, shoppingBasketBloc, __){
                return Stack(children: [e.icon, Positioned(
                  top: -4,
                  child: Text(shoppingBasketBloc.shoppingBasketModel.length.toString(),
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900, backgroundColor: Colors.white.withOpacity(0.2), color: Colors.black.withOpacity(0.8)),
                  ),
                ),]);
              }):e.id == 1?Consumer<FavoritesBloc>(builder: (_, favoritesBloc, __){
                return Stack(children: [e.icon, Positioned(
                  top: -4,
                  child: Text(favoritesBloc.favoritesModel.length.toString(),
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900, backgroundColor: Colors.white.withOpacity(0.2), color: Colors.black.withOpacity(0.8)),
                  ),
                ),]);
              }):e.icon,
              label: e.title,
              backgroundColor: e.color,
              //activeIcon: e.iconActivation,
            ),
          ),
        ],
      ),
    );
  }
}