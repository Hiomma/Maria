import 'package:flutter/material.dart';
import 'package:maria/components/janela.component.dart';
import 'package:maria/controllers/fotos/fotos.controller.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class UploadView extends StatefulWidget {
  @override
  _UploadViewState createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  List<Asset> selectedImages;
  FotosController fotosController = FotosController();
  List<Asset> images = List<Asset>();

  Future getImage() async {
    final tempImage = await MultiImagePicker.pickImages(
      maxImages: 300,
      selectedAssets: images,
      cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
      materialOptions: MaterialOptions(
        actionBarColor: "#ff2196f3",
        actionBarTitle: "Selecione as fotos",
        allViewTitle: "Todas as fotos",
        useDetailsView: false,
        selectCircleStrokeColor: "#000000",
      ),
    );

    if (tempImage != null) {
      setState(() {
        selectedImages = tempImage;
      });
    }
  }

  Widget enableUpload() {
    return Center(
      child: Column(
        children: <Widget>[
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              padding: EdgeInsets.all(4),
              crossAxisSpacing: 4,
              children: List.generate(
                selectedImages.length,
                (index) {
                  return AssetThumb(
                      asset: selectedImages[0], width: 300, height: 300);
                },
              ),
            ),
          ),
          RaisedButton(
            child: Text("Upload"),
            textColor: Colors.white,
            color: Colors.blue,
            onPressed: () async {
              await fotosController.addImage(selectedImages);

              Navigator.pop(context, true);
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return JanelaComponent(
      context: context,
      title: "Upload da Imagem",
      floatingActionButton: new FloatingActionButton(
        onPressed: getImage,
        tooltip: "Adicionar Imagem",
        child: new Icon(Icons.file_upload),
      ),
      child: selectedImages == null
          ? Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    new Icon(
                      Icons.cloud_upload,
                      size: 80,
                    ),
                    Text("Selecione uma Imagem"),
                  ]),
            )
          : enableUpload(),
    );
  }
}
