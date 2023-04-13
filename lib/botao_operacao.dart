import 'package:flutter/material.dart';
import 'calculo.dart';
import 'painel.dart';

class BotaoOperacao extends StatelessWidget with Calculo {
  final String buttonkey;
  final Size size;
  final Image imageasset;
  const BotaoOperacao(
      {super.key,
      required this.size,
      required this.imageasset,
      required this.buttonkey});

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Ink(
        decoration: BoxDecoration(
          border: Border.all(
              color: const Color.fromRGBO(113, 204, 13, 0.81), width: 2.0),
          color: const Color.fromRGBO(0, 24, 34, 0.856),
          shape: BoxShape.circle,
        ),
        child: InkWell(
            borderRadius: BorderRadius.circular(1000),
            onTap: () {},
            child: IconButton(
              style: IconButton.styleFrom(
                backgroundColor: Colors.transparent,
                minimumSize: size * 0.98,
              ),
              onPressed: () {
                Calculo.insereOperador(
                    buttonkey,
                    TextFieldSingleton.instance.painel,
                    TextFieldSingleton.valor,
                    TextFieldSingleton.operador);
                TextFieldSingleton.historico.text =
                    TextFieldSingleton.valor.toString();
                print(TextFieldSingleton.valor);
                print(TextFieldSingleton.operador);
              },
              icon: imageasset,
            )),
      ),
    );
  }
}
