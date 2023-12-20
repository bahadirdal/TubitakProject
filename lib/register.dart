import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final authService = AuthService();
  final _tName = TextEditingController();
  final _tEmail = TextEditingController();
  final _tPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          'Kayıt Sayfası',
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/register1.jpg"),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(12.0),
                child: TextField(
                  controller: _tName, // Use the _tName controller here
                  decoration: InputDecoration(
                    labelText: 'Kullanıcı Adı',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: TextField(
                  controller: _tEmail, // Use the _tEmail controller here
                  decoration: InputDecoration(
                    labelText: 'E-Posta Adresi',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: TextField(
                  controller: _tPassword, // Use the _tPassword controller here
                  decoration: InputDecoration(
                    labelText: 'Şifre',
                  ),
                  obscureText: true,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  authService.signUp(name: _tName.text, email: _tEmail.text, password: _tPassword.text);
                },
                child: const Text('Kayıt Ol'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
