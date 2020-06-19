import 'package:maria/models/poemas.model.dart';

abstract class IPoemasRepository {
  Stream<List<PoemasModel>> getPoemas();
  Future addPoema(String titulo, String texto);
  Future updatePoema(PoemasModel poema);
}
