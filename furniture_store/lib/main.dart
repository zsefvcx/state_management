import 'package:flutter/material.dart';
import 'package:furniture_store/presentation/store_app.dart';

import 'domain/bloc/bloc.dart';

void main() {
  BlocFactory.instance.initialize();
  runApp(const StoreApp());
}