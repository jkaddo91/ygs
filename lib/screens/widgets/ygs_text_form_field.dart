import 'package:flutter/material.dart';

class YgsTextFormField extends StatefulWidget {
  final String hintText;
  final void Function(String) onChanged;
  final String Function(String) validator;
  final TextInputType keyboardType;

  const YgsTextFormField({
    @required this.hintText,
    @required this.onChanged,
    this.validator,
    this.keyboardType,
  });

   @override
  _YgsTextFormFieldState createState() => _YgsTextFormFieldState();
}

class _YgsTextFormFieldState extends State<YgsTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: 350,
      child: TextFormField(
        onChanged: widget.onChanged,
        validator: widget.validator,
        keyboardType: widget.keyboardType,
        decoration: InputDecoration(
          hintText:  widget.hintText,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
      ),
    );
  }

}


