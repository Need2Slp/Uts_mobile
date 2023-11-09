import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mobilerega/pages/homepage.dart';
import 'package:mobilerega/pages/mathgrouppage.dart';
import 'package:mobilerega/pages/profilepage.dart';

class Btnavbar extends StatefulWidget {
  const Btnavbar({Key? key}) : super(key: key);

  @override
  _BtnavbarState createState() => _BtnavbarState();
}

class _BtnavbarState extends State<Btnavbar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: Colors.grey,
        items: <Widget>[
          Icon(Icons.home_rounded, color: Colors.indigo),
          Icon(Icons.calculate_rounded, color: Colors.indigo),
          Icon(Icons.person, color: Colors.indigo),
          //Icon(Icons.scale_rounded, color: Colors.indigo),
          //Icon(Icons.local_atm_rounded, color: Colors.indigo),
        ],
        //animationDuration: Duration(milliseconds: 400),
        index: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: <Widget>[
        Homepage(),
        Mathgrouppage(),
        Profilepage(),

        //Calculatorpage(),
        //Currencyconverterpage(),
        //Bmipage(),
        //Mathgrouppage(),

        //Temperatureconverterpage(),
        // Calculator(),
      ][currentIndex],
    );
  }
}
