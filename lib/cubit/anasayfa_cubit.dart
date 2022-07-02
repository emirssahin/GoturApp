import 'package:gotur_app/entity/yemekler.dart';
import 'package:gotur_app/repo/yemekler_dao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnasayfaCubit extends Cubit<List<Yemekler>> {
  AnasayfaCubit() : super(<Yemekler>[]);

  var yRepo = YemeklerDaoRepository();

  Future<void> tumYemekleriGetir() async {
    var liste = await yRepo.tumYemekleriAl();
    emit(liste);
  }
}
