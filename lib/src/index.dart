import 'package:dynamic_form/src/atoms/datefield.dart';
import 'package:dynamic_form/src/atoms/textfield.dart';
import 'package:dynamic_form/src/model.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class DynamicForm extends StatelessWidget {
  final FormModel form;
  final BoxDecoration? boxDecoration;
  final double? width;
  final double? height;
  final Function(Map<String, dynamic>) onSubmit;

  const DynamicForm(
      {super.key,
      required this.form,
      this.boxDecoration,
      this.height,
      this.width,
      required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> formValues = {};

    return Material(
      child: Container(
        height: height ?? MediaQuery.of(context).size.height,
        width: width ?? MediaQuery.of(context).size.width,
        decoration: boxDecoration,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              children: [
                ...(form.fields ?? []).map((field) {
                  if (field.fieldType == "date") {
                    return NeumorphicDateField(
                      label: field.fieldLabel,
                      type: field.fieldType,
                      onChanged: (value) {
                        formValues = {
                          ...formValues,
                          field.fieldLabel ?? 'label': value
                        };
                      },
                    );
                  }
                  return NeumorphicTextField(
                    label: field.fieldLabel,
                    type: field.fieldType,
                    onChanged: (value) {
                      formValues = {
                        ...formValues,
                        field.fieldLabel ?? 'label': value
                      };
                    },
                  );
                }).toList(),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                  child: NeumorphicButton(
                      margin: const EdgeInsets.only(top: 12),
                      curve: Curves.bounceInOut,
                      onPressed: () {
                        onSubmit(formValues);
                      },
                      style: NeumorphicStyle(
                        depth: 10,
                        shape: NeumorphicShape.concave,
                        boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(8)),
                      ),
                      padding: const EdgeInsets.all(12.0),
                      child: Center(
                        child: Text(
                          "Submit",
                          style: TextStyle(
                              color: Colors.grey.withOpacity(0.5),
                              fontWeight: FontWeight.w800),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
