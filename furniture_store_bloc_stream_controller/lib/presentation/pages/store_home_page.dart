
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:furniture_store/domain/bloc/bloc.dart';
import 'package:furniture_store/domain/bloc/main_bloc.dart';
import 'package:furniture_store/presentation/widgets/navigator_widget.dart';
import 'package:furniture_store/presentation/widgets/widgets.dart';
import 'package:provider/provider.dart';

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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: AppBarTitleWidget(title: widget.title),
        centerTitle: true,
      ),
      //Использовать Visibility
      body:SafeArea(
        child: Consumer<MainBloc>(builder: (_, mainBloc, __) {
        if (mainBloc.mainModel.isTimeOut || mainBloc.mainModel.isError){
          return Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('isTimeOut  :${mainBloc.mainModel.isTimeOut.toString()}'),
              Text('isError    :${mainBloc.mainModel.isError.toString()}'),
              Text('isErrorType:${mainBloc.mainModel.e.runtimeType}'),
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
        } if (!mainBloc.mainModel.isLoaded) {
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
                  itemCount: mainBloc.mainModel.lpAll.length,
                  itemBuilder: (_, index) {
                    return CardProductWidget(productEntity: mainBloc.mainModel.lpAll[index],
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
    floatingActionButton: FloatingActionButton(
      onPressed: (){
        context.read<FavoritesBloc>().add(const FavoritesBlocEvent.init());
      },
    ),
    );
  }
}

