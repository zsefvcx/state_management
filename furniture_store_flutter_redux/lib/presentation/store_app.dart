
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:furniture_store/presentation/redux/action_main.dart';
import 'package:furniture_store/presentation/redux/app_state.dart';
import 'package:furniture_store/presentation/route_generator.dart';


class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    StoreProvider.of<MainAppState>(context).dispatch(GetAllProductsAction(page: 0));
    return MaterialApp(
      title: 'Store Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RouteGenerator.initialRoute,
      onGenerateRoute: (RouteSettings settings)=>RouteGenerator.generateRoute(settings),
    );
  }
}
