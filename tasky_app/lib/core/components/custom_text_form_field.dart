import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.title,
    required this.hintText,
    required this.controller,
    this.validator,
    this.maxLines
    });

    final String title;
    final String hintText;
    final TextEditingController controller;
    final Function(String?)? validator;
    final int? maxLines ;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
              title,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: controller,
              style: Theme.of(context).textTheme.displayMedium,
              maxLines: maxLines ?? 1,
              decoration: InputDecoration(
                hintText: hintText,
              ),
              validator: (value)=>validator == null? null : validator!(value),
            ),
      ],
    );
  }
}