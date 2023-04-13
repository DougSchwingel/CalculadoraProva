import 'package:calculadora_prova/painel.dart';
import 'package:flutter/material.dart';

mixin Calculo {
  static TextEditingController insereNumero(
      String buttonkey, TextEditingController painel, double valor) {
    //Variáveis
    List<String> operacoes = ['*', '+', '-', '%', '/'];
    TextEditingController painel_1 = TextEditingController();

    //Plus Minus
    if (buttonkey == 'PM') {
      if (painel.text == '0') {
        return TextFieldSingleton.instance.alteraPainel(painel);
      } else if (painel.text[0] == '-') {
        painel_1.text = painel.text.substring(1);
        return TextFieldSingleton.instance.alteraPainel(painel_1);
      } else {
        painel_1.text = '-${painel.text}';
        return TextFieldSingleton.instance.alteraPainel(painel_1);
      }
    }
    //Dot
    else if (buttonkey == '.') {
      if (painel.text.contains('.')) {
        return painel;
      } else if (operacoes.contains(painel.text[painel.text.length - 1])) {
        return painel;
      } else {
        painel.text = '${painel.text}.';
        return painel;
      }
    }
    //Initialize
    else if (painel.text == '0') {
      painel.text = buttonkey;
      return painel;
    }
    //Add number
    else {
      if (painel.text[painel.text.length - 1] == '%') {
        painel.text = '${painel.text}x$buttonkey';
      } else if (painel.text.length == 1 &&
          painel.text[painel.text.length - 1] == '0') {
        painel.text = buttonkey;
      } else {
        painel.text = painel.text + buttonkey;
        return painel;
      }
      return painel;
    }
  }

  static TextEditingController insereOperador(String buttonkey,
      TextEditingController painel, double valor, String operador) {
    List<String> operacoes = ['*', '+', '-', '%', '/'];
    if (painel.text == '0' && operacoes.contains(TextFieldSingleton.operador)) {
      TextFieldSingleton.operador = buttonkey;
    } else if (buttonkey == 'C') {
      painel.text = '0';
      TextFieldSingleton.valor = 0;
      TextFieldSingleton.operador = '';
      return painel;
    } else if (buttonkey == 'DEL') {
      if (painel.text == '') {
        painel.text = '0';
        return painel;
      } else {
        if (painel.text.length == 1) {
          painel.text = '0';
          return painel;
        } else {
          painel.text = painel.text.substring(0, painel.text.length - 1);
          return painel;
        }
      }
    } else if (buttonkey == '%') {
      if (painel.text == '0') {
        return painel;
      } else {
        double valor = (double.parse(painel.text)) / 100;
        painel.text = valor.toString();

        return painel;
      }
    } else if (TextFieldSingleton.valor == 0) {
      if (buttonkey == '/') {
        if (painel.text == '0') {
          TextFieldSingleton.operador = buttonkey;
          return painel;
        } else {
          TextFieldSingleton.valor = double.parse(painel.text);
          TextFieldSingleton.operador = buttonkey;
          painel.text = '0';
          return painel;
        }
      } else if (buttonkey == '*') {
        TextFieldSingleton.valor = double.parse(painel.text);
        TextFieldSingleton.operador = buttonkey;
        painel.text = '0';
      } else if (buttonkey == '-') {
        TextFieldSingleton.valor = double.parse(painel.text);
        TextFieldSingleton.operador = buttonkey;
        painel.text = '0';
      } else if (buttonkey == '+') {
        TextFieldSingleton.valor = double.parse(painel.text);
        TextFieldSingleton.operador = buttonkey;
        painel.text = '0';
      } else if (buttonkey == '=') {
        TextFieldSingleton.valor = double.parse(painel.text);
        painel.text = '0';
      } else {
        return painel;
      }
    } else {
      if (buttonkey == '/') {
        if (TextFieldSingleton.operador == '/') {
          if (painel.text == '0') {
            TextFieldSingleton.operador = buttonkey;
            return painel;
          }
          TextFieldSingleton.valor =
              TextFieldSingleton.valor / double.parse(painel.text);
          TextFieldSingleton.operador = buttonkey;
          painel.text = TextFieldSingleton.valor.toString();
          TextFieldSingleton.historico.text = painel.text;
          painel.text = '0';
        } else if (TextFieldSingleton.operador == '*') {
          TextFieldSingleton.valor =
              TextFieldSingleton.valor * double.parse(painel.text);
          TextFieldSingleton.operador = buttonkey;
          painel.text = TextFieldSingleton.valor.toString();
          TextFieldSingleton.historico.text = painel.text;
          painel.text = '0';
        } else if (TextFieldSingleton.operador == '-') {
          TextFieldSingleton.valor =
              TextFieldSingleton.valor - double.parse(painel.text);
          TextFieldSingleton.operador = buttonkey;
          painel.text = TextFieldSingleton.valor.toString();
          TextFieldSingleton.historico.text = painel.text;
          painel.text = '0';
        } else if (TextFieldSingleton.operador == '+') {
          TextFieldSingleton.valor =
              TextFieldSingleton.valor + double.parse(painel.text);
          TextFieldSingleton.operador = buttonkey;
          painel.text = TextFieldSingleton.valor.toString();
          TextFieldSingleton.historico.text = painel.text;
          painel.text = '0';
        } else {
          painel.text = '0';
          return painel;
        }
      } else if (buttonkey == '*') {
        if (TextFieldSingleton.operador == '/') {
          if (painel.text == '0') {
            TextFieldSingleton.operador = buttonkey;
            return painel;
          }
          TextFieldSingleton.valor =
              TextFieldSingleton.valor / double.parse(painel.text);
          TextFieldSingleton.operador = buttonkey;
          painel.text = TextFieldSingleton.valor.toString();
          TextFieldSingleton.historico.text = painel.text;
          painel.text = '0';
        } else if (TextFieldSingleton.operador == '*') {
          TextFieldSingleton.valor =
              TextFieldSingleton.valor * double.parse(painel.text);
          TextFieldSingleton.operador = buttonkey;
          painel.text = TextFieldSingleton.valor.toString();
          TextFieldSingleton.historico.text = painel.text;
          painel.text = '0';
        } else if (TextFieldSingleton.operador == '-') {
          TextFieldSingleton.valor =
              TextFieldSingleton.valor - double.parse(painel.text);
          TextFieldSingleton.operador = buttonkey;
          painel.text = TextFieldSingleton.valor.toString();
          TextFieldSingleton.historico.text = painel.text;
          painel.text = '0';
        } else if (TextFieldSingleton.operador == '+') {
          TextFieldSingleton.valor =
              TextFieldSingleton.valor + double.parse(painel.text);
          TextFieldSingleton.operador = buttonkey;
          painel.text = TextFieldSingleton.valor.toString();
          TextFieldSingleton.historico.text = painel.text;
          painel.text = '0';
        } else {
          painel.text = '0';
          return painel;
        }
      } else if (buttonkey == '-') {
        if (TextFieldSingleton.operador == '/') {
          if (painel.text == '0') {
            TextFieldSingleton.operador = buttonkey;
            return painel;
          }
          TextFieldSingleton.valor =
              TextFieldSingleton.valor / double.parse(painel.text);
          TextFieldSingleton.operador = buttonkey;
          painel.text = TextFieldSingleton.valor.toString();
          TextFieldSingleton.historico.text = painel.text;
          painel.text = '0';
        } else if (TextFieldSingleton.operador == '*') {
          TextFieldSingleton.valor =
              TextFieldSingleton.valor * double.parse(painel.text);
          TextFieldSingleton.operador = buttonkey;
          painel.text = TextFieldSingleton.valor.toString();
          TextFieldSingleton.historico.text = painel.text;
          painel.text = '0';
        } else if (TextFieldSingleton.operador == '-') {
          TextFieldSingleton.valor =
              TextFieldSingleton.valor - double.parse(painel.text);
          TextFieldSingleton.operador = buttonkey;
          painel.text = TextFieldSingleton.valor.toString();
          TextFieldSingleton.historico.text = painel.text;
          painel.text = '0';
        } else if (TextFieldSingleton.operador == '+') {
          TextFieldSingleton.valor =
              TextFieldSingleton.valor + double.parse(painel.text);
          TextFieldSingleton.operador = buttonkey;
          painel.text = TextFieldSingleton.valor.toString();
          TextFieldSingleton.historico.text = painel.text;
          painel.text = '0';
        } else {
          painel.text = '0';
          return painel;
        }
      } else if (buttonkey == '+') {
        if (TextFieldSingleton.operador == '/') {
          if (painel.text == '0') {
            TextFieldSingleton.operador = buttonkey;
            return painel;
          }
          TextFieldSingleton.valor =
              TextFieldSingleton.valor / double.parse(painel.text);
          TextFieldSingleton.operador = buttonkey;
          painel.text = TextFieldSingleton.valor.toString();
          TextFieldSingleton.historico.text = painel.text;
          painel.text = '0';
        } else if (TextFieldSingleton.operador == '*') {
          TextFieldSingleton.valor =
              TextFieldSingleton.valor * double.parse(painel.text);
          TextFieldSingleton.operador = buttonkey;
          painel.text = TextFieldSingleton.valor.toString();
          TextFieldSingleton.historico.text = painel.text;
          painel.text = '0';
        } else if (TextFieldSingleton.operador == '-') {
          TextFieldSingleton.valor =
              TextFieldSingleton.valor - double.parse(painel.text);
          TextFieldSingleton.operador = buttonkey;
          painel.text = TextFieldSingleton.valor.toString();
          TextFieldSingleton.historico.text = painel.text;
          painel.text = '0';
        } else if (TextFieldSingleton.operador == '+') {
          TextFieldSingleton.valor =
              TextFieldSingleton.valor + double.parse(painel.text);
          TextFieldSingleton.operador = buttonkey;
          painel.text = TextFieldSingleton.valor.toString();
          TextFieldSingleton.historico.text = painel.text;
          painel.text = '0';
        } else {
          painel.text = '0';
          return painel;
        }
      } else if (buttonkey == '=') {
        if (TextFieldSingleton.operador == '/') {
          if (painel.text == '0') {
            TextFieldSingleton.operador = buttonkey;
            return painel;
          }
          TextFieldSingleton.valor =
              TextFieldSingleton.valor / double.parse(painel.text);
          painel.text = '0';
        } else if (TextFieldSingleton.operador == '*') {
          TextFieldSingleton.valor =
              TextFieldSingleton.valor * double.parse(painel.text);
          painel.text = '0';
        } else if (TextFieldSingleton.operador == '-') {
          TextFieldSingleton.valor =
              TextFieldSingleton.valor - double.parse(painel.text);
          painel.text = '0';
        } else if (TextFieldSingleton.operador == '+') {
          TextFieldSingleton.valor =
              TextFieldSingleton.valor + double.parse(painel.text);
          painel.text = '0';
        } else {
          painel.text = '0';
          return painel;
        }
      } else {
        painel.text = '0';
        return painel;
      }
    }
    painel.text = '0';
    return painel;
  }
}
