import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NeumorphicDateField extends StatelessWidget {
  final double? width;
  final double? height;
  final String? type;
  final String? label;
  final Function(String) onChanged;

  const NeumorphicDateField(
      {super.key,
      this.height,
      this.width,
      this.label,
      this.type,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final texController = TextEditingController();
    return Material(
      child: GestureDetector(
        onTap: () async {
          DateTime? picked = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2040));
          if (picked != null) {
            onChanged(picked.toIso8601String());
            texController.text = picked.toString();
          }
        },
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
              controller: texController,
              enabled: false,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  filled: true,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: NeumorphicIcon(
                      Icons.calendar_month,
                      curve: Neumorphic.DEFAULT_CURVE,
                      style:
                          NeumorphicStyle(color: Colors.grey.withOpacity(0.5)),
                    ),
                  ),
                  alignLabelWithHint: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  // labelStyle: TextStyle(color: Colors.grey.withOpacity(0.4)),
                  hintText: label,
                  border: InputBorder.none),
              onChanged: onChanged,
              keyboardType: type == 'email'
                  ? TextInputType.emailAddress
                  : TextInputType.text,
            ),
          ),
        ),
      ),
    );
  }
}
