

import 'package:flutter/material.dart';
import 'package:furniture_store/presentation/pages/shopping_basket_page.dart';
import 'package:furniture_store/presentation/pages/store_home_page.dart';

import '../domain/bloc/bloc.dart';
import 'widgets/widgets.dart';

class CurrentIndex{
  int index;
  CurrentIndex({this.index=0});
}


class RouteGenerator {

  static CurrentIndex currentIndex = CurrentIndex();

  static String initialRoute = StoreHomePage.routeName;

  static List<String> title = ['Store', 'Favorites', 'Basket', 'Error'];

  static Route<dynamic> generateRoute(RouteSettings settings){
    //final args = settings.arguments;

    switch(settings.name){
      case StoreHomePage.routeName:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
          StoreHomePage(title: title[0],),
        );
      case ShoppingBasketPage.routeName:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              ShoppingBasketPage(title: title[2],),
        );
      //case HotelView.routeName:
        // if(args != null && args is Map<String, HotelPreview>){
        //   if(args['hotel']!=null){
        //     HotelPreview data = args['hotel'] as HotelPreview;
        //     return PageRouteBuilder(
        //       pageBuilder:(context, animation, secondaryAnimation) =>
        //           HotelView(hotel: data,),
        //     );
        //   } else {
        //     return _errorRoute();
        //   }
        // } else {
        //   return _errorRoute();
        // }
      //  return _errorRoute();
      default:
        // if(args != null && args is Map<String, dynamic>){
        //   if(args['TabIndex']!=null && args['TabIndex'] is int){
        //     currentTabIndex = args['TabIndex'];
        //   } else {
        //     currentTabIndex = 0;
        //   }
        // } else {
        //   currentTabIndex = 0;
        // }
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    currentIndex.index = 0;
    return MaterialPageRoute(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(icon: const Icon(Icons.close),
              onPressed: ()=>Navigator.of(context).
              pushReplacementNamed(StoreHomePage.routeName,
              arguments: {
              'TabIndex':currentIndex.index,
              },
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: AppBarTitleWidget(title: title[3]),
          centerTitle: true,
        ),
        body: const Center(
          child: Text('Page not found!'),
        ),
      );
    },
      fullscreenDialog: true,
    );
  }
}