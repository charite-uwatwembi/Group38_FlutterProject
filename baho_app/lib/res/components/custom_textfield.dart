import 'package:flutter/material.dart';

class CustomTextfield extends StatefulWidget {
  final String hint;
  final TextEditingController? textController;
  final bool obscureText; // Add this parameter

  const CustomTextfield({
    super.key,
    required this.hint,
    this.textController,
    this.obscureText = false, // Default to false for non-password fields
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.textController,
      obscureText: _obscureText, // Use the obscureText state
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: widget.hint,
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
    );
  }
}
