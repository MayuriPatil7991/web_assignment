import 'package:assignment/presentation/breweries/breweries_view.dart';
import 'package:assignment/presentation/breweries/breweries_viewmodel.dart';
import 'package:assignment/providers/providers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BreweriesView(BreweriesViewModel(provideUseCase())),
    );
  }
}
