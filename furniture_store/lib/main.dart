import 'package:flutter/material.dart';
import 'package:furniture_store/presentation/my_app.dart';

import 'domain/bloc/bloc_factory.dart';

void main() {
  BlocFactory.instance.initialize();
  runApp(const MyApp());
}