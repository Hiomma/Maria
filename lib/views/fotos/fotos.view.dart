import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:maria/components/janela.component.dart';
import 'package:maria/controllers/fotos/fotos-path.controller.dart';
import 'package:maria/controllers/fotos/fotos.controller.dart';
import 'package:maria/views/fotos/upload.view.dart';
import 'package:maria/views/fotos/visualizar.view.dart';

class FotosView extends StatefulWidget {
  @override
  _FotosViewState createState() => _FotosViewState();
}

class _FotosViewState extends State<FotosView> {
  FotosController fotosController = FotosController();

  void initState() {
    super.initState();

    fotosController.fotosList.listen((fotos) {
      if (fotos.length > 0) {
        this.fotosController.getPathImages(fotos);
      }
    });
  }

  void navigateUpload(BuildContext context) async {
    final result = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => UploadView()));

    if (result) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(
          'Os arquivo foi adicionado com sucesso!',
          style: const TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 3),
      ));
    }
  }

  Widget showMark(FotosPathController foto) {
    if (foto.selecionado) {
      return Positioned(
        top: 10,
        right: 10,
        child: Container(
          child: new Icon(
            Icons.check,
            color: Colors.white,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border: Border.all(color: Colors.white, width: 2),
              color: Colors.blue),
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return JanelaComponent(
      context: context,
      title: "Fotos",
      floatingActionButton: Builder(
        builder: (context) => SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          animatedIconTheme: IconThemeData(size: 22.0),
          children: [
            SpeedDialChild(
              child: Icon(Icons.add),
              backgroundColor: Colors.green,
              label: 'Adicionar',
              labelStyle:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              onTap: () {
                navigateUpload(context);
              },
              labelBackgroundColor: Colors.green,
            ),
            SpeedDialChild(
              child: Icon(Icons.delete, color: Colors.white),
              backgroundColor: Colors.deepOrange,
              onTap: () async {
                await fotosController.deleteImages();

                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text(
                    'Os arquivos foram deletados com sucesso!',
                    style: const TextStyle(color: Colors.white),
                  ),
                  duration: Duration(seconds: 3),
                ));
              },
              label: 'Deletar',
              labelStyle:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              labelBackgroundColor: Colors.deepOrangeAccent,
            ),
            SpeedDialChild(
              child: Icon(Icons.file_download, color: Colors.white),
              backgroundColor: Colors.blue,
              onTap: () async {
                await fotosController.downloadImages();

                fotosController.uncheckAll();

                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text(
                    'Os arquivos foram baixados com sucesso!',
                    style: const TextStyle(color: Colors.white),
                  ),
                  duration: Duration(seconds: 3),
                ));
              },
              label: 'Download',
              labelStyle:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              labelBackgroundColor: Colors.blue,
            ),
            SpeedDialChild(
              child: Icon(Icons.check, color: Colors.white),
              backgroundColor: Colors.pink,
              onTap: fotosController.checkAll,
              label: 'Selecionar Todos',
              labelStyle:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              labelBackgroundColor: Colors.pink,
            ),
          ],
        ),
      ),
      child: Column(children: <Widget>[
        Expanded(
          child: Observer(builder: (_) {
            if (fotosController.fotosList.hasError) {
              return Center(
                  child: RaisedButton(
                child: Text(fotosController.fotosList.error),
                onPressed: fotosController.getList,
              ));
            }

            if (fotosController.pathList == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            List<FotosPathController> pathList = fotosController.pathList;

            return GridView.count(
              crossAxisCount: 3,
              padding: EdgeInsets.all(4),
              crossAxisSpacing: 4,
              children: List.generate(pathList.length, (index) {
                FotosPathController path = pathList[index];

                return Observer(
                  builder: (_) {
                    return GestureDetector(
                      onLongPress: () {
                        path.check();
                      },
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VisualizarView(
                              pathList: pathList,
                              index: index,
                            ),
                          ),
                        );
                      },
                      child: Stack(children: [
                        Image.network(
                          path.path,
                          fit: BoxFit.cover,
                          height: double.infinity,
                          width: double.infinity,
                        ),
                        showMark(path),
                      ]),
                    );
                  },
                );
              }),
            );
          }),
        )
      ]),
    );
  }
}
