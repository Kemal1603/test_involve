//------------------------- IMPORTED MODULES -------------------------//
import 'package:flutter/material.dart';

import '../../components/size_config.dart';
import 'components/country_details_body.dart';


//------------------------ CLASS DECLARATION -------------------------//
class DetailsScreen extends StatelessWidget {
  static String routeName = '/details';

  @override
  Widget build(BuildContext context) {
    final dynamic country = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
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
      body: CountryDetailBody(country: country),
    );
  }
}




//------------------------------- EOF -------------------------------//


