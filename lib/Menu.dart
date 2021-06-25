import 'package:flutter/material.dart';
import 'package:odev/TakimlarBilgi.dart';
import 'package:odev/hakkimizda.dart';
import 'package:odev/Ayarlar.dart';
import 'package:odev/Haberler.dart';
import 'package:firebase_auth/firebase_auth.dart';
FirebaseAuth auth = FirebaseAuth.instance;

class Menu extends StatelessWidget {
  String index = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 25.5),
      child: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Image.asset("assets/images/SL.jpg"),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ExpansionTile(
                    title: Text("Takımlar"),
                    leading: Image.asset(
                      "assets/images/icon/Icon1.png",
                      height: 30,
                      width: 30,
                    ),
                    children: <Widget>[
                      Divider(
                        height: 5,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: ListTile(
                          title: Text("Fenerbahçe"),
                          leading: Image.asset(
                            "assets/images/icon/fenerbahce.jpg",
                            height: 30,
                            width: 30,
                          ),
                          onTap: () {
                            index = "fenerbahce";
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TakimlarBilgi(
                                        index: index,
                                      )),
                            );
                          },
                        ),
                      ),
                      Divider(
                        height: 1,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: ListTile(
                          title: Text("Galatasaray"),
                          leading: Image.asset(
                            "assets/images/icon/galatasaray.jpg",
                            height: 30,
                            width: 30,
                          ),
                          onTap: () {
                            index = "galatasaray";
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TakimlarBilgi(
                                        index: index,
                                      )),
                            );
                          },
                        ),
                      ),
                      Divider(
                        height: 1,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: ListTile(
                          title: Text("Beşiktaş"),
                          leading: Image.asset(
                            "assets/images/icon/besiktas.jpg",
                            height: 30,
                            width: 30,
                          ),
                          onTap: () {
                            index = "besiktas";
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TakimlarBilgi(
                                        index: index,
                                      )),
                            );
                          },
                        ),
                      ),
                      Divider(
                        height: 1,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: ListTile(
                          title: Text("TrabzonSpor"),
                          leading: Image.asset(
                            "assets/images/icon/trabzon.jpg",
                            height: 30,
                            width: 30,
                          ),
                          onTap: () {
                            index = "trabzon";
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TakimlarBilgi(
                                        index: index,
                                      )),
                            );
                          },
                        ),
                      ),
                      Divider(
                        height: 1,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: ListTile(
                          title: Text("Basaksehir"),
                          leading: Image.asset(
                            "assets/images/icon/basaksehir.jpg",
                            height: 30,
                            width: 30,
                          ),
                          onTap: () {
                            index = "basaksehir";
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TakimlarBilgi(
                                        index: index,
                                      )),
                            );
                          },
                        ),
                      ),
                      Divider(
                        height: 1,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: ListTile(
                          title: Text("Sivasspor"),
                          leading: Image.asset(
                            "assets/images/icon/sivas.jpg",
                            height: 30,
                            width: 30,
                          ),
                          onTap: () {
                            index = "sivas";
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TakimlarBilgi(
                                        index: index,
                                      )),
                            );
                          },
                        ),
                      ),
                      Divider(
                        height: 1,
                        color: Colors.black,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: ListTile(
                          title: Text("KonyaSpor"),
                          leading: Image.asset(
                            "assets/images/icon/konya.jpg",
                            height: 30,
                            width: 30,
                          ),
                          onTap: () {
                            index = "konya";
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TakimlarBilgi(
                                        index: index,
                                      )),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  ListTile(
                    title: Text("Haberler"),
                    leading: Icon(Icons.chrome_reader_mode_sharp),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Haberler()),
                      );
                    },
                  ),
                  Divider(
                    height: 1,
                    color: Colors.black,
                  ),
                  ListTile(
                    title: Text("Ayarlar"),
                    leading: Icon(Icons.build_sharp),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>Ayarlar() ),
                      );
                    },
                  ),
                  Divider(
                    height: 1,
                    color: Colors.black,
                  ),
                  ListTile(
                    title: Text("Hakkımızda"),
                    leading: Icon(Icons.account_circle_sharp),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => hakkimizda()),
                      );
                    },
                  ),
                  Divider(
                    height: 1,
                    color: Colors.black,
                  ),
                  ListTile(
                    title: Text("Çıkış Yap"),
                    leading: Icon(Icons.login_outlined),
                    onTap: () async {
                      await auth.signOut();
                      Navigator.pushReplacementNamed(context, '/');
                    },
                  ),
                  Divider(
                    height: 1,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
