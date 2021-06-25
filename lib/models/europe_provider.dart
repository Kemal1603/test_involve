import 'package:flutter/material.dart';

import 'Country.dart';

class CountriesCartList extends ChangeNotifier {
  List<Country> allCountries = [];


  void updateAllCountriesList(List<dynamic> countriesFromApi) {
    countriesFromApi.forEach((country) {
      this.allCountries.add(Country(
            name: country['name'],
            alpha2Code: country['alpha2Code'],
            alpha3Code: country['alpha3Code'],
            altSpellings: country['altSpellings'],
            borders: country['borders'],
            callingCodes: country['callingCodes'],
            capital: country['capital'],
            cioc: country['cioc'],
            currencies: country['currencies'],
            demonym: country['demonym'],
            flag: country['flag'],
            languages: country['languages'],
            latlng: country['latlng'],
            nativeName: country['nativeName'],
            numericCode: country['numericCode'],
            region: country['region'],
            regionalBlocs: country['regionalBlocs'],
            subregion: country['subregion'],
            timezones: country['timezones'],
            topLevelDomain: country['topLevelDomains'],
            translations: country['translations'],
          ));
    });
    notifyListeners();
  }


  /*void addCart({Europe country}) {

    this.items.add(country);
    notifyListeners();

  }*/

  void removeCountry({int index}) {
    this.allCountries.removeAt(index);
    notifyListeners();
  }
}
