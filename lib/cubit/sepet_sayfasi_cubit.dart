import 'package:gotur_app/entity/sepet_yemekler.dart';
import 'package:gotur_app/repo/yemekler_dao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SepetSayfasiCubit extends Cubit<List> {
  SepetSayfasiCubit() : super(<SepetYemekler>[]);

  var yRepo = YemeklerDaoRepository();

  Future<void> sepettekiYemekleriYukle(String kullanici_adi) async {
    try {
      var liste = await yRepo.sepettekiYemekleriAl(kullanici_adi);
      emit(liste);
    } catch (e) {
      emit([]);
    }
  }

  Future<void> sepettenYemekSil(
      String sepet_yemek_id, String kullanici_adi) async {
    await yRepo.sepettenYemekSil(sepet_yemek_id, kullanici_adi);
    await sepettekiYemekleriYukle(kullanici_adi);
  }
}
