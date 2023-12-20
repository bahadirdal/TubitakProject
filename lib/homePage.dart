import 'package:flutter/material.dart';
import 'package:tubitakproject/dersUpload.dart';
import 'main.dart';
import 'bagisYap.dart';
import 'kuponPage.dart';
import 'derslerPage.dart';
import 'profileStudent.dart';
import 'package:file_picker/file_picker.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int joinCount = 0;
  int joinCount1 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[200],
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text('Anasayfa'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 25,
                ),
                Image.network(
                  'https://muweb.mu.edu.tr/Newfiles/185/185/index.jpg',
                  width: 300,
                  height: 300,
                ),
                const SizedBox(height: 20),
                OptionButton('Katılacağım', () {
                  setState(() {
                    joinCount++;
                  });
                  // 'Katılacağım' butonuna tıklandığında yapılacak işlemler
                }),
                OptionButton('Katılamayacağım', () {
                  // 'Katılamayacağım' butonuna tıklandığında yapılacak işlemler
                }),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Katılan sayısı: $joinCount',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                    "--------------------------------------------------------------------------------------"),
                SizedBox(
                  height: 50,
                ),
                Image.network(
                  'https://muweb.mu.edu.tr/Newfiles/96/96/bmomobil.jpg',
                  width: 300,
                  height: 300,
                ),
                SizedBox(height: 20),
                OptionButton('Katılacağım', () {
                  setState(() {
                    joinCount1++;
                  });
                  // 'Katılacağım' butonuna tıklandığında yapılacak işlemler
                }),
                OptionButton('Katılamayacağım', () {
                  // 'Katılamayacağım' butonuna tıklandığında yapılacak işlemler
                }),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Katılan Sayısı: $joinCount1',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
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

        bottomNavigationBar: BottomAppBar(
          color: Colors.blueGrey,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: OptionButton('Dersler', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LessonPage()),
                  );
                }),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: OptionButton('Bağış Yap', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DonationPage()),
                  );
                }),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: OptionButton('Kuponlarım', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CouponPage()),
                  );
                }),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: OptionButton('Profil', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => profileStudent()),
                  );
                }),
              ),
            ],
          ),
        ));
  }
}

class OptionButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  OptionButton(this.title, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(title),
      style: ElevatedButton.styleFrom(
        primary: Colors.blueGrey[800],
        onPrimary: Colors.white,
      ),
    );
  }
}
