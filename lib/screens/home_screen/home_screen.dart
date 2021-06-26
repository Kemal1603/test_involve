//------------------------- IMPORTED MODULES -------------------------//
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_involve_app/models/europe_provider.dart';

import '../../components/size_config.dart';
import 'components/home_screen_body.dart';

//------------------------ CLASS DECLARATION -------------------------//
class HomeScreen extends StatelessWidget {
  static String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<CountriesCartList>(context);
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.only(top: SizeConfig.screenHeight * 0.02),
          child: Text(
            'Europe Countries',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: HomeScreenBodyWidget(
        data: data,
      )),
    );
  }
}
//------------------------------- EOF -------------------------------//
