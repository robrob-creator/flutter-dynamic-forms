import 'package:flutter/material.dart';

class FormFieldModel {
  final String type;
  final String label;
  final String id;

  // Additional properties for specific types
  final TextInputType? keyboardType;
  final bool? obscureText;

  FormFieldModel({
    required this.type,
    required this.label,
    required this.id,
    this.keyboardType,
    this.obscureText,
  });

  factory FormFieldModel.fromJson(Map<String, dynamic> json) {
    return FormFieldModel(
      type: json['type'],
      label: json['label'],
      id: json['id'],
      keyboardType: _getKeyboardType(json['type']),
      obscureText: json['type'] == 'password' ? true : null,
    );
  }

  static TextInputType? _getKeyboardType(String type) {
    switch (type) {
      case 'text':
        return TextInputType.text;
      case 'email':
        return TextInputType.emailAddress;
      case 'number':
        return TextInputType.number;
      case 'date':
        return TextInputType.datetime; // You may need a date picker widget here
      // Add more cases for other types as needed
      default:
        return null;
    }
  }
}
