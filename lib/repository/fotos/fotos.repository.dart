import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:intl/intl.dart';
import 'package:maria/controllers/fotos/fotos-path.controller.dart';
import 'package:maria/models/fotos/fotos.model.dart';
import 'package:maria/repository/fotos/fotos.interface.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class FotosRepository implements IFotosRepository {
  Firestore firestore = Firestore.instance;
  FirebaseStorage firestorage = FirebaseStorage.instance;

  FotosRepository();

  @override
  Stream<List<FotosModel>> getFotos() {
    return firestore.collection("fotos").snapshots().map((query) {
      return query.documents.map((doc) {
        return FotosModel.fromDocument(doc);
      }).toList();
    });
  }

  @override
  Future addImages(List<Asset> listImages) async {
    for (final image in listImages) {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      String path = "fotos/" + fileName;
      final df = new DateFormat('dd/MM/yyyy');

      StorageReference reference = firestorage.ref().child(path);

      StorageUploadTask task =
          reference.putData((await image.getByteData()).buffer.asUint8List());

      await task.onComplete.then((value) async {
        return await firestore
            .collection("fotos")
            .add({'caminho': path, 'data': df.format(new DateTime.now())});
      });
    }
  }

  @override
  Future<List<FotosPathController>> getStorageImages(
      List<FotosModel> fotosList) async {
    final pathList = List<FotosPathController>();

    for (var foto in fotosList) {
      final String path =
          await firestorage.ref().child(foto.caminho).getDownloadURL();

      pathList.add(
          new FotosPathController(path: path, selecionado: false, foto: foto));
    }

    return pathList;
  }

  @override
  Future deleteImages(List<FotosPathController> fotos) async {
    try {
      for (var foto in fotos) {
        await foto.foto.reference.delete();
        await firestorage.ref().child(foto.foto.caminho).delete();
      }
    } catch (error) {
      throw error;
    }
  }

  @override
  Future downloadImages(List<FotosPathController> fotos) async {
    try {
      for (var foto in fotos) {
        await ImageDownloader.downloadImage(foto.path);
      }
    } on PlatformException catch (error) {
      throw error;
    }
  }
}
