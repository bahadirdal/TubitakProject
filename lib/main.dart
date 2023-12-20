import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'Register.dart';
import 'forgotPassword.dart';
import 'package:firebase_core/firebase_core.dart';
import 'homePage.dart';
import 'services/auth_service.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // uygulamanın başlamasını bekle
  await Firebase.initializeApp(); // sonra firebase başlat diyor.
  runApp(LoginPage());
}


class LoginPage extends StatelessWidget {

  final authService = AuthService();
  final _tEmail = TextEditingController();
  final _tPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) {
          // Navigator'u oluşturuyoruz.
          Navigator.of(context);

          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.blueGrey,
              title: Center(
                child: const Text(
                  'Ders Paylaşım ve Sosyal Etkinlik Platformu',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/login1.jpg"),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                     Padding(
                      padding: EdgeInsets.all(12.0),
                      child: TextField(
                        controller: _tEmail,
                        decoration: InputDecoration(
                          labelText: 'Email',
                        ),
                      ),
                    ),
                     Padding(
                      padding: EdgeInsets.all(12.0),
                      child: TextField(
                        controller: _tPassword,
                        decoration: InputDecoration(
                          labelText: 'Şifre',
                        ),
                        obscureText: true,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Giriş Yap butonuna basıldığında HomePage sayfasına yönlendirme yapılıyor.
                        authService.signIn(context, email: _tEmail.text, password: _tPassword.text);
                      },
                      child: Text("Giriş Yap", style: TextStyle(color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Navigator.push() ile RegisterPage() sayfasına yönlendirme yapıyoruz.
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterPage(),
                          ),
                        );
                      },
                      child: const Text('Kayıt Ol', style: TextStyle(color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Şifreyi mi unuttun?',
                        style: TextStyle(color: Colors.white),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' Şifremi Unuttum',
                            style: TextStyle(
                              color: Colors.blueGrey,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ForgotPasswordPage(),
                                  ),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
