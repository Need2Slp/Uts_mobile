import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Timeconverterpage extends StatefulWidget {
  const Timeconverterpage({Key? key}) : super(key: key);

  @override
  _TimeconverterpageState createState() => _TimeconverterpageState();
}

class _TimeconverterpageState extends State<Timeconverterpage> {
  double inputTime = 0;
  double convertedValue = 0;
  String selectedUnitInput = 'Jam';
  String selectedUnitOutput = 'Jam';

  void convertTime() {
    double inputValue = inputTime;
    if (selectedUnitInput == 'Hari') {
      inputValue *= 24;
    } else if (selectedUnitInput == 'Minggu') {
      inputValue *= 24 * 7;
    } else if (selectedUnitInput == 'Tahun') {
      inputValue *= 24 * 365;
    }

    if (selectedUnitOutput == 'Hari') {
      convertedValue = inputValue / 24;
    } else if (selectedUnitOutput == 'Minggu') {
      convertedValue = inputValue / (24 * 7);
    } else if (selectedUnitOutput == 'Tahun') {
      convertedValue = inputValue / (24 * 365);
    } else {
      convertedValue = inputValue;
    }

    // Perbarui UI dengan nilai yang dikonversi
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Time Converter',
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
                    items: <String>['Jam', 'Hari', 'Minggu', 'Tahun']
                        .map<DropdownMenuItem<String>>((String value) {
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
                    items: <String>['Jam', 'Hari', 'Minggu', 'Tahun']
                        .map<DropdownMenuItem<String>>((String value) {
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
                    inputTime = double.tryParse(value) ?? 0;
                  },
                  decoration: InputDecoration(
                    labelText: 'Masukkan Waktu',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: convertTime,
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
