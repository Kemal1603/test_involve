//------------------------- IMPORTED MODULES -------------------------//
import 'package:flutter/material.dart';

import '../home_screen.dart';

//------------------------ CLASS DECLARATION -------------------------//
class TryAgainButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Something went wrong! '),
          ElevatedButton(onPressed: (){
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => HomeScreen()));
          },
            child: Text('Try Again'),),
        ],
      ),
    );
  }
}
//------------------------------- EOF -------------------------------//