import 'package:gotur_app/cubit/anasayfa_cubit.dart';
import 'package:gotur_app/cubit/sepet_sayfasi_cubit.dart';
import 'package:gotur_app/cubit/yemek_detay_sayfasi_cubit.dart';
import 'package:gotur_app/views/anasayfa.dart';
import 'package:gotur_app/views/giris_sayfasi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AnasayfaCubit()),
        BlocProvider(create: (context) => YemekDetaySayfasiCubit()),
        BlocProvider(create: (context) => SepetSayfasiCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: GirisSayfasi(),
      ),
    );
  }
}
