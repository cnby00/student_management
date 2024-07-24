import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewStudentsScreen extends StatelessWidget {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kayıtlı Öğrenciler'),
        backgroundColor: Colors.blueAccent, // AppBar rengi
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('students').snapshots(), // 'students' koleksiyonu kullanılıyor
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data;
          if (data == null || data.docs.isEmpty) {
            return Center(child: Text('Kayıtlı öğrenci bulunamadı'));
          }

          final students = data.docs;
          List<Widget> studentWidgets = [];

          for (var student in students) {
            final studentName = student['name'] ?? 'Bilinmiyor';
            final studentId = student['studentId'] ?? 'N/A';

            final studentWidget = Card(
              margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              elevation: 6.0, // Kart gölgesi
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0), // Köşe yuvarlama
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(16.0),
                title: Text(
                  studentName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.black87, // Başlık rengi
                  ),
                ),
                subtitle: Text(
                  'Öğrenci ID: $studentId',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black54, // Alt başlık rengi
                  ),
                ),
                trailing: Icon(Icons.info_outline,
                    color: Colors.blueAccent), // Bilgi simgesi
                onTap: () {
                  // Öğe tıklama işlemleri
                },
              ),
            );

            studentWidgets.add(studentWidget);
          }

          return ListView(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            children: studentWidgets,
          );
        },
      ),
    );
  }
}
