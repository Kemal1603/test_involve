//------------------------- IMPORTED MODULES -------------------------//
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_involve_app/components/size_config.dart';
import 'package:test_involve_app/models/Country.dart';


//------------------------ CLASS DECLARATION -------------------------//
class ItemCardWidget extends StatelessWidget {
  const ItemCardWidget({

    @required this.items, this.index,
  });

  final List<Country> items;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: ListTile(
        leading: Container(
          width: SizeConfig.screenWidth * 0.1,
          height: SizeConfig.screenHeight * 0.1,
          child: SvgPicture.network(
              '${items[index].flag}'),
        ),
        title: Center(
          child: Column(
            children: [
              Text('${items[index].name}'),
              SizedBox(
                height:
                SizeConfig.screenHeight * 0.02,
              ),
              Text('${items[index].subregion}'),
              SizedBox(
                height:
                SizeConfig.screenHeight * 0.02,
              ),
              Text('${items[index].alpha2Code}')
            ],
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
//------------------------------- EOF -------------------------------//