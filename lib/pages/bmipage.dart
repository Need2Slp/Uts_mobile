import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Bmipage extends StatefulWidget {
  const Bmipage({Key? key}) : super(key: key);

  @override
  _BmipageState createState() => _BmipageState();
}

class _BmipageState extends State<Bmipage> {
  Color myColor = Colors.transparent;
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  var mainResult = TextEditingController();
  var bmiStatus = '';

  calculateBMI(String weight, String height) {
    var myDoubleWeight = double.parse(weight);
    var myDoubleHeight = double.parse(height) / 100;
    var res = myDoubleWeight / (myDoubleHeight * myDoubleHeight);

    setState(() {
      mainResult.text = res.toStringAsFixed(2);
      myColor = getColorForBMI(res);
      bmiStatus = getStatusForBMI(res);
    });
  }

  Color getColorForBMI(double bmi) {
    if (bmi < 18.5) {
      return Colors.blue;
    } else if (bmi <= 24.9) {
      return Colors.green;
    } else if (bmi <= 29.9) {
      return Colors.amber;
    } else if (bmi <= 34.9) {
      return Colors.deepOrange;
    } else {
      return Colors.red;
    }
  }

  String getStatusForBMI(double bmi) {
    if (bmi < 18.5) {
      return "Underweight";
    } else if (bmi <= 24.9) {
      return "Normal";
    } else if (bmi <= 29.9) {
      return "Overweight";
    } else if (bmi <= 34.9) {
      return "Obese";
    } else {
      return "Extreme";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Body Mass Index',
          style: GoogleFonts.acme(),
        ),
      ),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 30),
              buildTextField(weightController, "Enter your weight (kg)",
                  Icons.line_weight),
              SizedBox(height: 20),
              buildTextField(
                  heightController, "Enter your height (cm)", Icons.height),
              SizedBox(height: 20),
              buildCalculateButton(),
              SizedBox(height: 20),
              buildResultContainer(mainResult.text, myColor),
              SizedBox(height: 10),
              Text(
                bmiStatus,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      TextEditingController controller, String hintText, IconData icon) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        style: TextStyle(fontSize: 18, color: Colors.black),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }

  Widget buildCalculateButton() {
    return ElevatedButton(
      onPressed: () {
        calculateBMI(weightController.text, heightController.text);
      },
      child: Text(
        "Calculate",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.blue),
        padding: MaterialStateProperty.all(EdgeInsets.all(15)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        )),
      ),
    );
  }

  Widget buildResultContainer(String bmiResult, Color color) {
    return Container(
      width: 150,
      height: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          "BMI: $bmiResult kg/m²",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
