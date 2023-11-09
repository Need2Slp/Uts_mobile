import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Lengthconverterpage extends StatefulWidget {
  const Lengthconverterpage({Key? key}) : super(key: key);

  @override
  _LengthconverterpageState createState() => _LengthconverterpageState();
}

class _LengthconverterpageState extends State<Lengthconverterpage> {
  double? inputLength;
  double convertedValue = 0;
  String selectedUnitInput = 'Centimeter';
  String selectedUnitOutput = 'Centimeter';

  final units = ['Centimeter', 'Decimeter', 'Meter', 'Hectometer', 'Kilometer'];

  Map<String, double> unitValues = {
    'Centimeter': 1,
    'Decimeter': 10,
    'Meter': 100,
    'Hectometer': 1000,
    'Kilometer': 100000,
  };

  double getConversionFactor(String unit) {
    if (unitValues.containsKey(unit)) {
      return unitValues[unit]!;
    } else {
      return 1.0; // Nilai default jika unit tidak ada dalam unitValues
    }
  }

  void convertLength() {
    if (inputLength == null) {
      return;
    }

    double inputValue = inputLength!;
    double inputFactor = getConversionFactor(selectedUnitInput);
    double outputFactor = getConversionFactor(selectedUnitOutput);

    convertedValue = (inputValue * inputFactor) / outputFactor;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Length Converter',
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Konversi dari:'),
                  SizedBox(width: 16),
                  DropdownButton<String>(
                    value: selectedUnitInput,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedUnitInput = newValue!;
                      });
                    },
                    items: units.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Konversi ke:'),
                  SizedBox(width: 16),
                  DropdownButton<String>(
                    value: selectedUnitOutput,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedUnitOutput = newValue!;
                      });
                    },
                    items: units.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Container(
                width: 300,
                child: TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    inputLength = double.tryParse(value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Masukkan Panjang',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: convertLength,
                child: Text('Konversi'),
              ),
              SizedBox(height: 16),
              Text(
                'Hasil Konversi:',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '$convertedValue $selectedUnitOutput',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
