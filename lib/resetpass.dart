import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;
class resetpass extends StatefulWidget {
  @override
  _resetpassState createState() => _resetpassState();
}

class _resetpassState extends State<resetpass> {
  final _formKey = GlobalKey<FormState>();
  String _email="";
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
                  _email = value!;
                },
              ),
              _resetButon()
            ],
          ),
        ),
      ),
    );
  }

  Widget _resetButon() =>Padding(
  padding: const EdgeInsets.only(top: 40),
    child: SizedBox(
      height: 40,
      width: 120,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor:
            MaterialStateProperty.all<Color>(Color(0xFFB80A00))),
        child: Text("YENİLE"),
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              try {
                await auth.sendPasswordResetEmail(email: _email);
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Hata"),
                      content: Text("Resetleme maili gönderildi"),
                      actions: <Widget>[
                        MaterialButton(
                            child: Text("Geri Dön"),
                            onPressed: () => Navigator.pop(context))
                      ],
                    );
                  },
                );
                debugPrint("resetleme maili gönderildi3");
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
                }
              }
            }
          },
      ),
    ),
  );

}



















