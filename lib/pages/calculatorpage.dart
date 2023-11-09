import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculatorpage(),
    );
  }
}

class Calculatorpage extends StatefulWidget {
  const Calculatorpage({Key? key}) : super(key: key);

  @override
  _CalculatorpageState createState() => _CalculatorpageState();
}

class _CalculatorpageState extends State<Calculatorpage> {
  TextEditingController input1 = TextEditingController();
  TextEditingController input2 = TextEditingController();
  TextEditingController output = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Calculator',
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
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            buildTextField(input1, "Masukkan Angka 1", Icons.looks_one),
            SizedBox(height: 20),
            buildTextField(input2, "Masukkan Angka 2", Icons.looks_two),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildOperationButton("+", '+'),
                buildOperationButton("-", '-'),
                buildOperationButton("x", '*'),
                buildOperationButton("/", '/'),
              ],
            ),
            SizedBox(height: 20),
            buildTextField(output, "Hasil", Icons.calculate),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(
    TextEditingController controller,
    String hintText,
    IconData icon,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        style: GoogleFonts.chakraPetch(
          fontSize: 18,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          labelText: hintText,
          prefixIcon: Icon(icon),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget buildOperationButton(String label, String operation) {
    return ElevatedButton(
      onPressed: () {
        calculate(operation);
      },
      child: Text(label),
    );
  }

  void calculate(String operation) {
    double a = double.parse(input1.text);
    double b = double.parse(input2.text);
    double hasil = 0.0;

    if (operation == "+") {
      hasil = a + b;
    } else if (operation == "-") {
      hasil = a - b;
    } else if (operation == "*") {
      hasil = a * b;
    } else if (operation == "/") {
      hasil = a / b;
    } else {
      hasil = 0.0;
    }
    setState(() {
      output.text = hasil.toString();
    });
  }
}
