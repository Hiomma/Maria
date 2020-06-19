import 'dart:async';

import 'package:maria/controllers/fotos/fotos-path.controller.dart';
import 'package:maria/models/fotos/fotos.model.dart';
import 'package:maria/repository/fotos/fotos.interface.dart';
import 'package:maria/repository/fotos/fotos.repository.dart';
import 'package:mobx/mobx.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

part "fotos.controller.g.dart";

class FotosController = _FotosController with _$FotosController;

abstract class _FotosController with Store {
  IFotosRepository fotosRepository = FotosRepository();

  @observable
  ObservableList<FotosPathController> pathList;

  @observable
  ObservableStream<List<FotosModel>> fotosList;

  _FotosController() {
    getList();
  }

  @action
  getList() {
    fotosList = fotosRepository.getFotos().asObservable();
  }

  @action
  Future addImage(List<Asset> selectedImages) async {
    return await fotosRepository.addImages(selectedImages);
  }

  @action
  Future deleteImages() async {
    return await fotosRepository.deleteImages(
        pathList.where((element) => element.selecionado == true).toList());
  }

  @action
  void checkAll() {
    pathList.forEach((element) {
      element.check();
    });
  }

  @action
  void uncheckAll() {
    pathList.forEach((element) {
      element.checkWithOption(false);
    });
  }

  @action
  Future<void> getPathImages(List<FotosModel> fotos) async {
    if (fotos != null) {
      final auxList = await fotosRepository.getStorageImages(fotos);
      pathList = auxList.asObservable();
    }
  }

  @action
  Future<void> downloadImages() async {
    final List<FotosPathController> auxList =
        pathList.where((element) => element.selecionado == true).toList();
    await fotosRepository.downloadImages(auxList);
  }
}
