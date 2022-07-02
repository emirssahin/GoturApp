import 'package:gotur_app/views/anasayfa.dart';
import 'package:flutter/material.dart';

class GirisSayfasi extends StatefulWidget {
  GirisSayfasi({Key? key}) : super(key: key);

  @override
  State<GirisSayfasi> createState() => _GirisSayfasiState();
}

class _GirisSayfasiState extends State<GirisSayfasi> {
  var tfKullaniciAdi = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 0, 0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height / 2,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/logo3.PNG"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: "Baslik",
                ),
                controller: tfKullaniciAdi,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 5.0, color: Color.fromARGB(255, 255, 202, 0)),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 5.0, color: Color.fromARGB(255, 255, 202, 0)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 5.0, color: Color.fromARGB(255, 255, 202, 0)),
                  ),
                  hintText: "Kullanıcı Adı",
                ),
              ),
            ),
            SizedBox(height: 75),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 255, 202, 0))),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Anasayfa(tfKullaniciAdi.text),
                  ),
                );
              },
              child: Text(
                "Giris",
                style: TextStyle(
                  color: Colors.black,
                  //fontWeight: FontWeight.bold,
                  fontSize: 25,
                  fontFamily: "Baslik",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
