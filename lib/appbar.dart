import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends PreferredSize {
  String demo;
  Color col;

  CustomAppbar(this.demo, this.col);

  @override
  Size get preferredSize => Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        "$demo",
        style: TextStyle(color: col),
      )),
    );
  }
}
