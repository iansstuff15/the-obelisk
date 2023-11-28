import 'package:flutter/material.dart';

String? validateInput({required String value, required TextInputType type}) {
  if (value.isEmpty) {
    return 'Please enter a value.';
  }
  if (type == TextInputType.emailAddress) {
    if (!value.contains("@")) {
      return "Enter a valid email address.";
    }
  }

  if (type == TextInputType.visiblePassword) {
    if (value.length < 8) {
      return "Password is too short.";
    }

    bool hasUpperCase = false;
    bool hasLowerCase = false;
    bool hasSymbol = false;
    bool hasNumber = false;

    for (var char in value.runes) {
      if (isUpperCaseChar(char)) {
        hasUpperCase = true;
      } else if (isLowerCaseChar(char)) {
        hasLowerCase = true;
      } else if (isSymbolChar(char)) {
        hasSymbol = true;
      } else if (isDigitChar(char)) {
        hasNumber = true;
      }
    }

    if (!hasUpperCase) {
      return "Password must contain at least one uppercase letter.";
    }

    if (!hasLowerCase) {
      return "Password must contain at least one lowercase letter.";
    }

    if (!hasSymbol) {
      return "Password must contain at least one symbol.";
    }

    if (!hasNumber) {
      return "Password must contain at least one number.";
    }

    return null; // Return null if all criteria are met
  }

  return null; // Return null if the input is valid
}

bool isUpperCaseChar(int char) {
  return (char >= 65 && char <= 90); // ASCII range for uppercase letters
}

bool isLowerCaseChar(int char) {
  return (char >= 97 && char <= 122); // ASCII range for lowercase letters
}

bool isSymbolChar(int char) {
  // Define your own symbol range or set of symbols to check
  return (char >= 33 && char <= 47) ||
      (char >= 58 && char <= 64) ||
      (char >= 91 && char <= 96) ||
      (char >= 123 && char <= 126);
}

bool isDigitChar(int char) {
  return (char >= 48 && char <= 57); // ASCII range for digits (0-9)
}
