import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

void main() {
  runApp(LessonPage());
}

class LessonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LessonListPage(),
    );
  }
}

class LessonListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Derslerim'),
      ),
      body: LessonList(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueGrey,
        onPressed: () async {
          FilePicker.platform.pickFiles();
          if (FilePicker != null) {
            // Dosyayı işlemek için kodu yazın
          }
        },
        child: Icon(Icons.add),
      // Yeni ders ekleme ekranına gitme kodu
      ),
    );
  }
}

class LessonList extends StatelessWidget {
  final List<Lesson> lessons = [
    Lesson('Algoritma ve Programlama', 'Güncel Sarıman', 6),
    Lesson('Lineer Cebir', 'Mehmet Hoca', 3),
    Lesson('Yapay Zeka', 'Ayşe Hoca', 5),
    Lesson('Mühendislik Projesi', 'Mehmet Hoca', 3),
    Lesson('Makine Öğrenmesi', 'Ayşe Hoca', 5),
    // ... diğer dersler
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: lessons.length,
      itemBuilder: (context, index) {
        return LessonCard(lesson: lessons[index]);
      },
    );
  }
}

class LessonCard extends StatelessWidget {
  final Lesson lesson;

  LessonCard({required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ders Adı: ${lesson.name}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Ders Hoca Adı: ${lesson.teacherName}'),
            SizedBox(height: 8),
            Text('Ders Kredisi: ${lesson.credit}'),
          ],
        ),
      ),
    );
  }
}

class Lesson {
  final String name;
  final String teacherName;
  final int credit;

  Lesson(this.name, this.teacherName, this.credit);
}
