//------------------------- IMPORTED MODULES -------------------------//
import 'package:flutter/material.dart';
import 'package:test_involve_app/components/size_config.dart';

import 'country_detail_row.dart';
import 'country_map.dart';


//------------------------ CLASS DECLARATION -------------------------//
class CountryDetailBody extends StatelessWidget {
  const CountryDetailBody({
    @required this.country,
  });

  final  country;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: SizeConfig.screenHeight * 0.5,
            child: CountryMap(country: country),
          ),
          Divider(
            color: Colors.black,
            thickness: 2.0,
          ),
          CountryDetailRow(text: 'Numeric Code', data: country.numericCode),
          CountryDetailRow(text: 'Borders', data: country.borders),
          CountryDetailRow(text: 'Currencies', data: country.currencies),
        ],
      ),
    );
  }
}
//------------------------------- EOF -------------------------------//