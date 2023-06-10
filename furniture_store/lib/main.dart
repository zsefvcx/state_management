import 'package:flutter/material.dart';
import 'package:furniture_store/presentation/MyApp.dart';

import 'domain/bloc/bloc_factory.dart';

void main() {
  BlocFactory.instance.initialize();
  runApp(const MyApp());
}