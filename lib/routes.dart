//------------------------- IMPORTED MODULES -------------------------//
import 'package:flutter/material.dart';
import 'package:test_involve_app/screens/details_screen/details_screen.dart';
import 'package:test_involve_app/screens/home_screen/home_screen.dart';

/*---------------- DECLARE ALL MAP OF ROUTES ----------------*/
final Map<String, WidgetBuilder> routes = {
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),

};
//------------------------------- EOF -------------------------------//