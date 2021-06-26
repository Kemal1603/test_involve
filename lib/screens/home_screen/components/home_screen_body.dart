//------------------------- IMPORTED MODULES -------------------------//
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_involve_app/models/Country.dart';
import 'package:test_involve_app/models/europe_provider.dart';
import 'package:test_involve_app/network/api_call.dart';
import 'package:test_involve_app/screens/details_screen/details_screen.dart';
import 'package:test_involve_app/screens/home_screen/components/try_again_button.dart';

import '../../../components/size_config.dart';
import 'item_card.dart';
import 'secondary_loader.dart';

//------------------------ CLASS DECLARATION -------------------------//
class HomeScreenBodyWidget extends StatefulWidget {
  final data;

  const HomeScreenBodyWidget({
    @required this.data,
  });

  @override
  _HomeScreenBodyWidgetState createState() => _HomeScreenBodyWidgetState();
}

class _HomeScreenBodyWidgetState extends State<HomeScreenBodyWidget> {
  final TextEditingController controller = TextEditingController();
  bool needReboot = false;
  bool searchFieldPause = false;
  List<Country> items = [];

  /*---- FUNCTION WHICH IS DELAY SEARCH RESULTS FOR 1.5 SECONDS----*/
  void searchFieldDelay() async {
    setState(() {
      searchFieldPause = true;
    });
    await Future.delayed(Duration(milliseconds: 1500));
    setState(() {
      searchFieldPause = false;
    });
  }

  /*---- FUNCTION WHICH'LL BE CALLED 8 SECS AFTER PAGE INITIALIZATION
   IN CASE IF SOMETHING'LL GO WRONG----*/
  void rebootDelay() async {
    await Future.delayed(Duration(seconds: 8));
    setState(() {
      needReboot = true;
    });
  }

  /*---- FUNCTION WHICH IS RETURN NECESSARY LIST DEPEND ON USER'S
  INPUT  THIS FUNCTION IS ACTIVATING ONLY UNDER CONDITION WHERE
   USER'S INPUT LENGTH > 3 ----*/
  void filterSearchResults(String query) {
    List<Country> dummySearchList = [];
    dummySearchList.addAll(widget.data.allCountries);
    if (query.isNotEmpty) {
      List<Country> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.name.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
    } else {
      setState(() {
        items.clear();
        items.addAll(widget.data.allCountries);
      });
    }
  }


  /*---- FUNCTION WHICH IS FETCHING DATA FROM API AND SET PROVIDER MODELS
  allCountries LIST TO countriesFromApi ----*/
  getData() async {
    await Network('https://restcountries.eu/rest/v2/region/europe')
        .fetchData()
        .then((countriesFromApi) {
      Provider.of<CountriesCartList>(context, listen: false)
          .updateAllCountriesList(countriesFromApi);
      setState(() {
        items.clear();
        items.addAll(widget.data.allCountries);
      });
    });
  }

  @override
  void initState() {
    getData();
    items.addAll(widget.data.allCountries);
    rebootDelay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: SizeConfig.screenWidth * 0.9,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: TextField(
                  onChanged: (value) async {
                    if (value.length >= 3) {
                      searchFieldDelay();
                      filterSearchResults(value);
                    } else {
                      setState(() {
                        items.clear();
                        items.addAll(widget.data.allCountries);
                      });
                    }
                  },
                  controller: controller,
                  decoration: InputDecoration(
                    disabledBorder: InputBorder.none,
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search',
                  ),
                ),
              ),
            ],
          ),
        ),
        searchFieldPause
            ? SecondaryLoaderWidget()
            : Container(
                height: SizeConfig.screenHeight * 0.8,
                child: widget.data.allCountries.length > 0
                    ? ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(6.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  DetailsScreen.routeName,
                                  arguments: items[index],
                                );
                              },
                              child: Dismissible(
                                secondaryBackground: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.delete_forever,
                                        size: 40.0,
                                      ),
                                    ],
                                  ),
                                ),
                                key: UniqueKey(),
                                background: Container(color: Colors.redAccent),
                                child: ItemCardWidget(items: items, index: index,),
                                direction: DismissDirection.endToStart,
                                onDismissed: (direction) {
                                  setState(() {
                                    items.remove(items[index]);
                                    Provider.of<CountriesCartList>(context,
                                            listen: false)
                                        .removeCountry(index: index);
                                  });
                                },
                              ),
                            ),
                          );
                        })
                    : needReboot
                        ? TryAgainButton()
                        : Center(child: CircularProgressIndicator()),
              ),
      ],
    );
  }
}

//------------------------------- EOF -------------------------------//