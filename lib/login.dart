import 'package:flutter/material.dart';
import 'package:odev/resetpass.dart';
import 'package:odev/uyeol.dart';
import 'package:odev/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';


FirebaseAuth auth = FirebaseAuth.instance;
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String Kadi = "";
  String Sifre = "";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset:
          false,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, //formu ortaya getirdi
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Image.asset("assets/images/SL.png"),
              ),
              TextFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  labelText: "Kullanıcı Adı",
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Kullanıcı adını giriniz";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  Kadi = value!;
                },
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  labelText: "Parola",
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Şifrenizi giriniz";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  Sifre = value!;
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MaterialButton(
                    color: Color(0xFFB80A00),
                    child: Text(
                      "Üye ol",
                      style: TextStyle(color: Colors.white),
                    ),


                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => uyeol()),
                        );
                      }
                  ),
                  MaterialButton(
                    color: Color(0xFFB80A00),
                    child: Text(
                      "Şifremi Unuttum",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => resetpass()),
                      );

                    },
                  )
                ],
              ),
              _loginButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginButton() => Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SizedBox(
          height: 40,
          width: 250,
          child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xFFB80A00))),
            child: Text("giriş yap"),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                try{
                User _oturumacanuser = (await auth.signInWithEmailAndPassword(email: Kadi , password: Sifre)).user;

                if(_oturumacanuser.emailVerified){
                  debugPrint("mail onaylı ana sayfaya gidebiliir");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(
                        gonderilecekdeger: Kadi,
                      ),
                    ),
                  );
                }
                 else {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Hata"),
                        content: Text("Lütfen Mailinizi onaylayıp tekrar giriş yapın"),
                        actions: <Widget>[
                          MaterialButton(
                              child: Text("Geri Dön"),
                              onPressed: () => Navigator.pop(context))
                        ],
                      );
                    },
                  );
                  debugPrint("lütfen mailinizi onaylayıp tekrar giriş yapın");
                  auth.signOut();
                }
                }
                on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Hata"),
                          content: Text("Bu mail adresi ile üyelik bulunamadı"),
                          actions: <Widget>[
                            MaterialButton(
                                child: Text("Geri Dön"),
                                onPressed: () => Navigator.pop(context))
                          ],
                        );
                      },
                    );
                  } else if (e.code == 'wrong-password') {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Hata"),
                          content: Text("Yanlış parola"),
                          actions: <Widget>[
                            MaterialButton(
                                child: Text("Geri Dön"),
                                onPressed: () => Navigator.pop(context))
                          ],
                        );
                      },
                    );
                  }
                }
                /*if (Kadi == "admin" && Sifre == "pass") {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(
                        gonderilecekdeger: Kadi,
                      ),
                    ),
                  );
                } */
                /*else {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("hata"),
                        content: Text("Giriş bilgileriniz hatalı"),
                        actions: <Widget>[
                          MaterialButton(
                              child: Text("Geri Dön"),
                              onPressed: () => Navigator.pop(context))
                        ],
                      );
                    },
                  );
                }*/
              }
            },
          ),
        ),
      );
}
//obscureText:true şifrenin görünmemesini sağlar
