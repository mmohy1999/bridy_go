import 'package:flutter/material.dart';
//ignore: must_be_immutable
class EditText extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  ValueChanged<String>? onChanged;
  bool isPassword=false;
  IconData? suffixIcon;
  final VoidCallback? suffixIconClick;
  TextInputType? keyboardType=TextInputType.text;

  EditText({required this.labelText, required this.hintText,
    required this.controller,
    this.onChanged,this.suffixIconClick,
    this.suffixIcon, this.validator
    ,this.keyboardType,this.isPassword= false,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          labelText!,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: Colors.black, fontSize: 13.5, fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          keyboardType: keyboardType,
          onChanged: onChanged,
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: Colors.grey),
          obscureText: isPassword,
          decoration: InputDecoration(
            isDense: true,
            suffixIcon: suffixIcon!=null
                ?  IconButton(icon: Icon(suffixIcon, color: Colors.grey), onPressed:suffixIconClick,)
                : null,
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[300]!)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey[300]!)),
            hintText: hintText,
            hintStyle: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(fontSize: 13.5, fontWeight: FontWeight.w500),
          ),
          controller: controller,
          validator:validator ,

        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
