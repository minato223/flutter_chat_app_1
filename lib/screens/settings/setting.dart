// ignore_for_file: prefer_final_fields

import 'package:chat_app_1/services/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  List<TileItem> _tileList = [
    TileItem(icon: CupertinoIcons.pen, text: "Edit Profile"),
    TileItem(
        icon: CupertinoIcons.bubble_left_bubble_right_fill,
        text: "Chat Settings"),
    TileItem(icon: CupertinoIcons.bell_fill, text: "Notification Settings"),
    TileItem(
        icon: CupertinoIcons.rectangle_stack_fill_badge_person_crop,
        text: "Storage Settings"),
    TileItem(icon: CupertinoIcons.color_filter, text: "Theme Settings"),
    TileItem(icon: CupertinoIcons.question_circle_fill, text: "Help"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors().messageBoxBackGroundColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: ListView(
          children: [
            header(),
            ..._tileList
                .map((tile) =>
                    sectionItemTile(icon: tile.icon!, text: tile.text!))
                .toList()
          ],
        ),
      )),
    );
  }

  Widget header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.barcode_viewfinder,
                color: MyColors().activeColor)),
        IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.circle_grid_hex,
                color: MyColors().activeColor))
      ],
    );
  }

  Widget profil() {
    return Card(
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/user.png'),
            radius: 80,
          )
        ],
      ),
    );
  }

  Widget sectionItemTile(
      {String text = "Edit Profile", IconData icon = CupertinoIcons.pen}) {
    return InkWell(
      onTap: () {},
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            children: [
              Container(
                height: 40,
                width: 40,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    color: MyColors().activeColor,
                    borderRadius: BorderRadius.circular(7)),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 25,
                ),
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(text,
                      style: const TextStyle(
                          fontFamily: "Ubuntu",
                          fontWeight: FontWeight.w600,
                          fontSize: 17)),
                  const SizedBox(height: 5),
                  Text(lorem(paragraphs: 1),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: "Ubuntu",
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: MyColors().greyColor))
                ],
              )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.forward,
                    color: MyColors().greyColor,
                    size: 20,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class TileItem {
  String? text;
  IconData? icon;
  TileItem({this.text, this.icon});
}
