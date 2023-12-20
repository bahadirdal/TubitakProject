import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(CouponPage());
}

class CouponPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kuponlarım',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> kuponKoduListesi = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 6; i++) {
      kuponKoduListesi.add(randomKuponKoduOlustur());
    }
  }

  String randomKuponKoduOlustur() {
    String kuponKodu = "";
    for (int i = 0; i < 10; i++) {
      kuponKodu += ('ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789').split("")[Random().nextInt(36)];
    }
    return kuponKodu;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Kuponlarım'),
      ),
      body: ListView(
        children: [
          for (String kuponKodu in kuponKoduListesi)
            ListTile(
              title: Text(kuponKodu),
            ),
        ],
      ),
    );
  }
}