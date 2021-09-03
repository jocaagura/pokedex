import 'package:flutter/material.dart';

import 'constants.dart';

class Helpers {
  /// [validateUrl] checks if the url has a correct format

  static bool validateUrl(String url) {
    if (url.isEmpty) {
      return false;
    }
    Pattern pattern = r'^https?:\/\/[\w\-]+(\.[\w\-]+)+[/#?]?.*$';
    return RegExp(pattern as String).hasMatch(url);
  }

  /// [validateEmail] checks true if email address have a correct format
  static bool validateEmail(String email) {
    if (email.isEmpty) {
      return false;
    }
    Pattern pattern =
        r'^([a-z0-9-_.])+@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    return RegExp(pattern as String).hasMatch(email);
  }

  /// formating
  /// money format
  /// Return a double number with money format to UI
  static String returnMoneyFormat(String valor, [numberOfdecimalsDigits = 2]) {
    String moneySymbol = "\$";
    String formattedNumber = "";
    double? tmp = double.tryParse(valor);
    if (tmp == null) {
      return '\$0';
    }
    final String integer = tmp.floor().toString();
    int check = 0;
    for (int i = integer.length - 1; i >= 0; i--) {
      if (check != 0 && check % 6 == 0) {
        formattedNumber = "'" + formattedNumber;
      } else if (check != 0 && check % 3 == 0) {
        formattedNumber = "." + formattedNumber;
      }
      check++;
      formattedNumber = integer[i] + formattedNumber;
    }

    if (numberOfdecimalsDigits > 0) {
      return moneySymbol +
          formattedNumber +
          ',' +
          tmp.toStringAsFixed(numberOfdecimalsDigits).split('.')[1];
    }
    return moneySymbol + formattedNumber;
  }

  /// Icon data
  /// returns icondata
  static IconData returnIcondata(String iconFlavor) {
    return kIcons[iconFlavor.toLowerCase()] ?? Icons.warning;
  }

  /// String handlers
  /// return first letter in Uppercase and lowercase all others for each word
  static String capitalizationWords(String phrase) {
    Pattern pattern = r'(\S)+';
    RegExp regExp = RegExp(pattern as String, caseSensitive: false);
    String text = phrase.splitMapJoin(regExp,
        onMatch: (m) {
          String toUppercase = '${m.group(0)}'.substring(0, 1);
          String toLowercase = '${m.group(0)}'.substring(1);
          return toUppercase.toUpperCase() + toLowercase.toLowerCase();
        },
        onNonMatch: (n) => ' ');
    return text.trim();
  }
}
