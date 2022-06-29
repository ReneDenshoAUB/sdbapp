import 'package:flutter/material.dart';
import 'package:sdbapp/form/customdropdown.dart';
import 'fieldattributes.dart';
import 'customdropdown.dart';
import 'fields.dart';

class FormAndLabel extends StatefulWidget {
  List<FieldAttributes> fieldAttributes;

  FormAndLabel({
    Key? key,
    required this.fieldAttributes,
  }) : super(key: key);

  @override
  State<FormAndLabel> createState() => _FormAndLabelState();
}

class _FormAndLabelState extends State<FormAndLabel> {
  bool checkIfDropdown() {
    var contains =
        widget.fieldAttributes.where((element) => element.formType == 'Dropdown');
    if (contains.isEmpty) {
      return false;
    }
    return true;
  }

  bool checkIfTight() {
    var contains =
        widget.fieldAttributes.where((element) => element.tight == true);
    if (contains.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    double formWidth = ((MediaQuery.of(context).size.width * 0.94) /
            (widget.fieldAttributes).length) -
        (MediaQuery.of(context).size.width * 0.02);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //============      Label Text      ==================
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: (widget.fieldAttributes)
              .map((field) => SizedBox(
                    width: formWidth,
                    child: (field.labelText == null)
                        ? null
                        : Text(
                            '${field.labelText}',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.03),
                          ),
                  ))
              .toList(),
        ),
        //============   Supplemental Text  ==================
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: (widget.fieldAttributes)
              .map((field) => SizedBox(
                    width: formWidth,
                    child: (field.supplementalText == null)
                        ? null
                        : Text(
                            '${field.supplementalText}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(
                                    fontFamily: (field.supplementalText == null)
                                        ? null
                                        : 'Gilroy',
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.015),
                          ),
                  ))
              .toList(),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.003),
        //============      FormField       ==================
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: (widget.fieldAttributes)
              .map((fAttr) => Field(
                  fieldAttributes: fAttr,
                  numOfRows: widget.fieldAttributes.length,
                  isTapped: () {
                    setState(() {
                      fAttr.tapped = !(fAttr.tapped!);
                      print('${fAttr.labelText} and ${fAttr.tapped}');
                    });
                  }))
              .toList(),
        ),

        //============  Dropdown, if any   ==================
        (checkIfDropdown())
            ? SizedBox(
                width: MediaQuery.of(context).size.width * 0.94,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: (widget.fieldAttributes)
                      .map((fAttr) => CustomDropdown(
                          fieldAttributes: fAttr,
                          numOfRows: widget.fieldAttributes.length,
                          ))
                      .toList(),
                ),
              )
            : const SizedBox.shrink(),

        (checkIfTight()) 
        ? SizedBox(height: MediaQuery.of(context).size.height * 0.02) 
        : SizedBox(height: MediaQuery.of(context).size.height * 0.05),
      ],
    );
  }
}
