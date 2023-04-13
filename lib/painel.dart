import 'package:flutter/material.dart';

class TextFieldSingleton extends TextEditingController {
  static TextFieldSingleton instance = TextFieldSingleton();
  static TextFieldSingleton historico = TextFieldSingleton();
  static double valor = 0;
  static String operador = '';

  TextEditingController painel = TextEditingController();

  TextEditingController alteraPainel(TextEditingController novopainel) {
    instance.painel.text = novopainel.text;
    return instance;
  }
}
