import 'package:flutter/material.dart';
import 'package:sdbapp/form/leasescreen1.dart';

class FieldAndLabel extends StatefulWidget {
  var parent;
  String fieldType;
  String? title;
  String? subtitle;
  String? fieldText;
  String? errorText;
  String? hintText;
  bool? opened;
  TextEditingController? textController;
  List? dropdownList;
  String? valueToChange;

  FieldAndLabel({
    Key? key,
    required this.parent,
    required this.fieldType,
    this.title,
    this.subtitle,
    this.fieldText,
    this.errorText,
    this.hintText,
    this.opened,
    this.textController,
    this.dropdownList,
    this.valueToChange,
  }) : super(key: key);

  @override
  State<FieldAndLabel> createState() => _FieldAndLabelState();
}

class _FieldAndLabelState extends State<FieldAndLabel> {
  static Size screenSize = WidgetsBinding.instance.window.physicalSize;
  double screenWidth = screenSize.width;
  double screenHeight = screenSize.height;

  Widget buildField() {
    switch (widget.fieldType) {
      case 'Disabled':
        return Container(
          decoration: BoxDecoration(
            color: const Color(0xffd7dcdd),
            borderRadius: BorderRadius.circular(10.0),
          ),
          alignment: Alignment.centerLeft,
          height: screenHeight * 0.02,
          padding: const EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
          child: Text(
            widget.fieldText!,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(fontSize: screenHeight * 0.0085),
          ),
        );

      case 'TextField':
        return Container(
          height: screenHeight * 0.02,
          decoration: BoxDecoration(
            color: const Color(0xffeae0d6),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: (widget.valueToChange == 'branch')
                  ? const Icon(Icons.search)
                  : const Icon(Icons.text_fields),
              hintText: widget.hintText,
            ),
            onTap: (widget.fieldType == 'DropdownSearch')
                ? () => widget.parent
                    .toggleVisibility(widget.valueToChange, 'textfield')
                : () {},
            onChanged: (widget.fieldType == 'DropdownSearch')
                ? (text) => widget.parent.resetSize(text)
                : (text) {},
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(fontSize: screenHeight * 0.0085),
            controller: widget.textController,
          ),
        );
      case 'DropdownSearch':
        return Container(
          height: screenHeight * 0.02,
          decoration: BoxDecoration(
            color: const Color(0xffeae0d6),
            borderRadius: BorderRadius.circular(10.0),
          ),
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Flexible(
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: (widget.valueToChange == 'branch')
                        ? const Icon(Icons.search)
                        : const Icon(Icons.text_fields),
                    hintText: widget.hintText,
                  ),
                  onTap: () => widget.parent.toggleVisibility(widget.valueToChange, 'textfield'),
                  onChanged: (text) => widget.parent.resetSize(text),
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontSize: screenHeight * 0.0085),
                  controller: widget.textController,
                ),
              ),
              GestureDetector(
                onTap: () => widget.parent
                    .toggleVisibility(widget.valueToChange, 'dropdown'),
                child: Container(
                    padding: EdgeInsets.fromLTRB(
                        screenWidth * 0.03, 0, screenWidth * 0.01, 0),
                    decoration: const BoxDecoration(color: Color(0xffeae0d6)),
                    child: Icon(
                      Icons.arrow_drop_down,
                      size: screenHeight * 0.017,
                    )),
              )
            ],
          ),
        );

      case 'Dropdown':
        return GestureDetector(
          onTap: () =>
              widget.parent.toggleVisibility(widget.valueToChange, 'dropdown'),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xffeae0d6),
              borderRadius: BorderRadius.circular(10.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            height: screenHeight * 0.02,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    widget.fieldText!,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontSize: screenHeight * 0.0085),
                  ),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  size: screenHeight * 0.017,
                )
              ],
            ),
          ),
        );

      default:
        return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Title
        (widget.title != null)
            ? Text(
                widget.title!,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontSize: screenHeight * 0.015),
              )
            : const SizedBox.shrink(),

        //Subtitle
        (widget.subtitle != null)
            ? Text(
                widget.subtitle!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontSize: screenHeight * 0.0075),
              )
            : const SizedBox.shrink(),

        //Error text
        (widget.errorText != null)
            ? Text(
                widget.errorText!,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                    fontSize: screenHeight * 0.0075, color: const Color(0xffc93033)),
              )
            : const SizedBox.shrink(),

        //Field
        buildField(),
        SizedBox(
          height: screenHeight * 0.005,
        ),

        //Dropdown
        (widget.fieldType == 'DropdownSearch' || widget.fieldType == 'Dropdown')
            ? Visibility(
                visible: widget.opened!,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 224, 214, 204),
                      ),
                      BoxShadow(
                        color: Color(0xffeae0d6),
                        spreadRadius: -7.0,
                        blurRadius: 7.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  height: (widget.dropdownList!.length > 4)
                      ? 240.0
                      : widget.dropdownList!.length * 67,
                  child: Scrollbar(
                    thickness: 10.0,
                    radius: const Radius.circular(10.0),
                    interactive: true,
                    child: ListView.separated(
                        itemCount: widget.dropdownList!.length,
                        separatorBuilder: (context, index) => const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 15.0),
                              child: Divider(
                                thickness: 3.0,
                              ),
                            ),
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              widget.parent.updateSelected(widget.valueToChange,
                                  widget.dropdownList![index]);
                              widget.parent.toggleVisibility(
                                  widget.valueToChange, 'dropdown');

                              if (widget.valueToChange == 'branch') {
                                widget.parent.readFromFirestore(
                                    (widget.dropdownList![index]).substring(6));
                              }
                            },
                            title: Text(
                              widget.dropdownList![index],
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(fontSize: screenHeight * 0.0085),
                            ),
                          );
                        }),
                  ),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
