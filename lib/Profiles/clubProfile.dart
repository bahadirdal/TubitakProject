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
  String kulupAd = 'BTT Kulübü';
  String yonetici = "Bahadır Dal";

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
                            labelText: 'Kulüp Adı',
                          ),
                          controller: TextEditingController(text: kulupAd),
                          onChanged: (value) {
                            kulupAd = value;
                          },
                        ),
                        TextField(
                          decoration: InputDecoration(
                            labelText: 'Yönetici: ',
                          ),
                          controller: TextEditingController(text: yonetici),
                          onChanged: (value) {
                            yonetici = value;
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
                            kulupAd = kulupAd;
                            yonetici = yonetici;
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
            title: Text('Kulüp Adı'),
            subtitle: Text(kulupAd),
          ),
          ListTile(
            title: Text('Yönetici'),
            subtitle: Text(yonetici),
          ),
        ],
      ),
    );
  }
}