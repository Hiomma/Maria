// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fotos-path.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FotosPathController on _FotosPathController, Store {
  final _$fotoAtom = Atom(name: '_FotosPathController.foto');

  @override
  FotosModel get foto {
    _$fotoAtom.reportRead();
    return super.foto;
  }

  @override
  set foto(FotosModel value) {
    _$fotoAtom.reportWrite(value, super.foto, () {
      super.foto = value;
    });
  }

  final _$selecionadoAtom = Atom(name: '_FotosPathController.selecionado');

  @override
  bool get selecionado {
    _$selecionadoAtom.reportRead();
    return super.selecionado;
  }

  @override
  set selecionado(bool value) {
    _$selecionadoAtom.reportWrite(value, super.selecionado, () {
      super.selecionado = value;
    });
  }

  final _$pathAtom = Atom(name: '_FotosPathController.path');

  @override
  String get path {
    _$pathAtom.reportRead();
    return super.path;
  }

  @override
  set path(String value) {
    _$pathAtom.reportWrite(value, super.path, () {
      super.path = value;
    });
  }

  final _$_FotosPathControllerActionController =
      ActionController(name: '_FotosPathController');

  @override
  void check() {
    final _$actionInfo = _$_FotosPathControllerActionController.startAction(
        name: '_FotosPathController.check');
    try {
      return super.check();
    } finally {
      _$_FotosPathControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void checkWithOption(bool isSelected) {
    final _$actionInfo = _$_FotosPathControllerActionController.startAction(
        name: '_FotosPathController.checkWithOption');
    try {
      return super.checkWithOption(isSelected);
    } finally {
      _$_FotosPathControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
foto: ${foto},
selecionado: ${selecionado},
path: ${path}
    ''';
  }
}
