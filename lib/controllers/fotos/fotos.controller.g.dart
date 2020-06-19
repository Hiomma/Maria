// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fotos.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FotosController on _FotosController, Store {
  final _$pathListAtom = Atom(name: '_FotosController.pathList');

  @override
  ObservableList<FotosPathController> get pathList {
    _$pathListAtom.reportRead();
    return super.pathList;
  }

  @override
  set pathList(ObservableList<FotosPathController> value) {
    _$pathListAtom.reportWrite(value, super.pathList, () {
      super.pathList = value;
    });
  }

  final _$fotosListAtom = Atom(name: '_FotosController.fotosList');

  @override
  ObservableStream<List<FotosModel>> get fotosList {
    _$fotosListAtom.reportRead();
    return super.fotosList;
  }

  @override
  set fotosList(ObservableStream<List<FotosModel>> value) {
    _$fotosListAtom.reportWrite(value, super.fotosList, () {
      super.fotosList = value;
    });
  }

  final _$addImageAsyncAction = AsyncAction('_FotosController.addImage');

  @override
  Future<dynamic> addImage(List<Asset> selectedImages) {
    return _$addImageAsyncAction.run(() => super.addImage(selectedImages));
  }

  final _$deleteImagesAsyncAction =
      AsyncAction('_FotosController.deleteImages');

  @override
  Future<dynamic> deleteImages() {
    return _$deleteImagesAsyncAction.run(() => super.deleteImages());
  }

  final _$getPathImagesAsyncAction =
      AsyncAction('_FotosController.getPathImages');

  @override
  Future<void> getPathImages(List<FotosModel> fotos) {
    return _$getPathImagesAsyncAction.run(() => super.getPathImages(fotos));
  }

  final _$downloadImagesAsyncAction =
      AsyncAction('_FotosController.downloadImages');

  @override
  Future<void> downloadImages() {
    return _$downloadImagesAsyncAction.run(() => super.downloadImages());
  }

  final _$_FotosControllerActionController =
      ActionController(name: '_FotosController');

  @override
  dynamic getList() {
    final _$actionInfo = _$_FotosControllerActionController.startAction(
        name: '_FotosController.getList');
    try {
      return super.getList();
    } finally {
      _$_FotosControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void checkAll() {
    final _$actionInfo = _$_FotosControllerActionController.startAction(
        name: '_FotosController.checkAll');
    try {
      return super.checkAll();
    } finally {
      _$_FotosControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void uncheckAll() {
    final _$actionInfo = _$_FotosControllerActionController.startAction(
        name: '_FotosController.uncheckAll');
    try {
      return super.uncheckAll();
    } finally {
      _$_FotosControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pathList: ${pathList},
fotosList: ${fotosList}
    ''';
  }
}
