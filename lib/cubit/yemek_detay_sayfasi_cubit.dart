import 'package:gotur_app/repo/yemekler_dao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class YemekDetaySayfasiCubit extends Cubit<void> {
  YemekDetaySayfasiCubit() : super(0);

  var yRepo = YemeklerDaoRepository();

  Future<void> sepeteEkle(
      String yemek_adi,
      String yemek_resim_Adi,
      String yemek_fiyat,
      String yemek_siparis_adet,
      String kullanici_adi) async {
    await yRepo.sepeteYemekEkle(yemek_adi, yemek_resim_Adi, yemek_fiyat,
        yemek_siparis_adet, kullanici_adi);
  }
}
