import 'package:dynamic_form/src/model.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NeumorphicTextField extends StatelessWidget {
  final double? width;
  final double? height;
  final String? type;
  final String? label;
  final Function(String) onChanged;

  const NeumorphicTextField(
      {super.key,
      this.height,
      this.width,
      this.label,
      this.type,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Neumorphic(
          style: const NeumorphicStyle(
              depth: -10,
              border: NeumorphicBorder(
                color: Color.fromARGB(12, 0, 0, 0),
                width: 0.8,
              )),
          child: TextFormField(
            decoration: InputDecoration(
                fillColor: Colors.transparent,
                filled: true,
                labelStyle: TextStyle(color: Colors.grey.withOpacity(0.4)),
                labelText: label,
                border: InputBorder.none),
            onChanged: onChanged,
            keyboardType: type == 'email'
                ? TextInputType.emailAddress
                : TextInputType.text,
          ),
        ),
      ),
    );
  }
}
