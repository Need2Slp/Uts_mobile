import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Inputnilaipage extends StatefulWidget {
  const Inputnilaipage({Key? key}) : super(key: key);

  @override
  _InputnilaipageState createState() => _InputnilaipageState();
}

class _InputnilaipageState extends State<Inputnilaipage> {
  double uts = 0;
  double uas = 0;
  double tugas1 = 0;
  double tugas2 = 0;
  double nilaiAkhir = 0;
  String indeksNilai = "";
  double ipk = 0;

  void calculateNilai() {
    // Hitung nilai akhir berdasarkan bobot
    nilaiAkhir = (uts * 0.3) + (uas * 0.4) + (tugas1 * 0.15) + (tugas2 * 0.15);

    // Tentukan indeks nilai berdasarkan kisaran nilai
    if (nilaiAkhir >= 88) {
      indeksNilai = "A";
    } else if (nilaiAkhir >= 75) {
      indeksNilai = "AB";
    } else if (nilaiAkhir >= 70) {
      indeksNilai = "B";
    } else if (nilaiAkhir >= 65) {
      indeksNilai = "BC";
    } else if (nilaiAkhir >= 60) {
      indeksNilai = "C";
    } else if (nilaiAkhir >= 50) {
      indeksNilai = "CD";
    } else {
      indeksNilai = "D";
    }

    // Hitung IPK dengan rata-rata nilai indeks yang diperoleh
    ipk = (nilaiAkhir / 100) * 4;

    // Update the UI to reflect the calculated values
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Grade Index',
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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text('Nilai UTS:',
                            style: GoogleFonts.openSans(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        TextField(
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            uts = double.tryParse(value) ?? 0;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 2.0,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 10, // Tambahkan padding horizontal
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      children: [
                        Text('Nilai UAS:',
                            style: GoogleFonts.openSans(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        TextField(
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            uas = double.tryParse(value) ?? 0;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 2.0,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 10, // Tambahkan padding horizontal
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text('Nilai Tugas 1:',
                            style: GoogleFonts.openSans(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        TextField(
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            tugas1 = double.tryParse(value) ?? 0;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 2.0,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 10, // Tambahkan padding horizontal
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      children: [
                        Text('Nilai Tugas 2:',
                            style: GoogleFonts.openSans(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        TextField(
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            tugas2 = double.tryParse(value) ?? 0;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 2.0,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 10, // Tambahkan padding horizontal
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: calculateNilai,
                child: Text('Hitung Nilai dan IPK'),
              ),
              SizedBox(height: 16),
              Text(
                'Nilai Akhir: $nilaiAkhir',
                style: GoogleFonts.mooli(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'Indeks Nilai: $indeksNilai',
                style: GoogleFonts.mooli(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                'IPK: $ipk',
                style: GoogleFonts.mooli(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
