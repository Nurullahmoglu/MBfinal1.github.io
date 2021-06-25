import 'package:flutter/material.dart';

class hakkimizda extends StatefulWidget {
  @override
  _hakkimizdaState createState() => _hakkimizdaState();
}

class _hakkimizdaState extends State<hakkimizda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFB80A00),
        title: Text("HAKKIMIZDA"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 200, right: 17, left: 17),
        child: Text(
            "     Bu uygulama Dr. Öğretim Üyesi Ahmet Cevahir ÇINAR tarafından yürütülen 3301456 kodlu MOBİL PROGRAMLAMA dersi kapsamında 183301063 numaralı Nurullah Muratoğlu tarafından 30 Nisan 2021 günü yapılmıştır.",
            style: TextStyle(fontFamily: 'BebasNeue',fontSize: 30,)),
      ),
    );
  }
}
