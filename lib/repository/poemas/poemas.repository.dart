import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maria/models/poemas.model.dart';
import 'package:maria/repository/poemas/poemas.interface.dart';

class PoemasRepository implements IPoemasRepository {
  Firestore firestore = Firestore.instance;

  PoemasRepository();

  @override
  Stream<List<PoemasModel>> getPoemas() {
    return firestore
        .collection("poemas")
        .orderBy("date", descending: true)
        .snapshots()
        .map((query) {
      return query.documents.map((doc) {
        return PoemasModel.fromDocument(doc);
      }).toList();
    });
  }

  @override
  Future addPoema(String titulo, String texto) {
    return firestore
        .collection("poemas")
        .add({'titulo': titulo, 'texto': texto, 'date': new Timestamp.now()});
  }

  @override
  Future updatePoema(PoemasModel poema) {
    return poema.reference.updateData(
        {'titulo': poema.titulo, 'texto': poema.texto, 'date': poema.date});
  }
}
