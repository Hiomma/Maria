
import 'package:maria/models/poemas-maria.model.dart';

abstract class IPoemasMariaRepository {
  Stream<List<PoemasMariaModel>> getPoemas();
  Future addPoema(String titulo, String texto);
  Future updatePoema(PoemasMariaModel poema);
}
