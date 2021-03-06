import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:maria/components/janela.component.dart';
import 'package:maria/controllers/poemas-maria/poemas-maria.controller.dart';
import 'package:maria/models/poemas-maria.model.dart';

class PoemasMariaView extends StatefulWidget {
  @override
  _PoemasMariaViewState createState() => _PoemasMariaViewState();
}

class _PoemasMariaViewState extends State<PoemasMariaView> {
  PoemasMariaController poemasMariaController = PoemasMariaController();
  PoemasMariaModel selectedPoema;
  final tituloController = TextEditingController();
  final textoController = TextEditingController();

  Widget showMark(PoemasMariaModel poema) {
    if (poema == selectedPoema) {
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

  Future openModal(PoemasMariaModel model) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          model.texto = model.texto.replaceAll("\\n", "\n");
          return AlertDialog(
            title: Text(
              model.titulo,
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(model.texto),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  Future<bool> openAddPoema() async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: TextField(
                style: TextStyle(fontSize: 20),
                decoration:
                    InputDecoration.collapsed(hintText: "Digite o Título aqui"),
                controller: tituloController),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  TextField(
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration.collapsed(
                        hintText: "Digite o Poema aqui"),
                    controller: textoController,
                  )
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("Cancelar"),
                onPressed: () {
                  Navigator.of(context).pop(false);
                  tituloController.clear();
                  textoController.clear();
                },
              ),
              FlatButton(
                child: Text("Ok"),
                onPressed: () async {
                  Navigator.of(context).pop(true);
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return JanelaComponent(
      title: "Poemas da Maria",
      context: context,
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
              onTap: () async {
                final isConfirmed = await openAddPoema();

                if (isConfirmed) {
                  await poemasMariaController.addPoema(
                      tituloController.text, textoController.text);

                  tituloController.clear();
                  textoController.clear();
                }
              },
              labelBackgroundColor: Colors.green,
            ),
            SpeedDialChild(
              child: Icon(Icons.create, color: Colors.white),
              backgroundColor: Colors.deepOrange,
              onTap: () async {
                if (selectedPoema != null) {
                  tituloController.text = selectedPoema.titulo;
                  textoController.text = selectedPoema.texto;

                  final isConfirmed = await openAddPoema();

                  if (isConfirmed) {
                    selectedPoema.titulo = tituloController.text;
                    selectedPoema.texto = textoController.text;
                    await poemasMariaController.updatePoema(selectedPoema);

                    tituloController.clear();
                    textoController.clear();
                  }
                }
              },
              label: 'Alterar',
              labelStyle:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              labelBackgroundColor: Colors.deepOrangeAccent,
            ),
          ],
        ),
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Observer(builder: (_) {
              if (poemasMariaController.poemasMariaList.hasError) {
                return Center(
                    child: RaisedButton(
                  child: Text(poemasMariaController.poemasMariaList.error),
                  onPressed: poemasMariaController.getList,
                ));
              }

              if (poemasMariaController.poemasMariaList.data == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              List<PoemasMariaModel> poemasMariaList =
                  poemasMariaController.poemasMariaList.data;

              return ListView.builder(
                itemCount: poemasMariaList.length,
                itemBuilder: (_, index) {
                  PoemasMariaModel model = poemasMariaList[index];

                  return ListTile(
                    title: Text(model.titulo),
                    subtitle: Text(
                        "Criação no dia: ${model.date.day.toString().padLeft(2, "0")}/${model.date.month.toString().padLeft(2, "0")}/${model.date.year}"),
                    onTap: () {
                      openModal(model);
                    },
                  );
                },
              );
            }),
          )
        ],
      ),
    );
  }
}
