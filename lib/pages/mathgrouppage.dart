import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobilerega/pages/bmipage.dart';
import 'package:mobilerega/pages/calculatorpage.dart';
import 'package:mobilerega/pages/currencyconverterpage.dart';
import 'package:mobilerega/pages/inputnilaipage.dart';
import 'package:mobilerega/pages/lengthconverterpage.dart';
import 'package:mobilerega/pages/temperatureconverterpage.dart';
import 'package:mobilerega/pages/timeconverterpage.dart';

import 'navigationdrawerwidget.dart';

class Mathgrouppage extends StatefulWidget {
  const Mathgrouppage({Key? key}) : super(key: key);

  @override
  _MathgrouppageState createState() => _MathgrouppageState();
}

class _MathgrouppageState extends State<Mathgrouppage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Math Operations',
          style: GoogleFonts.acme(),
        ),
      ),
      drawer: Navigationdrawerwidget(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.cyan,
                Colors.indigo,
              ]),
        ),
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Calculatorpage()),
                  );
                },
                leading: Icon(
                  Icons.calculate,
                  size: 50,
                ),
                title: Text('Calculator'),
                subtitle: Text('Perform basic arithmetic operations'),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Currencyconverterpage()),
                  );
                },
                leading: Icon(
                  Icons.money,
                  size: 50,
                ),
                title: Text('Currency Converter'),
                subtitle: Text('Convert between different currencies'),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Temperatureconverterpage()),
                  );
                },
                leading: Icon(
                  Icons.thermostat,
                  size: 50,
                ),
                title: Text('Temperature Converter'),
                subtitle: Text('Convert between temperature scales'),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Bmipage()),
                  );
                },
                leading: Icon(
                  Icons.accessibility,
                  size: 50,
                ),
                title: Text('BMI Calculator'),
                subtitle: Text('Calculate your Body Mass Index'),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Inputnilaipage()),
                  );
                },
                leading: Icon(
                  Icons.numbers,
                  size: 50,
                ),
                title: Text('Grade Index Calculator'),
                subtitle: Text('Calculate your grade based on scores'),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Lengthconverterpage()),
                  );
                },
                leading: Icon(
                  Icons.straighten,
                  size: 50,
                ),
                title: Text('Lenght Converter'),
                subtitle: Text('Convert between different length units'),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Timeconverterpage()),
                  );
                },
                leading: Icon(
                  Icons.av_timer,
                  size: 50,
                ),
                title: Text('Time Converter'),
                subtitle: Text('Convert between different time units'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
