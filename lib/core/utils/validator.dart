import 'package:flutter/material.dart';

class Validator {
  static String? validatePhoneNumber(String value) {
    if (value.isEmpty) return 'Phone number is required';
    if (!RegExp(r'^\+?[0-9]{10,13}$').hasMatch(value)) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) return 'Password is required';
    if (value.length != 6) return 'Password must be 6 digits';
    return null;
  }

  static String? validateEmail(String value) {
    if (value.isEmpty) return 'Email is required';
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  static String? validateName(String value) {
    if (value.isEmpty) return 'Name is required';
    if (value.length < 2) return 'Name is too short';
    if (value.length > 50) return 'Name is too long';
    return null;
  }

  static String? validateAge(String value) {
    if (value.isEmpty) return 'Age is required';
    return null;
  }

  static String? validateNotes(String value) {
    if (value.trim().isEmpty) return 'Notes cannot be empty';
    if (value.length < 10) return 'Notes must be at least 10 characters';
    if (value.length > 120) return 'Notes must be under 300 characters';
    return null;
  }

  static bool validate(GlobalKey<FormState> formKey, VoidCallback onSuccess) {
    final isValid = formKey.currentState?.validate() ?? false;
    if (isValid) {
      onSuccess();
    }
    return isValid;
  }
}
