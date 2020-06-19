import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:maria/components/janela.component.dart';
import 'package:maria/controllers/fotos/fotos-path.controller.dart';

class VisualizarView extends StatefulWidget {
  final int index;
  final List<FotosPathController> pathList;

  const VisualizarView({this.index, this.pathList});

  @override
  _VisualizarViewState createState() => _VisualizarViewState();
}

class _VisualizarViewState extends State<VisualizarView> {
  CarouselController carouselController = CarouselController();

  void initState() {
    super.initState();

    Timer(Duration(seconds: 1),
        () => carouselController.jumpToPage(this.widget.index));
  }

  @override
  Widget build(BuildContext context) {
    return JanelaComponent(
      context: context,
      title: "Visualizar",
      child: CarouselSlider(
        carouselController: carouselController,
        options: CarouselOptions(height: double.infinity),
        items: this.widget.pathList.map((path) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(color: Colors.amber),
                child: Image.network(
                  path.path,
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: double.infinity,
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
