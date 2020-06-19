import 'package:flutter/material.dart';
import 'package:maria/components/janela.component.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  AnimationController controller;
  bool isFinished = false;

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${(duration.inHours % 24).toString().padLeft(2, '0')}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  String get daysRemaning {
    return "Faltam ${controller.duration.inDays} dias";
  }

  @override
  void initState() {
    super.initState();

    final dateNow = new DateTime.now();
    final nextAniversary = new DateTime(2020,
        dateNow.day < 22 ? dateNow.month : dateNow.month + 1, 22, 0, 0, 0);

    controller = AnimationController(
      vsync: this,
      duration: nextAniversary.difference(dateNow),
    );

    controller.reverse(from: controller.value == 0.0 ? 1.0 : controller.value);

    controller.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        setState(() {
          isFinished = true;
        });
      }
    });
  }

  Widget showCongratulations() {
    return Stack(
      children: <Widget>[
        Positioned(
          child: Align(
            alignment: FractionalOffset.center,
            child: Container(
              child: new Image.asset('assets/coracao.png'),
            ),
          ),
        ),
        Center(
          child: Text(
            "Parabéns meu bem <3\nVê lá meu poeminha :3",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return JanelaComponent(
      title: "Página Inicial",
      context: context,
      child: isFinished == false
          ? Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    child: Align(
                      alignment: FractionalOffset.center,
                      child: AspectRatio(
                        aspectRatio: 1.0,
                        child: Stack(
                          children: <Widget>[
                            Align(
                              alignment: FractionalOffset.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Mesversário de Namoro",
                                    style: themeData.textTheme.subtitle1,
                                  ),
                                  AnimatedBuilder(
                                    animation: controller,
                                    builder:
                                        (BuildContext context, Widget child) {
                                      return Text(
                                        timerString,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w100,
                                          color: Colors.black54,
                                          fontSize: 80,
                                        ),
                                      );
                                    },
                                  ),
                                  Text(daysRemaning),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : showCongratulations(),
    );
  }
}
