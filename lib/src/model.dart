// To parse this JSON data, do
//
//     final formModel = formModelFromJson(jsonString);

import 'dart:convert';

FormModel formModelFromJson(String str) => FormModel.fromJson(json.decode(str));

String formModelToJson(FormModel data) => json.encode(data.toJson());

class FormModel {
  String? title;
  String? model;
  List<Field>? fields;

  FormModel({
    this.title,
    this.model,
    this.fields,
  });

  factory FormModel.fromJson(Map<String, dynamic> json) => FormModel(
        title: json["title"],
        model: json["model"],
        fields: json["fields"] == null
            ? []
            : List<Field>.from(json["fields"]!.map((x) => Field.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "model": model,
        "fields": fields == null
            ? []
            : List<dynamic>.from(fields!.map((x) => x.toJson())),
      };
}

class Field {
  String? name;
  String? type;
  String? label;
  bool? required;
  List<String>? options;

  Field({
    this.name,
    this.type,
    this.label,
    this.required,
    this.options,
  });

  factory Field.fromJson(Map<String, dynamic> json) => Field(
        name: json["name"],
        type: json["type"],
        label: json["label"],
        required: json["required"],
        options: json["options"] == null
            ? []
            : List<String>.from(json["options"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "label": label,
        "required": required,
        "options":
            options == null ? [] : List<dynamic>.from(options!.map((x) => x)),
      };
}
