
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:furniture_store/domain/bloc/main_bloc.dart';
import 'package:furniture_store/presentation/widgets/widgets.dart';
import 'package:provider/provider.dart';


class StoreHomePage extends StatefulWidget {
  const StoreHomePage({super.key, required this.title});

  final String title;

  @override
  State<StoreHomePage> createState() => _StoreHomePageState();
}

class _StoreHomePageState extends State<StoreHomePage> {
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
      body:Consumer<MainBloc>(builder: (_, mainBloc, __) {
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
    );
  }
}
