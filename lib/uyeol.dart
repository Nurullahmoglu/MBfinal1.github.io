import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:odev/login.dart';

FirebaseAuth auth = FirebaseAuth.instance;

class uyeol extends StatefulWidget {
  @override
  _uyeolState createState() => _uyeolState();
}

class _uyeolState extends State<uyeol> {
  String _email="";
  String _pass="";
  String _isim="";
  String _telefon="";
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFFB80A00),),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(right: 30,left: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: TextFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  labelText: "Email adresini giriniz",
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "e-mail boş geçilemez";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    _email = value!;
                  },
                ),
              ),
              TextFormField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                labelText: "şifrenizi giriniz",
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(),
              ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "şifre boş geçilemez";
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  _pass = value!;
                },
              ),
              _creatButon()
],
),

        ),
),

);
}
  Widget _creatButon() => Padding(
    padding: const EdgeInsets.only(top: 10),
    child: SizedBox(
      height: 40,
      width: 250,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
            MaterialStateProperty.all<Color>(Color(0xFFB80A00))),
        child: Text("Oluştur"),
          onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            _kullaniciolustur(_email,_pass);
          }
        },
      ),
    ),
  );

  void _kullaniciolustur(String email,String pass) async{
    try{

      UserCredential _credential = await auth.createUserWithEmailAndPassword(email: email, password: pass);
      User yeniuser = _credential.user;
      await yeniuser.sendEmailVerification();
      if(auth.currentUser != null){
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Text("Size bir Mail adresi gönderdik lütfen onaylayladıktan sonra giriş yapabilirsiniz"),
              actions: <Widget>[
                MaterialButton(
                    child: Text("Giriş sayfasına dön"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    }
                )
              ],
            );
          },
        );
        await auth.signOut();
        debugPrint("kullanıcıyı sistemden attık");
      }
      debugPrint(yeniuser.toString());
    }
    on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Hata"),
              content: Text("parola zayıf"),
              actions: <Widget>[
                MaterialButton(
                    child: Text("Geri Dön"),
                    onPressed: () => Navigator.pop(context))
              ],
            );
          },
        );
      } else if (e.code == 'email-already-in-use') {
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Hata"),
              content: Text("bu e-mail zaten kullanılıyor"),
              actions: <Widget>[
                MaterialButton(
                    child: Text("Geri Dön"),
                    onPressed: () => Navigator.pop(context))
              ],
            );
          },
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
