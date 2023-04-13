import 'dart:core';
import 'package:flutter/material.dart';
import 'botao_numero.dart';
import 'botao_operacao.dart';
import 'painel.dart';

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  @override
  void initState() {
    TextFieldSingleton.instance.painel = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    TextFieldSingleton.instance.painel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = Size(MediaQuery.of(context).size.width * 0.23,
        MediaQuery.of(context).size.width * 0.23);
    TextEditingController inicia = TextEditingController();
    inicia.text = '0';
    TextFieldSingleton.instance.alteraPainel(inicia);
    TextFieldSingleton.historico.text = '0';
    return Scaffold(
        appBar: AppBar(
          title: const Text('Calculadora'),
        ),
        body: Column(children: <Widget>[
          Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.99),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 2.0, horizontal: 0.8),
                  child: TextField(
                      enabled: false,
                      maxLines: 1,
                      controller: TextFieldSingleton.historico,
                      textAlign: TextAlign.right,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.grey,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 2.0, horizontal: 0.8),
                  child: TextField(
                      enabled: false,
                      maxLines: 1,
                      controller: TextFieldSingleton.instance.painel,
                      textAlign: TextAlign.right,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(
                        fontSize: 50,
                      )),
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BotaoOperacao(
                        size: size,
                        imageasset: Image.asset('assets/images/c.png'),
                        buttonkey: 'C'),
                    BotaoOperacao(
                        size: size,
                        imageasset: Image.asset('assets/images/arrow.png'),
                        buttonkey: 'DEL'),
                    BotaoOperacao(
                        size: size,
                        imageasset: Image.asset('assets/images/percent.png'),
                        buttonkey: '%'),
                    BotaoOperacao(
                        size: size,
                        imageasset: Image.asset('assets/images/divides.png'),
                        buttonkey: '/'),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BotaoNumero(
                        size: size,
                        imageasset: Image.asset('assets/images/seven.png'),
                        buttonkey: '7'),
                    BotaoNumero(
                        size: size,
                        imageasset: Image.asset('assets/images/eight.png'),
                        buttonkey: '8'),
                    BotaoNumero(
                        size: size,
                        imageasset: Image.asset('assets/images/nine.png'),
                        buttonkey: '9'),
                    BotaoOperacao(
                        size: size,
                        imageasset: Image.asset('assets/images/multi.png'),
                        buttonkey: '*'),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BotaoNumero(
                        size: size,
                        imageasset: Image.asset('assets/images/four.png'),
                        buttonkey: '4'),
                    BotaoNumero(
                        size: size,
                        imageasset: Image.asset('assets/images/five.png'),
                        buttonkey: '5'),
                    BotaoNumero(
                        size: size,
                        imageasset: Image.asset('assets/images/six.png'),
                        buttonkey: '6'),
                    BotaoOperacao(
                        size: size,
                        imageasset: Image.asset('assets/images/minus.png'),
                        buttonkey: '-'),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BotaoNumero(
                        size: size,
                        imageasset: Image.asset('assets/images/one.png'),
                        buttonkey: '1'),
                    BotaoNumero(
                        size: size,
                        imageasset: Image.asset('assets/images/two.png'),
                        buttonkey: '2'),
                    BotaoNumero(
                        size: size,
                        imageasset: Image.asset('assets/images/three.png'),
                        buttonkey: '3'),
                    BotaoOperacao(
                        size: size,
                        imageasset: Image.asset('assets/images/plus.png'),
                        buttonkey: '+'),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BotaoNumero(
                        size: size,
                        imageasset: Image.asset('assets/images/p_m.png'),
                        buttonkey: 'PM'),
                    BotaoNumero(
                        size: size,
                        imageasset: Image.asset('assets/images/zero.png'),
                        buttonkey: '0'),
                    BotaoNumero(
                        size: size,
                        imageasset: Image.asset('assets/images/dot.png'),
                        buttonkey: '.'),
                    BotaoOperacao(
                        size: size,
                        imageasset: Image.asset('assets/images/equal.png'),
                        buttonkey: '='),
                  ],
                ),
              ],
            ),
          ),
        ]));
  }
}
