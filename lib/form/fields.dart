import 'package:flutter/material.dart';
import 'fieldattributes.dart';

class Field extends StatefulWidget {
  FieldAttributes fieldAttributes;
  Function()? isTapped;
  int numOfRows;

  Field({
    Key? key,
    this.isTapped,
    required this.fieldAttributes,
    required this.numOfRows,
  }) : super(key: key);

  @override
  State<Field> createState() => _FieldState();
}

class _FieldState extends State<Field> {

  @override
  Widget build(BuildContext context) {
    Widget whichForm(FieldAttributes fieldAttributes) {
    switch (fieldAttributes.formType) {
      case ('Disabled'):
        return Text(
          '${fieldAttributes.fieldText}',
          style: Theme.of(context)
              .textTheme
              .bodyText2
              ?.copyWith(fontSize: MediaQuery.of(context).size.height * 0.015),
        );

      case ('TextField'):
        return TextFormField(
          controller: widget.fieldAttributes.controller,
          style: Theme.of(context)
              .textTheme
              .bodyText2
              ?.copyWith(fontSize: MediaQuery.of(context).size.height * 0.015),
          decoration: InputDecoration(
            icon: Icon(Icons.text_fields),
            hintStyle: Theme.of(context).textTheme.bodyText2?.copyWith(
                fontSize: MediaQuery.of(context).size.height * 0.015),
          ),
          cursorHeight: MediaQuery.of(context).size.height * 0.015,
        );

      default:
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.fieldAttributes.selected!.value,
              style: Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: MediaQuery.of(context).size.height * 0.015),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
              child: Icon(Icons.arrow_drop_down, size: MediaQuery.of(context).size.height * 0.03,),
            )
          ],
        );
    }
  }

    double formWidth = (widget.numOfRows == 1)
        ? (MediaQuery.of(context).size.width * 0.9375)
        : ((MediaQuery.of(context).size.width * 0.94) / widget.numOfRows) -
            (MediaQuery.of(context).size.width * 0.02);

    return Material(
      borderRadius: BorderRadius.circular(8.0),
      color: (widget.fieldAttributes.tappable)
          ? const Color(0xffeae0d6)
          : const Color(0xffd7dcdd),
      child: InkWell(
        onTap: (widget.fieldAttributes.tappable && (widget.fieldAttributes.formType != 'TextField')) ? (widget.isTapped!) : null,
        child: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
          width: formWidth,
          height: MediaQuery.of(context).size.height * 0.04,
          child: whichForm(widget.fieldAttributes),
        ),
      ),
    );
  }
}
