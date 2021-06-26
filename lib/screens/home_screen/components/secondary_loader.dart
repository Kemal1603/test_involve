//------------------------- IMPORTED MODULES -------------------------//
import 'package:flutter/material.dart';
import 'package:test_involve_app/components/size_config.dart';


//------------------------ CLASS DECLARATION -------------------------//
class SecondaryLoaderWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenHeight * 0.4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
//------------------------------- EOF -------------------------------//