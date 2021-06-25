import 'package:flutter/material.dart';
import 'package:odev/updatepass.dart';
class Ayarlar extends StatefulWidget {
  @override
  _AyarlarState createState() => _AyarlarState();
}

class _AyarlarState extends State<Ayarlar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFB80A00),
        title: Text("Ayarlar"),
      ),
      body: Container(
        child: ListView(children: [
          ListTile(title: Text("Hesap Bilgileri"),
            onTap: (){},
          ),
          ListTile(title: Text("Şifreni Değiştir"),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => uptadepass()),
              );

            },
          ),
          ListTile(title:Text("Gizli ve Güvenlik politikamız"),
            onTap: (){},
          ),
        ],),
      ),
    );
  }
}