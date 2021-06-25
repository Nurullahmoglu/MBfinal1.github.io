
import 'package:flutter/material.dart';
import 'dart:convert';

class TakimlarBilgi extends StatefulWidget {
  final index;

  const TakimlarBilgi({Key? key, @required this.index}) : super(key: key);
  @override
  _TakimlarBilgiState createState() => _TakimlarBilgiState();
}

class _TakimlarBilgiState extends State<TakimlarBilgi> {
  @override
  Widget build(BuildContext context) {
    String abc = widget.index;
    //var verioku;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Center(
            child: FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString("assets/Bilgiler.json"),
              builder: (context, bilgiler) {
                var verioku = json.decode(bilgiler.data.toString());
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 40, bottom: 40),
                          child: Image.asset(
                            verioku[vericekme(widget.index.toString())]
                                ["fotograf"],
                            height: 200,
                            width: 300,
                          ),
                        ),
                        Text(
                            verioku[vericekme(widget.index.toString())]
                                ["Açıklama"],
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Column(
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 15)),
                            Text("Takım Başkanı: " +
                                verioku[vericekme(widget.index.toString())]
                                    ["TakımBaskanı"] +
                                "\nTeknik Direktör: " +
                                verioku[vericekme(widget.index.toString())]
                                    ["TeknikDirektör"] +
                                "\nTakım Kaptanı: " +
                                verioku[vericekme(widget.index.toString())]
                                    ["Takım Kaptanı"] +
                                "\nŞampiyonluk Sayısı: " +
                                verioku[vericekme(widget.index.toString())]
                                    ["ŞampiyonlukSayısı"],style: TextStyle(fontFamily: "OpenSans-BoldItalic",fontSize: 20),),
                          ],
                        ),
                      ],
                    );
                  },
                  itemCount: verioku == null ? 0 : 1,
                );
              },
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFFB80A00),
        title: Padding(
          padding: const EdgeInsets.only(left: 70),
          child: Text(appbarbaslik(widget.index.toString()),style: TextStyle(fontFamily: 'BebasNeue',fontSize: 30,),),
        ),
      ),
    );
  }

  vericekme(String takim) {
    if (takim == "fenerbahce") {
      return 0;
    }
    if (takim == "galatasaray") {
      return 1;
    }
    if (takim == "besiktas") {
      return 2;
    }
    if (takim == "trabzon") {
      return 3;
    }
    if (takim == "basaksehir") {
      return 4;
    }
    if (takim == "sivas") {
      return 5;
    }
    if (takim == "konya") {
      return 6;
    }
  }

  appbarbaslik(String takim) {
    if (takim == "fenerbahce") {
      return "FENERBAHÇE";
    }
    if (takim == "galatasaray") {
      return "GALATASARAY";
    }
    if (takim == "besiktas") {
      return "BEŞİKTAŞ";
    }
    if (takim == "trabzon") {
      return "TRABZONSPOR";
    }
    if (takim == "basaksehir") {
      return "BAŞAKŞEHİR";
    }
    if (takim == "sivas") {
      return "SİVASSPOR";
    }
    if (takim == "konya") {
      return "KONYASPOR";
    }
  }
}
