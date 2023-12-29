// To parse this JSON data, do
//
//     final formModel = formModelFromJson(jsonString);

import 'dart:convert';

FormModel formModelFromJson(String str) => FormModel.fromJson(json.decode(str));

String formModelToJson(FormModel data) => json.encode(data.toJson());

class FormModel {
  String? formTitle;
  String? formModel;
  List<Field>? fields;

  FormModel({
    this.formTitle,
    this.formModel,
    this.fields,
  });

  factory FormModel.fromJson(Map<String, dynamic> json) => FormModel(
        formTitle: json["formTitle"],
        formModel: json["formModel"],
        fields: json["fields"] == null
            ? []
            : List<Field>.from(json["fields"]!.map((x) => Field.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "formTitle": formTitle,
        "formModel": formModel,
        "fields": fields == null
            ? []
            : List<dynamic>.from(fields!.map((x) => x.toJson())),
      };
}

class Field {
  String? fieldType;
  String? fieldName;
  String? fieldLabel;
  bool? isRequired;

  Field({
    this.fieldType,
    this.fieldName,
    this.fieldLabel,
    this.isRequired,
  });

  factory Field.fromJson(Map<String, dynamic> json) => Field(
        fieldType: json["fieldType"],
        fieldName: json["fieldName"],
        fieldLabel: json["fieldLabel"],
        isRequired: json["isRequired"],
      );

  Map<String, dynamic> toJson() => {
        "fieldType": fieldType,
        "fieldName": fieldName,
        "fieldLabel": fieldLabel,
        "isRequired": isRequired,
      };
}
