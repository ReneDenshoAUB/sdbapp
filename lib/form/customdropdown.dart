import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sdbapp/form/fieldattributes.dart';
import 'fieldattributes.dart';

class CustomDropdown extends StatefulWidget {
  FieldAttributes fieldAttributes;
  int numOfRows;

  CustomDropdown({
    Key? key,
    required this.fieldAttributes,
    required this.numOfRows,
  }) : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {

  


  @override
  Widget build(BuildContext context) {
    double dropdownHeight(){
      if (widget.fieldAttributes.dropdownArray!.length > 4) {
        return MediaQuery.of(context).size.height * 0.2;
      } else {
        return MediaQuery.of(context).size.height * 0.055 * widget.fieldAttributes.dropdownArray!.length;
      }
    }

    double formWidth = (widget.numOfRows == 1)
        ? (MediaQuery.of(context).size.width * 0.9375)
        : ((MediaQuery.of(context).size.width * 0.94) / widget.numOfRows) -
            (MediaQuery.of(context).size.width * 0.02);

    return (widget.fieldAttributes.tappable)
        ? Visibility(
            visible: widget.fieldAttributes.tapped!,
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.005,),
                Material(
                    elevation: 8.0,
                    borderRadius: BorderRadius.circular(10),
                    color: (widget.fieldAttributes.formType == 'Dropdown')
                        ? const Color(0xffeae0d6)
                        : null,
                    child: SizedBox(
                      height: dropdownHeight(),
                      width: formWidth,
                      child: CupertinoScrollbar(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: widget.fieldAttributes.dropdownArray!.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8.0),
                              padding: const EdgeInsets.all(4.0),
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(color: Colors.grey))),
                              child: ListTile(
                                onTap: () {
                                  widget.fieldAttributes.selected!.value = widget.fieldAttributes.dropdownArray![index];
                                  setState(() {
                                    widget.fieldAttributes.tapped = !(widget.fieldAttributes.tapped!);
                                  });
                                },
                                title: Text(widget.fieldAttributes.dropdownArray![index]),
                              ),
                            );
                          }),
                      ),
                    )),
              ],
            ),
          )
        : const SizedBox.shrink();
  }
}
