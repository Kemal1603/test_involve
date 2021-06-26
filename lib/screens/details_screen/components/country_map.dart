//------------------------- IMPORTED MODULES -------------------------//
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';


//------------------------ CLASS DECLARATION -------------------------//
class CountryMap extends StatelessWidget {
  const CountryMap({
    @required this.country,
  });

  final  country;

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
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
    );
  }
}
//------------------------------- EOF -------------------------------//