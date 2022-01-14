import 'dart:math';

import 'package:chat_app_1/services/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget searchBar() {
  return Container(
    height: 50,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(60),
      color: MyColors().searchBarColor,
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 5),
          child: Icon(CupertinoIcons.search,
              color: MyColors().greyColor, size: 22),
        ),
        const Expanded(
            child: TextField(
          style: TextStyle(
              fontFamily: "Ubuntu", fontSize: 17, fontWeight: FontWeight.w500),
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Search",
              hintStyle: TextStyle(
                  fontFamily: "Ubuntu",
                  fontSize: 17,
                  fontWeight: FontWeight.w500)),
        ))
      ],
    ),
  );
}

Color generateRandomColor3() {
  Random random = Random();

  return Color.fromARGB(
      255, random.nextInt(256), random.nextInt(256), random.nextInt(256));
}
