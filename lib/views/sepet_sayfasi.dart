import 'package:gotur_app/cubit/sepet_sayfasi_cubit.dart';
import 'package:gotur_app/entity/sepet_yemekler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SepetSayfasi extends StatefulWidget {
  String kullaniciAdi;

  SepetSayfasi(this.kullaniciAdi);

  @override
  _SepetSayfasiState createState() => _SepetSayfasiState();
}

class _SepetSayfasiState extends State<SepetSayfasi> {
  @override
  void initState() {
    super.initState();
    context
        .read<SepetSayfasiCubit>()
        .sepettekiYemekleriYukle(widget.kullaniciAdi);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 0, 0),
        title: Text(
          "Sepet",
          style: TextStyle(
              fontSize: 32, fontFamily: "Baslik", fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocBuilder<SepetSayfasiCubit, List>(
        builder: (context, sepettekiYemeklerListesi) {
          if (sepettekiYemeklerListesi.isNotEmpty) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: sepettekiYemeklerListesi.length,
                    itemBuilder: (context, indeks) {
                      var sepettekiYemek = sepettekiYemeklerListesi[indeks];
                      return Card(
                        child: SizedBox(
                          height: 80,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Text(
                                  "${sepettekiYemek.yemek_siparis_adet}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Baslik",
                                      fontSize: 22),
                                ),
                              ),
                              Image.network(
                                  "http://kasimadalan.pe.hu/yemekler/resimler/${sepettekiYemek.yemek_resim_adi}"),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 40.0, top: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${sepettekiYemek.yemek_adi}",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Baslik"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 12.0),
                                      child: Text(
                                        "${int.parse(sepettekiYemek.yemek_fiyat) * int.parse(sepettekiYemek.yemek_siparis_adet)}₺",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color:
                                                Color.fromARGB(255, 255, 0, 0)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              IconButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "${sepettekiYemek.yemek_adi} sepetten silinsin mi ?",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      action: SnackBarAction(
                                        label: "Evet",
                                        onPressed: () {
                                          context
                                              .read<SepetSayfasiCubit>()
                                              .sepettenYemekSil(
                                                  sepettekiYemek.sepet_yemek_id,
                                                  widget.kullaniciAdi);
                                        },
                                      ),
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.delete_outline,
                                  color: Color.fromARGB(255, 255, 0, 0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Siparis Ver",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Baslik"),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 255, 0, 0)),
                )
              ],
            );
          } else {
            return Center(
              child: const Text(
                "Sepet Bos",
                style: TextStyle(
                    fontSize: 28,
                    fontFamily: "Baslik",
                    fontWeight: FontWeight.bold),
              ),
            );
          }
        },
      ),
    );
  }
}
