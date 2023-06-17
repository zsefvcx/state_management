
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:furniture_store/presentation/store_app.dart';
import 'package:furniture_store/presentation/widgets/navigator_widget.dart';
import 'package:furniture_store/presentation/widgets/widgets.dart';


class StoreHomePage extends StatelessWidget {
  static const routeName = '/';

  const StoreHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: AppBarTitleWidget(title: title),
        centerTitle: true,
      ),
      //Использовать Visibility
      body:SafeArea(
        child: Consumer(builder: (_, ref, __) {
          final mainBlocStatus =  ref.watch(mainBlocProvider);
        if (mainBlocStatus.timeOut || mainBlocStatus.isError){
          return Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('isTimeOut  :${mainBlocStatus.timeOut.toString()}'),
              Text('isError    :${mainBlocStatus.isError.toString()}'),
              Text('isErrorType:${mainBlocStatus.e.runtimeType}'),
              const SizedBox(height: 50,),
              TextButton(
                  onPressed: () {
                    ref.read(mainBlocProvider.notifier).getAllProducts(0);
                    //setState(() {
                    //});
                  },
                  child: const Text('Try again')
              ),
            ],
          ));
        } if (!mainBlocStatus.isLoaded) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return
            RefreshIndicator(
              onRefresh: () async => await ref.read(mainBlocProvider.notifier).getAllProducts(0),
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
                  itemCount: mainBlocStatus.lpAll.length,
                  itemBuilder: (_, index) {
                    return CardProductWidget(productEntity: mainBlocStatus.lpAll[index],
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

