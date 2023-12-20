import 'package:flutter/material.dart';

void main() {
  runApp(profileStudent());
}

class profileStudent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profil',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String isim = 'Murat Yılmaz';
  String soyisim = 'Yılmaz';
  String bolum = 'Bilgisayar Mühendisliği';
  String fakulte = "Teknoloji Fakültesi";
  String ders = "Algoritma Programlama";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Profil'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Düzenle'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'İsim',
                          ),
                          controller: TextEditingController(text: isim),
                          onChanged: (value) {
                            isim = value;
                          },
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Soyisim',
                          ),
                          controller: TextEditingController(text: soyisim),
                          onChanged: (value) {
                            soyisim = value;
                          },
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Fakülte',
                          ),
                          controller: TextEditingController(text: soyisim),
                          onChanged: (value) {
                            fakulte = value;
                          },
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Bölüm',
                          ),
                          controller: TextEditingController(text: bolum),
                          onChanged: (value) {
                            bolum = value;
                          },
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Ders',
                          ),
                          controller: TextEditingController(text: ders),
                          onChanged: (value) {
                            ders = value;
                          },
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                        child: Text('İptal'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text('Kaydet'),
                        onPressed: () {
                          setState(() {
                            isim = isim;
                            soyisim = soyisim;
                            fakulte = fakulte;
                            bolum = bolum;
                            ders = ders;
                          });
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('İsim'),
            subtitle: Text(isim),
          ),
          ListTile(
            title: Text('Soyisim'),
            subtitle: Text(soyisim),
          ),
          ListTile(
            title: Text('Fakülte'),
            subtitle: Text(fakulte),
          ),
          ListTile(
            title: Text('Bölüm'),
            subtitle: Text(bolum),
          ),
          ListTile(
            title: Text('Ders'),
            subtitle: Text(ders),
          ),
        ],
      ),
    );
  }
}