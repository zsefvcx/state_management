
import 'package:flutter/material.dart';
import 'package:furniture_store/domain/bloc/main_bloc.dart';
import 'package:furniture_store/presentation/pages/store_home_page.dart';
import 'package:provider/provider.dart';

import '../domain/bloc/bloc_factory.dart';

class StoreApp extends StatefulWidget {
  const StoreApp({super.key});

  @override
  State<StoreApp> createState() => _StoreAppState();
}

class _StoreAppState extends State<StoreApp> {
  late final MainBloc _mainBloc;

  @override
  void initState() {
    super.initState();
    _mainBloc = BlocFactory.instance.get<MainBloc>();
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _mainBloc.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainBloc>(
            create: (_) =>
            _mainBloc),
      ],
      child: MaterialApp(
        title: 'Store Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const StoreHomePage(title: 'Store'),
      ),
    );
  }
}
