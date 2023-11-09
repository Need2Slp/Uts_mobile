import 'package:flutter/material.dart';
import 'package:mobilerega/pages/btnavbar.dart';
import 'package:mobilerega/pages/loginpage.dart';
import 'package:mobilerega/pages/profilepage.dart';

class Navigationdrawerwidget extends StatelessWidget {
  const Navigationdrawerwidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final name = 'regafa';
    final email = 'rega225@gmai.com';
    final urlImage = 'assets/PP.png';

    return Drawer(
      child: Material(
        color: Colors.cyanAccent.shade700,
        child: ListView(
          children: <Widget>[
            buildHeader(
              urlImage: urlImage,
              name: name,
              email: email,
            ),
            buildMenuItem(
              text: 'Profile',
              icon: Icons.person,
              onClicked: () => selectedItem(context, 0),
            ),
            buildMenuItem(
              text: 'Home',
              icon: Icons.home,
              onClicked: () => selectedItem(context, 1),
            ),
            Divider(color: Colors.white70),
            buildMenuItem(
              text: 'Logout',
              icon: Icons.logout,
              onClicked: () => selectedItem(context, 2),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          CircleAvatar(radius: 30, backgroundImage: AssetImage(urlImage)),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              const SizedBox(height: 4),
              Text(
                email,
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ],
          ),
          Spacer(),
          // CircleAvatar(
          //   radius: 24,
          //   backgroundColor: Color.fromRGBO(30, 60, 168, 1),
          //    child: Icon(Icons.add_comment_outlined, color: Colors.white),
          // )
        ],
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(text, style: TextStyle(color: Colors.white)),
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Profilepage(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Btnavbar(),
        ));
        break;
      case 2:
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Logout"),
              content: Text("Apakah Anda yakin ingin logout?"),
              actions: <Widget>[
                TextButton(
                  child: Text("No"),
                  onPressed: () {
                    Navigator.of(context).pop(); // Tutup dialog
                  },
                ),
                TextButton(
                  child: Text("Yes"),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Loginpage(),
                    ));
                  },
                ),
              ],
            );
          },
        );
        break;
      // Add more cases for other menu items as needed.
    }
  }
}
