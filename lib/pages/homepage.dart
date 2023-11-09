import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobilerega/pages/navigationdrawerwidget.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Home Page',
          style: GoogleFonts.acme(),
        ),
      ),
      drawer: Navigationdrawerwidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(5, (index) {
                  String imageUrl = '';
                  switch (index) {
                    case 0:
                      imageUrl =
                          'https://www.bing.com/th/id/OIP.YwW_-RA4kg8t8a0Vly1hJQHaLA?w=137&h=203&c=7&r=0&o=5&dpr=1.8&pid=1.7';
                      break;
                    case 1:
                      imageUrl =
                          'https://th.bing.com/th/id/OIP.wfpCMXL9Udn324-zuI5yJQHaK-?w=116&h=180&c=7&r=0&o=5&dpr=1.8&pid=1.7';
                      break;
                    case 2:
                      imageUrl =
                          'https://th.bing.com/th/id/OIP.Hj2wTo6-JX37yyHV_TuFoAHaLJ?w=117&h=180&c=7&r=0&o=5&dpr=1.8&pid=1.7';
                      break;
                    case 3:
                      imageUrl =
                          'https://th.bing.com/th/id/OIP.Hn0TEwPFdZozpA9klAFKCwHaLH?w=138&h=207&c=7&r=0&o=5&dpr=1.8&pid=1.7';
                      break;
                    case 4:
                      imageUrl =
                          'https://th.bing.com/th/id/OIP.R6OLyj4V_1fdVy57neA0GQHaLH?w=138&h=207&c=7&r=0&o=5&dpr=1.8&pid=1.7';
                      break;
                  }
                  return _buildImageCard(imageUrl);
                }),
              ),
            ),
            _buildTextCard1(),
            _buildTextCard2(),
            _buildTextCard3(),
            _buildTextCard4(),
            _buildTextCard5(),
          ],
        ),
      ),
    );
  }

  Widget _buildImageCard(String imageUrl) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 200,
      height: 200,
      color: Colors.cyanAccent.shade700,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: Image.network(imageUrl),
      ),
    );
  }

  Widget _buildTextCard1() {
    return Container(
      margin: EdgeInsets.all(10),
      height: 200,
      color: Colors.cyanAccent.shade700,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Image.network(
              'https://www.bing.com/th/id/OIP.YwW_-RA4kg8t8a0Vly1hJQHaLA?w=137&h=203&c=7&r=0&o=5&dpr=1.8&pid=1.7',
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Laut Bercerita',
                  style: GoogleFonts.openSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 20),
                  child: Text(
                    'Laut Bercerita menceritakan terkait perilaku kekejaman dan kebengisan yang dirasakan oleh kelompok aktivis mahasiswa di masa Orde Baru',
                    style: GoogleFonts.mooli(
                      fontSize: 14,
                      //fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextCard2() {
    return Container(
      margin: EdgeInsets.all(10),
      height: 200,
      color: Colors.cyanAccent.shade700,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Image.network(
              'https://th.bing.com/th/id/OIP.wfpCMXL9Udn324-zuI5yJQHaK-?w=116&h=180&c=7&r=0&o=5&dpr=1.8&pid=1.7',
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Funiculi Funicula',
                  style: GoogleFonts.openSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 20),
                  child: Text(
                    'Funiculi Funicula adalah sebuah nama kafe tua yang terletak di salah satu gang kecil Tokyo yang menjadi latar utama cerita',
                    style: GoogleFonts.mooli(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextCard3() {
    return Container(
      margin: EdgeInsets.all(10),
      height: 200,
      color: Colors.cyanAccent.shade700,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Image.network(
              'https://th.bing.com/th/id/OIP.Hj2wTo6-JX37yyHV_TuFoAHaLJ?w=117&h=180&c=7&r=0&o=5&dpr=1.8&pid=1.7',
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bicara Itu Ada Seninya',
                  style: GoogleFonts.openSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 20),
                  child: Text(
                    'Menjelaskan terkait rahasia menggunakan teknik komunikasi yang benar dan efektif',
                    style: GoogleFonts.mooli(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextCard4() {
    return Container(
      margin: EdgeInsets.all(10),
      height: 200,
      color: Colors.cyanAccent.shade700,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Image.network(
              'https://th.bing.com/th/id/OIP.Hn0TEwPFdZozpA9klAFKCwHaLH?w=138&h=207&c=7&r=0&o=5&dpr=1.8&pid=1.7',
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jujutsu Kaisen 01',
                  style: GoogleFonts.openSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 20),
                  child: Text(
                    'Jujutsu Kaisen bercerita tentang seorang bocah SMA bernama Yuji yang masuk ke dalam sebuah Klub Penelitian Ilmu Gaib',
                    style: GoogleFonts.mooli(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextCard5() {
    return Container(
      margin: EdgeInsets.all(10),
      height: 200,
      color: Colors.cyanAccent.shade700,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Image.network(
              'https://th.bing.com/th/id/OIP.R6OLyj4V_1fdVy57neA0GQHaLH?w=138&h=207&c=7&r=0&o=5&dpr=1.8&pid=1.7',
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Jujutsu Kaisen 04',
                  style: GoogleFonts.openSans(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 20),
                  child: Text(
                    'Jujutsu Kaisen bercerita tentang seorang bocah SMA bernama Yuji yang masuk ke dalam sebuah Klub Penelitian Ilmu Gaib',
                    style: GoogleFonts.mooli(
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
