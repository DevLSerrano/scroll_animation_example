import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int grau = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example LS Dev '),
      ),
      body: Center(
        child: GestureDetector(
          onPanUpdate: (details) {
            // Clicando e puxando pra direita ou pra cima
            if (details.delta.dx > 0 || details.delta.dy > 0) {
              setState(() {
                grau += 5; //Aumentando de 5 em 5 graus
              });
            }

            //Clicando e puxando pra esquerda ou pra baixo
            if (details.delta.dx < 0 || details.delta.dy < 0) {
              setState(() {
                grau -= 5;
              });
            }
          },
          child: RotationTransition(
            turns: AlwaysStoppedAnimation(grau / 360),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(),
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Text('LS'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
