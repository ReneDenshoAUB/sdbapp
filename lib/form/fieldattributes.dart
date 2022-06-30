import 'package:flutter/cupertino.dart';

class FieldAttributes {
  String? labelText;
  String? supplementalText;
  String? fieldText;
  String? errorText;
  String formType;
  bool? tapped;
  bool tappable;
  bool? tight;
  ValueNotifier? selected;
  TextEditingController? controller;
  List<String>? dropdownArray;

  FieldAttributes({
    this.labelText,
    this.supplementalText,
    this.fieldText,
    this.errorText,
    required this.formType,
    this.tapped,
    required this.tappable,
    this.tight,
    this.selected,
    this.controller,
    this.dropdownArray,
  });
}
