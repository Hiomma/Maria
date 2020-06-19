import 'package:cloud_firestore/cloud_firestore.dart';

class PoemasModel {
  String titulo;
  String texto;
  DateTime date;
  DocumentReference reference;

  PoemasModel({this.titulo, this.texto, this.date, this.reference});

  factory PoemasModel.fromDocument(DocumentSnapshot doc) {
    return PoemasModel(
      titulo: doc['titulo'],
      texto: doc['texto'],
      date: new DateTime.fromMillisecondsSinceEpoch(
          (doc['date'] as Timestamp).millisecondsSinceEpoch),
      reference: doc.reference,
    );
  }
}
