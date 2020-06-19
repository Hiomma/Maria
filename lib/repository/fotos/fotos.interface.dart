import 'package:maria/controllers/fotos/fotos-path.controller.dart';
import 'package:maria/models/fotos/fotos.model.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

abstract class IFotosRepository {
  Stream<List<FotosModel>> getFotos();
  Future addImages(List<Asset> listImages);
  Future deleteImages(List<FotosPathController> fotos);
  Future<List<FotosPathController>> getStorageImages(
      List<FotosModel> fotosList);
  Future downloadImages(List<FotosPathController> fotos);
}
