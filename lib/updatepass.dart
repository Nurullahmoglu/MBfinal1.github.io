import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
FirebaseAuth auth = FirebaseAuth.instance;
class uptadepass extends StatefulWidget {
  @override
  _uptadepassState createState() => _uptadepassState();
}

class _uptadepassState extends State<uptadepass> {
  final _formKey = GlobalKey<FormState>();
  String _pass="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color(0xFFB80A00),),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(top: 100,right: 20,left: 20),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  labelText: "mail adresinizi giriniz",
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
                  _pass = value!;
                },
              ),
              _updateButon()
            ],
          ),
        ),

      ),
    );
  }

  Widget _updateButon() => Padding(
    padding: const EdgeInsets.only(top: 30),
    child: SizedBox(
      height: 40,
      width: 170,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
            MaterialStateProperty.all<Color>(Color(0xFFB80A00))),
        child: Text("YENİLE"),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            _updatepass(_pass);
          }
        },
      ),
    ),
  );

  Future<void> _updatepass(String _pass) async {
    try{
      debugPrint(_pass);
      await auth.currentUser.updatePassword(_pass);
      debugPrint("şifreniz güncellendi");
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Hata"),
            content: Text("Şifreniz başarı ile güncellendi"),
            actions: <Widget>[
              MaterialButton(
                  child: Text("Geri Dön"),
                  onPressed: () => Navigator.pop(context))
            ],
          );
        },
      );
    }    on FirebaseAuthException catch (e) {
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
      }
    }
    catch(e){
      debugPrint(e.toString());
    }

    }

}
