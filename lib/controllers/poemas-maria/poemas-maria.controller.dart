import 'package:maria/models/poemas-maria.model.dart';
import 'package:maria/repository/poemas-maria/poemas-maria.interface.dart';
import 'package:maria/repository/poemas-maria/poemas-maria.repository.dart';
import 'package:mobx/mobx.dart';

part "poemas-maria.controller.g.dart";

class PoemasMariaController = _PoemasMariaController
    with _$PoemasMariaController;

abstract class _PoemasMariaController with Store {
  IPoemasMariaRepository poemasMariaRepository = PoemasMariaRepository();

  @observable
  ObservableStream<List<PoemasMariaModel>> poemasMariaList;

  _PoemasMariaController() {
    getList();
  }

  @action
  getList() {
    poemasMariaList = poemasMariaRepository.getPoemas().asObservable();
  }

  @action
  Future addPoema(String titulo, String texto) async {
    await poemasMariaRepository.addPoema(titulo, texto);
  }

  @action
  Future updatePoema(PoemasMariaModel poema) async {
    await poemasMariaRepository.updatePoema(poema);
  }
}
