// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poemas.controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PoemasController on _PoemasController, Store {
  final _$poemasListAtom = Atom(name: '_PoemasController.poemasList');

  @override
  ObservableStream<List<PoemasModel>> get poemasList {
    _$poemasListAtom.reportRead();
    return super.poemasList;
  }

  @override
  set poemasList(ObservableStream<List<PoemasModel>> value) {
    _$poemasListAtom.reportWrite(value, super.poemasList, () {
      super.poemasList = value;
    });
  }

  final _$_PoemasControllerActionController =
      ActionController(name: '_PoemasController');

  @override
  dynamic getList() {
    final _$actionInfo = _$_PoemasControllerActionController.startAction(
        name: '_PoemasController.getList');
    try {
      return super.getList();
    } finally {
      _$_PoemasControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
poemasList: ${poemasList}
    ''';
  }
}
