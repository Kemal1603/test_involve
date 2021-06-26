//------------------------- IMPORTED MODULES -------------------------//
import 'package:flutter/material.dart';
import 'package:test_involve_app/components/size_config.dart';


//------------------------ CLASS DECLARATION -------------------------//
class CountryDetailRow extends StatelessWidget {

  final String text;
  final dynamic data;


  CountryDetailRow({this.text, this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$text:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
          SizedBox(
            width: SizeConfig.screenWidth * 0.08,
          ),
          Container(
            width: SizeConfig.screenWidth * 0.4,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                '$data',
                style: TextStyle(fontSize: 17.0, color: Colors.lightBlue),
              ),
            ),
          )
        ],
      ),
    );
  }
}
//------------------------------- EOF -------------------------------//