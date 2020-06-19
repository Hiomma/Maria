import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:maria/models/poemas-maria.model.dart';
import 'package:maria/repository/poemas-maria/poemas-maria.interface.dart';

class PoemasMariaRepository implements IPoemasMariaRepository {
  Firestore firestore = Firestore.instance;

  PoemasMariaRepository();

  @override
  Stream<List<PoemasMariaModel>> getPoemas() {
    return firestore
        .collection("poemas_maria")
        .orderBy("date", descending: true)
        .snapshots()
        .map((query) {
      return query.documents.map((doc) {
        return PoemasMariaModel.fromDocument(doc);
      }).toList();
    });
  }

  @override
  Future addPoema(String titulo, String texto) {
    return firestore
        .collection("poemas_maria")
        .add({'titulo': titulo, 'texto': texto, 'date': new Timestamp.now()});
  }

  @override
  Future updatePoema(PoemasMariaModel poema) {
    return poema.reference.updateData(
        {'titulo': poema.titulo, 'texto': poema.texto, 'date': poema.date});
  }
}
