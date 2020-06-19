import 'package:maria/models/fotos/fotos.model.dart';
import 'package:mobx/mobx.dart';

part "fotos-path.controller.g.dart";

class FotosPathController = _FotosPathController with _$FotosPathController;

abstract class _FotosPathController with Store {
  @observable
  FotosModel foto;

  @observable
  bool selecionado = false;

  @observable
  String path;

  _FotosPathController({this.foto, this.selecionado, this.path});

  @action
  void check() {
    selecionado = !selecionado;
  }

  @action
  void checkWithOption(bool isSelected) {
    selecionado = isSelected;
  }

  factory _FotosPathController.fromStorage(
      {String path, bool selecionado, FotosModel foto}) {
    return FotosPathController(
        path: path, selecionado: selecionado, foto: foto);
  }
}
