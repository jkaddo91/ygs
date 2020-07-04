import 'package:flutter/material.dart';

class YgsPasswordFormField extends StatefulWidget {
  final String hintText;
  final void Function(String) onChanged;
  final String Function(String) validator;

  const YgsPasswordFormField({
    @required this.hintText,
    @required this.onChanged,
    this.validator,
  });

   @override
  _YgsPasswordFormFieldState createState() => _YgsPasswordFormFieldState();
}

class _YgsPasswordFormFieldState extends State<YgsPasswordFormField> {
 
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: 350,
      child: TextFormField(
        obscureText: _obscureText,
        onChanged: widget.onChanged,
        validator: widget.validator,
        decoration: InputDecoration(
          hintText:  widget.hintText,
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              semanticLabel: _obscureText ? 'show password' : 'hide password',
            ),
          ),
        ),
      ),
    );
  }

}


