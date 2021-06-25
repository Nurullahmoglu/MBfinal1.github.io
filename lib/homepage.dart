import 'package:flutter/material.dart';
import 'Menu.dart';

class HomePage extends StatefulWidget {
  final gonderilecekdeger;
  const HomePage({Key? key,this.gonderilecekdeger}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFB80A00),
        title:
          Padding(
            padding: const EdgeInsets.only(left: 45),
            child: Text("Süper Lig",style: TextStyle(fontFamily: 'BebasNeue',fontSize: 30,),),
          ),

      ),
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Image.asset("assets/images/homepage.jpg"),
            ),
          ),
          Text(
            "Merhaba, " +
                widget.gonderilecekdeger +
                ", kullanıcıyla adıyla başarılı bir giriş yaptınız.",
            style: TextStyle(color: Color(0xFF31000000)),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 10, top: 40),
            child: Text(
                "Türkiye süper liginden futbol takımlarının hakkında bilgilere haberlere ve puan durumuna ulaşbileceğiniz bir mobil uygulamadır.",
                style: TextStyle(
                  fontFamily: "OpenSans",
                    fontSize: 20,
                    color: Color(0xFFFF500902),
                    )),
          )
        ],
      ),

      drawer: Menu(),
    );
  }
}
