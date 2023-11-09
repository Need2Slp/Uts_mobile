import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobilerega/pages/loginpage.dart';

void main() {
  runApp(Registerpage());
}

class Registerpage extends StatefulWidget {
  const Registerpage({Key? key}) : super(key: key);

  @override
  State<Registerpage> createState() => _RegisterpageState();
}

class _RegisterpageState extends State<Registerpage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sign Up\nTo Make Account',
                style: GoogleFonts.openSans(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: 30),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.person),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white), // Warna garis saat normal
                    borderRadius:
                        BorderRadius.circular(10), // Ubah sesuai preferensi
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white), // Warna garis saat fokus
                    borderRadius:
                        BorderRadius.circular(10), // Ubah sesuai preferensi
                  ),
                ),
                style: TextStyle(
                  color: Colors.white, // Warna teks
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white), // Warna garis saat normal
                    borderRadius:
                        BorderRadius.circular(10), // Ubah sesuai preferensi
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.white), // Warna garis saat fokus
                    borderRadius:
                        BorderRadius.circular(10), // Ubah sesuai preferensi
                  ),
                ),
                obscureText: true, // Kata sandi tersembunyi
                style: TextStyle(
                  color: Colors.white, // Warna teks
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  final String username = usernameController.text;
                  final String password = passwordController.text;

                  if (username.isNotEmpty && password.isNotEmpty) {
                    registeredUsers[username] = password;

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Loginpage()),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please fill in all fields!'),
                      ),
                    );
                  }
                },
                child: Text('Sign Up'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // Sesuaikan dengan tema login
                  minimumSize: Size(200, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Map<String, String> registeredUsers = {
  'user1': 'password1',
  'user2': 'password2',
};
