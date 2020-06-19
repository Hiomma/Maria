import 'package:cloud_firestore/cloud_firestore.dart';

class FotosModel {
  String caminho;
  String data;

  DocumentReference reference;

  FotosModel({this.caminho, this.data, this.reference});

  factory FotosModel.fromDocument(DocumentSnapshot doc) {
    return FotosModel(
      caminho: doc['caminho'],
      data: doc['data'],
      reference: doc.reference,
    );
  }
}
