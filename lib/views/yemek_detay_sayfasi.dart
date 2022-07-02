import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gotur_app/cubit/yemek_detay_sayfasi_cubit.dart';
import 'package:gotur_app/entity/yemekler.dart';
import 'package:flutter/material.dart';

class YemekDetaySayfasi extends StatefulWidget {
  String kullaniciAdi;
  Yemekler yemek;
  YemekDetaySayfasi({required this.yemek, required this.kullaniciAdi});

  @override
  _YemekDetaySayfasiState createState() => _YemekDetaySayfasiState();
}

class _YemekDetaySayfasiState extends State<YemekDetaySayfasi> {
  var adet = "1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 0, 0),
        title: Text(
          "Ürün Detayları",
          style: TextStyle(
              fontSize: 32, fontFamily: "Baslik", fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Image.network(
                "http://kasimadalan.pe.hu/yemekler/resimler/${widget.yemek.yemek_resim_adi}"),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Text(
                "${widget.yemek.yemek_adi}",
                style: TextStyle(
                    fontSize: 40,
                    fontFamily: "Baslik",
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 120,
                    height: 50,
                    color: Colors.indigo.shade100,
                    child: Center(
                      child: Text(
                        "${int.parse(widget.yemek.yemek_fiyat) * int.parse(adet)}₺",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 255, 0, 0),
                        ),
                      ),
                      onPressed: () {
                        setState(
                          () {
                            if (int.parse(adet) == 1) {
                              adet = "1";
                            } else {
                              var yeniAdet = int.parse(adet) - 1;
                              adet = yeniAdet.toString();
                            }
                          },
                        );
                      },
                      child: Text(
                        "-",
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: Container(
                      color: Colors.blue.shade800,
                      child: Center(
                        child: Text(
                          adet,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(
                          () {
                            var yeniAdet = int.parse(adet) + 1;
                            adet = yeniAdet.toString();
                          },
                        );
                      },
                      child: Text(
                        "+",
                        style: TextStyle(fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.green.shade800),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 120.0),
              child: ElevatedButton(
                onPressed: () {
                  context.read<YemekDetaySayfasiCubit>().sepeteEkle(
                      widget.yemek.yemek_adi,
                      widget.yemek.yemek_resim_adi,
                      widget.yemek.yemek_fiyat,
                      adet,
                      widget.kullaniciAdi);
                  showDialog(
                    context: context,
                    builder: (context) {
                      Future.delayed(Duration(seconds: 1), () {
                        Navigator.of(context).pop(true);
                      });
                      return AlertDialog(
                        title: Text("${widget.yemek.yemek_adi} Sepete Eklendi"),
                      );
                    },
                  );
                  Future.delayed(Duration(seconds: 2), () {
                    Navigator.pop(context);
                  });
                },
                child: Text(
                  "Sepete Ekle",
                  style: TextStyle(
                      fontSize: 25,
                      fontFamily: "Baslik",
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 255, 0, 0),
                  fixedSize: Size(150, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
