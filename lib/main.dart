import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_involve_app/routes.dart';
import 'package:test_involve_app/screens/home_screen/home_screen.dart';

import 'models/europe_provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CountriesCartList>(
      create:  (context) => CountriesCartList(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: HomeScreen.routeName,
        routes: routes,
      ),
    );
  }
}

