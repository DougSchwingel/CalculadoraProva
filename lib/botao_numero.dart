import 'package:flutter/material.dart';
import 'calculo.dart';
import 'painel.dart';

class BotaoNumero extends StatelessWidget with Calculo {
  final String buttonkey;
  final Size size;
  final Image imageasset;
  const BotaoNumero(
      {super.key,
      required this.size,
      required this.imageasset,
      required this.buttonkey});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: const Color.fromRGBO(0, 24, 34, 0.856),
        minimumSize: size,
      ),
      onPressed: () {
        Calculo.insereNumero(buttonkey, TextFieldSingleton.instance.painel,
            TextFieldSingleton.valor);
      },
      icon: imageasset,
    );
  }
}
