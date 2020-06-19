// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poemas-maria.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PoemasMariaController on _PoemasMariaController, Store {
  final _$poemasMariaListAtom =
      Atom(name: '_PoemasMariaController.poemasMariaList');

  @override
  ObservableStream<List<PoemasMariaModel>> get poemasMariaList {
    _$poemasMariaListAtom.reportRead();
    return super.poemasMariaList;
  }

  @override
  set poemasMariaList(ObservableStream<List<PoemasMariaModel>> value) {
    _$poemasMariaListAtom.reportWrite(value, super.poemasMariaList, () {
      super.poemasMariaList = value;
    });
  }

  final _$_PoemasMariaControllerActionController =
      ActionController(name: '_PoemasMariaController');

  @override
  dynamic getList() {
    final _$actionInfo = _$_PoemasMariaControllerActionController.startAction(
        name: '_PoemasMariaController.getList');
    try {
      return super.getList();
    } finally {
      _$_PoemasMariaControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
poemasMariaList: ${poemasMariaList}
    ''';
  }
}
