import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Temperatureconverterpage extends StatefulWidget {
  const Temperatureconverterpage({Key? key}) : super(key: key);

  @override
  State<Temperatureconverterpage> createState() =>
      _TemperatureconverterpageState();
}

class _TemperatureconverterpageState extends State<Temperatureconverterpage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _temperatureController = TextEditingController();
  double celsius = 0;
  double fahrenheit = 0;
  double kelvin = 0;
  String _selectedUnit = 'Celsius';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Temperature Converter',
          style: GoogleFonts.acme(),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.cyan, Colors.indigo],
          ),
        ),
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildInputField("Enter Temperature", Icons.thermostat),
              SizedBox(height: 20),
              _buildDropdown(),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _convertTemperature,
                child: Text("Convert"),
              ),
              SizedBox(height: 20),
              _buildResultText("Celsius", celsius),
              _buildResultText("Fahrenheit", fahrenheit),
              _buildResultText("Kelvin", kelvin),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String hintText, IconData icon) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        controller: _temperatureController,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        style: TextStyle(fontSize: 18, color: Colors.black),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }

  Widget _buildDropdown() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: DropdownButtonFormField<String>(
        value: _selectedUnit,
        onChanged: (String? newValue) {
          setState(() {
            _selectedUnit = newValue!;
          });
        },
        items: ['Celsius', 'Fahrenheit', 'Kelvin'].map((String unit) {
          return DropdownMenuItem<String>(
            value: unit,
            child: Text(unit),
          );
        }).toList(),
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildResultText(String unit, double value) {
    return Text(
      "$unit: ${value.toStringAsFixed(2)} $unit",
      style: TextStyle(
        fontSize: 20,
        color: Colors.white70,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  void _convertTemperature() {
    if (_formKey.currentState!.validate()) {
      final temperature = double.tryParse(_temperatureController.text) ?? 0;

      switch (_selectedUnit) {
        case 'Celsius':
          setState(() {
            celsius = temperature;
            fahrenheit = (temperature * 9 / 5) + 32;
            kelvin = temperature + 273.15;
          });
          break;
        case 'Fahrenheit':
          setState(() {
            fahrenheit = temperature;
            celsius = (temperature - 32) * 5 / 9;
            kelvin = (temperature - 32) * 5 / 9 + 273.15;
          });
          break;
        case 'Kelvin':
          setState(() {
            kelvin = temperature;
            celsius = temperature - 273.15;
            fahrenheit = (temperature - 273.15) * 9 / 5 + 32;
          });
          break;
      }
    }
  }
}
