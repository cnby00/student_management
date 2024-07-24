import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:student_management/firebase_options.dart';
import 'package:student_management/screen/login_screen.dart';
import 'package:student_management/screen/home_screen.dart';
import 'package:student_management/screen/student_registration_screen.dart';
import 'package:student_management/screen/view_students_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Öğrenci Yönetimi',
      theme: ThemeData(
        primarySwatch: Colors.orange, // Tema rengi ayarlandı
      ),
      initialRoute: '/login', // Uygulama başladığında yönlendirme
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
        '/register_student': (context) => StudentRegistrationScreen(),
        '/view_students': (context) => ViewStudentsScreen(),
      },
    );
  }
}
