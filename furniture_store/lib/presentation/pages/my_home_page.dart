
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:furniture_store/domain/bloc/main_bloc.dart';
import 'package:furniture_store/domain/entities/entities.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('build MyHomePage');
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body:Consumer<MainBloc>(builder: (_, mainBloc, __) {
        mainBloc.getAllProducts(0);
      if (!mainBloc.isLoaded) {
        return const CircularProgressIndicator();
      } else {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                mainBloc.lpAll.join('\n'),
              ),
            ],
          ),
        );
      }
      }),
    );
  }
}
