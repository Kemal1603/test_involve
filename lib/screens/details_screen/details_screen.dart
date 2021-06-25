import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../size_config.dart';

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
      body: Column(
        children: [
          Container(
            height: SizeConfig.screenHeight * 0.5,
            child: FlutterMap(
              options: MapOptions(
                center: LatLng(country.latlng[0], country.latlng[1]),
                zoom: 6.0,
              ),
              layers: [
                TileLayerOptions(
                    urlTemplate:
                        "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c']),
                MarkerLayerOptions(
                  markers: [
                    Marker(
                      width: 80.0,
                      height: 80.0,
                      point: LatLng(country.latlng[0], country.latlng[1]),
                      builder: (ctx) => Container(
                        child: Icon(
                          Icons.add_location,
                          size: 50.0,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
