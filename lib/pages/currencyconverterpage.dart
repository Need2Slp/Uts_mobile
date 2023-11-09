import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Currencyconverterpage extends StatefulWidget {
  const Currencyconverterpage({Key? key}) : super(key: key);

  @override
  _CurrencyconverterpageState createState() => _CurrencyconverterpageState();
}

class _CurrencyconverterpageState extends State<Currencyconverterpage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _amountController = TextEditingController();
  String _selectedCurrency = 'USD';
  String _convertedAmount = '';

  Map<String, double> exchangeRates = {
    'USD': 0.000064,
    'MYR': 0.00030,
    'JPY': 0.0096,
  };

  // Custom method to create a TextField widget
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Currency Converter',
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
            ],
          ),
        ),
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildTextField(
                _amountController,
                "Nilai Mata Uang IDR",
                Icons.monetization_on,
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: DropdownButtonFormField<String>(
                  value: _selectedCurrency,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedCurrency = newValue!;
                    });
                  },
                  items: exchangeRates.keys.map((String currency) {
                    return DropdownMenuItem<String>(
                      value: currency,
                      child: Text(currency),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final amountInIDR = double.parse(_amountController.text);
                    final convertedAmount =
                        amountInIDR * exchangeRates[_selectedCurrency]!;
                    setState(() {
                      _convertedAmount = convertedAmount.toStringAsFixed(2);
                    });
                  }
                },
                child: Text("Konversi"),
              ),
              SizedBox(height: 20),
              Text(
                "Konversi ke $_selectedCurrency : $_convertedAmount",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white70,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
