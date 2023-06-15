
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:furniture_store/domain/bloc/main_bloc.dart';
import 'package:furniture_store/presentation/widgets/widgets.dart';
import 'package:provider/provider.dart';

class TabItem {
  String routename;
  String title;
  Icon icon;
  Icon iconActivation;
  Color color;

  TabItem({
    required this.routename,
    required this.title,
    required this.icon,
    required this.iconActivation,
    required this.color,
  });
}

final List<TabItem> _tabItemsBar = [
  TabItem(
    routename: StoreHomePage.routeName,
    color: Colors.white,
    icon: const Icon(Icons.home),
    iconActivation: const Icon(Icons.home_outlined),
    title: 'Store',
  ),
  TabItem(
    routename: '/favorite',
    color: Colors.white,
    icon: const Icon(Icons.favorite),
    iconActivation: const Icon(Icons.favorite_outline),
    title: 'Favorite',
  ),
  TabItem(
    routename: '/basket',
    color: Colors.white,
    icon: const Icon(Icons.shopping_basket),
    iconActivation: const Icon(Icons.shopping_basket_outlined),
    title: 'Basket',
  ),
];

class StoreHomePage extends StatefulWidget {
  static const routeName = '/';

  const StoreHomePage({super.key, required this.title});

  final String title;

  @override
  State<StoreHomePage> createState() => _StoreHomePageState();
}

class _StoreHomePageState extends State<StoreHomePage> with SingleTickerProviderStateMixin {

  late TabController _tabController;
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      print('Listener ${_tabController.index}');
      setState(() {
        _currentTabIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('build MyHomePage');
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: AppBarTitleWidget(title: widget.title),
        centerTitle: true,

      ),
      //Использовать Visibility
      body:SafeArea(
        child: Consumer<MainBloc>(builder: (_, mainBloc, __) {
          if (kDebugMode) {
            print(mainBloc.lpAll.join('\t'));
            print('isLoaded : ${mainBloc.isLoaded.toString()}');
            print('isTimeOut:${mainBloc.isTimeOut.toString()}');
            print('isError  :${mainBloc.isError.toString()}');
            print('isErrorType  :${mainBloc.e.runtimeType}');
          }
          //;
        if (mainBloc.isTimeOut || mainBloc.isError){
          return Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('isTimeOut  :${mainBloc.isTimeOut.toString()}'),
              Text('isError    :${mainBloc.isError.toString()}'),
              Text('isErrorType:${mainBloc.e.runtimeType}'),
              const SizedBox(height: 50,),
              TextButton(
                  onPressed: () {
                    mainBloc.getAllProducts(0);
                    setState(() {
                    });
                  },
                  child: const Text('Try again')
              ),
            ],
          ));
        } if (!mainBloc.isLoaded) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return
            RefreshIndicator(
              onRefresh: () async => await mainBloc.getAllProducts(0),
              child: ScrollConfiguration(// + windows
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse,
                  },
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 550,
                      mainAxisExtent: 200, // here set custom Height You Want
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1,
                    ),
                  //padding: const EdgeInsets.only(top: 16),
                  itemCount: mainBloc.lpAll.length,
                  itemBuilder: (_, index) {
                    if (kDebugMode) print('Build CardProductWidget $index');
                    return CardProductWidget(productEntity: mainBloc.lpAll[index],);
                  },
              ),
                ),
              ),
            );
        }
        }),
      ),

      bottomNavigationBar: BottomAppBar(
        
        // shape: const CircularNotchedRectangle(),
        // clipBehavior: Clip.antiAlias,
        // notchMargin: 15,
        height: 85,
        //color: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
        child: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              _tabController.index = value;
              _currentTabIndex = value;
            });

            Navigator.of(context).pushNamed(_tabItemsBar[value].routename,
              // arguments: {
              //   'hotel':hotel,
              // },
            );




          },
          //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          elevation: 0,
          currentIndex: _currentTabIndex,
          items: [
            ..._tabItemsBar.map(
                  (e) => BottomNavigationBarItem(
                    icon: e.icon,
                    label: e.title,
                    backgroundColor: e.color,
                    activeIcon: e.iconActivation,
                  ),
            ),
          ],
        ),
      ),


    );
  }
}
