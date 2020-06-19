import 'package:cloud_firestore/cloud_firestore.dart';

class PoemasMariaModel {
  String titulo;
  String texto;
  DateTime date;
  DocumentReference reference;

  PoemasMariaModel({this.titulo, this.texto, this.date, this.reference});

  factory PoemasMariaModel.fromDocument(DocumentSnapshot doc) {
    return PoemasMariaModel(
      titulo: doc['titulo'],
      texto: doc['texto'],
      date: new DateTime.fromMillisecondsSinceEpoch(
          (doc['date'] as Timestamp).millisecondsSinceEpoch),
      reference: doc.reference,
    );
  }
}
