import 'package:flutter/material.dart';

class ColorButton extends StatelessWidget {
  final String? title;
  ColorButton(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Theme.of(context).primaryColor),
      child: Center(
          child: Text(
        title!.toUpperCase(),
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
            fontSize: 15,
            letterSpacing: 2,
            color: Colors.white,
            fontWeight: FontWeight.bold),
      )),
    );
  }
}

class ColorButtonS extends StatelessWidget {
  final String? title;
  ColorButtonS(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Theme.of(context).primaryColor),
      child: Center(
          child: Text(
        title!,
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
            fontSize: 13.5,
            letterSpacing: 2,
            color: Colors.white,
            fontWeight: FontWeight.bold),
      )),
    );
  }
}
