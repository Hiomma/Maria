import 'package:flutter/material.dart';
import 'package:maria/models/menu.model.dart';
import 'package:maria/views/home/home.view.dart';
import 'package:maria/views/poemas/poemas.view.dart';
import 'package:maria/views/poemas-maria/poemas-maria.view.dart';
import 'package:maria/views/fotos/fotos.view.dart';

class JanelaComponent extends StatelessWidget {
  final List<MenuModel> menuList = [
    new MenuModel(titulo: "Home", widget: HomeView()),
    new MenuModel(titulo: "Poemas", widget: PoemasView()),
    new MenuModel(titulo: "Poemas da Maria", widget: PoemasMariaView()),
    new MenuModel(titulo: "Fotos", widget: FotosView()),
  ];

  final Widget child;
  final Widget floatingActionButton;
  final String title;
  final context;

  JanelaComponent(
      {this.child,
      this.floatingActionButton,
      @required this.title,
      @required this.context});

  void goTo(MenuModel menuModel) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => menuModel.widget));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: Text(
                  'Aplicativo do Bell e da Mell <3',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            Container(
              height: 400,
              child: ListView.separated(
                itemBuilder: (_, index) {
                  return ListTile(
                    title: Text(menuList[index].titulo),
                    onTap: () => goTo(menuList[index]),
                  );
                },
                itemCount: menuList.length,
                separatorBuilder: (context, index) {
                  return Divider();
                },
              ),
            ),
          ],
        ),
      ),
      body: child,
      floatingActionButton: floatingActionButton,
    );
  }
}
