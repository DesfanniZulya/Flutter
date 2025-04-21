import 'package:flutter/material.dart';

class LoginToast extends StatefulWidget {
  const LoginToast({super.key});

  @override
  State<LoginToast> createState() => _PageSimpleLoginState();
}

class _PageSimpleLoginState extends State<LoginToast> {
  // Controller
  final TextEditingController etUsername = TextEditingController();
  final TextEditingController etPassword = TextEditingController();

  // Variabel untuk menampung data
  String nUsername = "";
  String nPassword = "";

  void login() {
    setState(() {
      nUsername = etUsername.text;
      nPassword = etPassword.text;
    });

    // Menampilkan data di console
    print("Username: $nUsername | Password: $nPassword");

    // Menampilkan pesan dengan SnackBar di atas form login
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Username: $nUsername\nPassword: $nPassword"),
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating, // Biar bisa diatur posisinya
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.1, // 10% dari tinggi layar
          left: 20,
          right: 20,
        ),
      ),
    );

    // Pindah ke halaman selanjutnya dengan passing data
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PageHome(username: nUsername, password: nPassword),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text('Form Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Supaya teks login di kiri
          children: [
            const SizedBox(height: 20), // Jarak supaya SnackBar tidak terlalu nempel
            Text(
              'Form Login User',
              style: TextStyle(
                fontSize: 18,
                color: Colors.red[800],
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: etUsername,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 15),
            TextFormField(
              controller: etPassword,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: login,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Halaman tujuan setelah login
class PageHome extends StatelessWidget {
  final String username;
  final String password;

  const PageHome({super.key, required this.username, required this.password});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text('Home Page'),
      ),
      body: Center(
        child: Text(
          "Welcome, $username!\nYour password is: $password",
          style: const TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}