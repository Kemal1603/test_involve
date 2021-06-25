//------------------------ CLASS DECLARATION -------------------------//
class Country {
  final String name,
      alpha2Code,
      alpha3Code,
      capital,
      region,
      subregion,
      demonym,
      nativeName,
      numericCode,
      cioc,
      flag;

  final List<dynamic> topLevelDomain,
      callingCodes,
      altSpellings,
      latlng,
      timezones,
      borders,
      currencies,
      languages,
      regionalBlocs;

  final Map<String, dynamic> translations;

  Country(
      {this.name,
      this.alpha2Code,
      this.alpha3Code,
      this.capital,
      this.region,
      this.subregion,
      this.demonym,
      this.nativeName,
      this.numericCode,
      this.cioc,
      this.flag,
      this.topLevelDomain,
      this.callingCodes,
      this.altSpellings,
      this.latlng,
      this.timezones,
      this.borders,
      this.currencies,
      this.languages,
      this.regionalBlocs,
      this.translations}
      );
}

//------------------------------- EOF -------------------------------//
