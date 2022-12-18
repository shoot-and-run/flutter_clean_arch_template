import 'package:flutter/material.dart';

class FormFieldWidget extends StatefulWidget {
  const FormFieldWidget({
    Key? key,
    required this.controller,
    this.isPasswordField = false,
    this.isDescriptionField = false,
    this.labelText = "",
    this.hintText = "",
    this.errorText,
    this.keyboardType = TextInputType.name,
    this.padding,
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool isPasswordField;
  final bool isDescriptionField;
  final String labelText;
  final String hintText;
  final String? errorText;
  final EdgeInsets? padding;

  @override
  State<FormFieldWidget> createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends State<FormFieldWidget> {
  final FocusNode focusNode = FocusNode();

  String hintText = '';
  bool obscureText = false;

  @override
  void initState() {
    super.initState();
    obscureText = widget.isPasswordField;
    hintText = widget.hintText;
    focusNode.addListener(() {
      focusNode.hasFocus ? hintText = '' : hintText = widget.hintText;
      setState(() {});
    });
  }

  @override
  void didUpdateWidget(covariant FormFieldWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    hintText == '' ? hintText = '' : hintText = widget.hintText;
    if (!obscureText) {
      obscureText = widget.isPasswordField;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: widget.padding ?? EdgeInsets.zero,
        child: Stack(
          children: [
            TextFormField(
              minLines: 1,
              maxLines: widget.isDescriptionField ? 10 : 1,
              textInputAction: TextInputAction.next,
              keyboardType: widget.keyboardType,
              key: widget.key,
              controller: widget.controller,
              obscureText: obscureText,
              focusNode: focusNode,
              decoration: InputDecoration(
                errorText: widget.errorText,
                labelText: widget.labelText,
                hintText: widget.hintText,
                disabledBorder: _defaultInputBorder(context),
                enabledBorder: _defaultInputBorder(context),
                focusedBorder: _activeInputBorder(context),
                errorBorder: _errorInputBorder(context),
              ),
            ),
            widget.isPasswordField
                ? Positioned(
              top: 15,
              right: 10,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    if (obscureText == true) {
                      obscureText = false;
                    } else {
                      obscureText = true;
                    }
                  });
                },
                child: Icon(
                  obscureText
                      ? Icons.remove_red_eye
                      : Icons.remove_red_eye_outlined,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            )
                : const SizedBox(height: 0),
          ],
        ),
      ),
    );
  }

  UnderlineInputBorder _defaultInputBorder(BuildContext context) {
    return UnderlineInputBorder(
      borderSide:
      BorderSide(color: Theme.of(context).colorScheme.tertiary, width: 1),
    );
  }

  UnderlineInputBorder _activeInputBorder(BuildContext context) {
    return UnderlineInputBorder(
      borderSide:
      BorderSide(color: Theme.of(context).colorScheme.primary, width: 1),
    );
  }

  UnderlineInputBorder _errorInputBorder(BuildContext context) {
    return UnderlineInputBorder(
      borderSide:
      BorderSide(color: Theme.of(context).colorScheme.error, width: 1),
    );
  }
}
