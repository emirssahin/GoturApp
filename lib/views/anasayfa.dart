import 'package:gotur_app/cubit/anasayfa_cubit.dart';
import 'package:gotur_app/entity/yemekler.dart';
import 'package:gotur_app/views/giris_sayfasi.dart';
import 'package:gotur_app/views/sepet_sayfasi.dart';
import 'package:gotur_app/views/yemek_detay_sayfasi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Anasayfa extends StatefulWidget {
  String kullaniciAdi;

  Anasayfa(this.kullaniciAdi);

  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().tumYemekleriGetir();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 255, 0, 0),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => GirisSayfasi()));
          },
          icon: Icon(
            Icons.login,
            size: 30,
          ),
        ),
        title: Text(
          "götür",
          style: TextStyle(
              fontFamily: "Baslik", fontSize: 35, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SepetSayfasi(widget.kullaniciAdi),
                ),
              );
            },
            icon: Icon(
              Icons.shopping_basket,
              size: 30,
            ),
          ),
        ],
      ),
      body: BlocBuilder<AnasayfaCubit, List<Yemekler>>(
        builder: (context, yemeklerListesi) {
          if (yemeklerListesi.isNotEmpty) {
            return ListView.builder(
              itemCount: yemeklerListesi.length,
              itemBuilder: (context, indeks) {
                var yemek = yemeklerListesi[indeks];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => YemekDetaySayfasi(
                          yemek: yemek,
                          kullaniciAdi: widget.kullaniciAdi,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    child: SizedBox(
                      height: 90,
                      child: Row(
                        children: [
                          Image.network(
                              "http://kasimadalan.pe.hu/yemekler/resimler/${yemek.yemek_resim_adi}"),
                          Padding(
                            padding: const EdgeInsets.only(left: 38.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "${yemek.yemek_adi}",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Baslik"),
                                ),
                                Text(
                                  "${yemek.yemek_fiyat}₺",
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Container(
                child: Text(
                  "Veriler alınamadı",
                  style: TextStyle(
                      fontFamily: "Baslik",
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
