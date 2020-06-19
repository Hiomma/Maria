import 'package:maria/models/poemas.model.dart';
import 'package:maria/repository/poemas/poemas.interface.dart';
import 'package:maria/repository/poemas/poemas.repository.dart';
import 'package:mobx/mobx.dart';

part "poemas.controller.g.dart";

class PoemasController = _PoemasController with _$PoemasController;

abstract class _PoemasController with Store {
  IPoemasRepository poemasRepository = PoemasRepository();

  @observable
  ObservableStream<List<PoemasModel>> poemasList;

  _PoemasController() {
    getList();
  }

  @action
  getList() {
    poemasList = poemasRepository.getPoemas().asObservable();
  }

  @action
  Future addPoema(String titulo, String texto) async {
    await poemasRepository.addPoema(titulo, texto);
  }

  @action
  Future updatePoema(PoemasModel poema) async {
    await poemasRepository.updatePoema(poema);
  }
}
