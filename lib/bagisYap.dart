import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class DonationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey[200],
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text('Bağış Yap'),
        ),
        body: DonationForm(),
      ),
    );
  }
}

class DonationForm extends StatefulWidget {
  @override
  _DonationFormState createState() => _DonationFormState();
}

class _DonationFormState extends State<DonationForm> {
  TextEditingController donationAmountController = TextEditingController();
  TextEditingController donorNameController = TextEditingController();
  TextEditingController donorClubNameController = TextEditingController();

  String displayedAmount = ''; // Yeni değişken
  String displayName = ""; // bağışçı ismi
  String displayClubName = ""; // kulüp adı

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: donorNameController,
            decoration: InputDecoration(
              labelText: 'Bağışçı Adı',
              labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              hintText: 'Adınızı giriniz',
            ),
          ),
          SizedBox(height: 16,),
          TextField(
            controller: donationAmountController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Bağış Miktarı',
              labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              hintText: 'Miktarı giriniz',
            ),
          ),
          SizedBox(height: 16),
          TextField(
            controller: donorClubNameController,
            decoration: InputDecoration(
              labelText: 'Bağış Yapmak İstediğiniz Kulüp:',
              labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              hintText: "Kulüp Adını giriniz",
            ),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              String donationAmount = donationAmountController.text;
              String donorName = donorNameController.text;
              String donationClubName = donorClubNameController.text;

              setState(() {
                // Değişiklikleri widget'a yansıtmak için setState kullanılır.
                displayedAmount = 'Bağış Miktarı: $donationAmount';
                displayName = "Bağışçı İsmi: $donorName";
                displayClubName = "Bağış Yapılan Kulüp: $donationClubName";
              });

              print('Bağış Miktarı: $donationAmount');
              print("Bağışçı İsmi: $donorName");
              print("Bağış Yapılan Kulüp: $donationClubName");
            },
            child: Text('Bağış Yap'),
          ),
          SizedBox(height: 16),
          Text(
            displayedAmount, // Ekran üzerinde gösterilen miktar
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            displayName, // Ekran üzerinde gösterilen miktar
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            displayClubName, // Ekran üzerinde gösterilen miktar
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DonationPage(),
    );
  }
}
