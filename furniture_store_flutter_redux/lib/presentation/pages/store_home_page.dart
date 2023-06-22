
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:furniture_store/presentation/redux/action_main.dart';
import 'package:furniture_store/presentation/redux/app_state.dart';
import 'package:furniture_store/presentation/widgets/navigator_widget.dart';
import 'package:furniture_store/presentation/widgets/widgets.dart';

class StoreHomePage extends StatefulWidget {
  static const routeName = '/';

  const StoreHomePage({super.key, required this.title});

  final String title;

  @override
  State<StoreHomePage> createState() => _StoreHomePageState();
}

class _StoreHomePageState extends State<StoreHomePage> {
  @override
  Widget build(BuildContext context) {
    var action = StoreProvider.of<MainAppState>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: AppBarTitleWidget(title: widget.title),
        centerTitle: true,
      ),
      //Использовать Visibility
      body:SafeArea(
        child: StoreConnector<MainAppState,MainAppState>(
            converter: (store) => store.state,
            builder: (context, mainBloc){
        if (mainBloc.isTimeOut || mainBloc.isError){
          return Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('isTimeOut  :${mainBloc.isTimeOut.toString()}'),
              Text('isError    :${mainBloc.isError.toString()}'),
              Text('isErrorType:${mainBloc.e}'),
              const SizedBox(height: 50,),
              TextButton(
                  onPressed: () {
                    action.dispatch(GetAllProductsAction(page: 0));
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
              onRefresh: () async {
                action.dispatch(GetAllProductsAction(page: 0));
              },
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
                    return CardProductWidget(productEntity: mainBloc.lpAll[index],
                      type: 0, count: 1,);
                  },
              ),
                ),
              ),
            );
        }
        }),
      ),
      bottomNavigationBar: const NavigatorWidget(),
    );
  }
}

