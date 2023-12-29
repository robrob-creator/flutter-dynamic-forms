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
  String? type;
  String? label;
  String? id;

  Field({
    this.type,
    this.label,
    this.id,
  });

  factory Field.fromJson(Map<String, dynamic> json) => Field(
        type: json["type"],
        label: json["label"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "label": label,
        "id": id,
      };
}
