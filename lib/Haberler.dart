import 'package:flutter/material.dart';

class Haberler extends StatefulWidget {
  @override
  _HaberlerState createState() => _HaberlerState();
}

class _HaberlerState extends State<Haberler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFB80A00),
        title: Text("Haberler"),
      ),
      body: Container(
        child: ListView(children: [
          ListTile(title: Center(child: Text("Dev Derbinin ilk 11 leri açıklandı")),
            trailing: Image.asset(
              "assets/images/icon/galatasaray.jpg",
              height: 30,
              width: 30,
            ),
            leading: Image.asset(
              "assets/images/icon/fenerbahce.jpg",
              height: 30,
              width: 30,
            ),
            contentPadding: EdgeInsets.only(top: 20,left: 20,right: 20),
            onTap: (){},
          ),
          ListTile(title: Center(child: Text("Fenerbahçe-Sivasspor Maçının özeti")),
            subtitle: Center(child: Text("izlemek için Tıklayın")),
            trailing: Image.asset(
              "assets/images/icon/sivas.jpg",
              height: 30,
              width: 30,
            ),
            leading: Image.asset(
              "assets/images/icon/fenerbahce.jpg",
              height: 30,
              width: 30,
            ),
            contentPadding: EdgeInsets.only(top: 20,left: 20,right: 20),
            onTap: (){},
          ),
          ListTile(title: Center(child: Text("Maç sonrası Sergen yalçın açıklaması")),
            subtitle: Center(child: Text("izlemek için Tıklayın")),
            leading: Image.asset(
              "assets/images/icon/besiktas.jpg",
              height: 30,
              width: 30,
            ),
            trailing: Image.asset(
              "assets/images/icon/besiktas.jpg",
              height: 30,
              width: 30,
            ),
            contentPadding: EdgeInsets.only(top: 20,left: 20,right: 20),
            onTap: (){},
          ),          ListTile(title: Center(child: Text("Bir pozitif vaka daha")),
            trailing: Image.asset(
              "assets/images/icon/galatasaray.jpg",
              height: 30,
              width: 30,
            ),
            leading: Image.asset(
              "assets/images/icon/galatasaray.jpg",
              height: 30,
              width: 30,
            ),
            contentPadding: EdgeInsets.only(top: 20,left: 20,right: 20),
            onTap: (){},
          ),          ListTile(title: Center(child: Text("Galatasaray Konya'da Takıldı")),
            trailing: Image.asset(
              "assets/images/icon/galatasaray.jpg",
              height: 30,
              width: 30,
            ),
            leading: Image.asset(
              "assets/images/icon/galatasaray.jpg",
              height: 30,
              width: 30,
            ),
            contentPadding: EdgeInsets.only(top: 20,left: 20,right: 20),
            onTap: (){},
          ),          ListTile(title: Center(child: Text("Aboubakar lige yetişebilecek mi")),
            trailing: Image.asset(
              "assets/images/icon/besiktas.jpg",
              height: 30,
              width: 30,
            ),
            leading: Image.asset(
              "assets/images/icon/besiktas.jpg",
              height: 30,
              width: 30,
            ),
            contentPadding: EdgeInsets.only(top: 20,left: 20,right: 20),
            onTap: (){},
          ),
        ],),


      ),
    );
  }
}
