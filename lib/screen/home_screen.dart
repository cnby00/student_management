import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'student_registration_screen.dart';
import 'view_students_screen.dart';
import 'login_screen.dart'; // Giriş ekranını içe aktardığınızdan emin olun

class HomeScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Öğrenci Yönetimi'),
        backgroundColor: Colors.blueAccent,
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Hoşgeldiniz!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Öğrenci Yönetim Uygulaması',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person_add, color: Colors.blueAccent),
              title: Text('Öğrenci Kaydı'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => StudentRegistrationScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.list, color: Colors.blueAccent),
              title: Text('Kayıtlı Öğrenciler'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewStudentsScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.info, color: Colors.blueAccent),
              title: Text('Hakkında'),
              onTap: () {
                // Add your about screen navigation here
              },
            ),
            ListTile(
              leading: Icon(Icons.support, color: Colors.blueAccent),
              title: Text('Destek'),
              onTap: () {
                // Add your support screen navigation here
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.blueAccent),
              title: Text('Çıkış Yap'),
              onTap: () async {
                await _auth.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => StudentRegistrationScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50),
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text('Öğrenci Kaydı'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewStudentsScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 50),
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text('Kayıtlı Öğrenciler'),
            ),
          ],
        ),
      ),
    );
  }
}
