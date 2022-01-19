// ignore_for_file: must_call_super

import 'package:chat_app_1/models/page.dart';
import 'package:chat_app_1/screens/camera/camera.dart';
import 'package:chat_app_1/screens/groups/groupe.dart';
import 'package:chat_app_1/screens/settings/setting.dart';
import 'package:chat_app_1/services/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_app_1/screens/messages/message.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int _currentPage = 0;
  late PageController _controller;
  final List<MyPage> _pages = [
    MyPage(
        id: 0,
        icon: CupertinoIcons.bubble_left_bubble_right,
        page: const Message()),
    MyPage(id: 1, icon: CupertinoIcons.person_2_alt, page: const Groupe()),
    MyPage(id: 2, icon: CupertinoIcons.camera, page: const Camera()),
    MyPage(id: 3, icon: CupertinoIcons.settings, page: const Setting())
  ];
  @override
  void initState() {
    super.initState();
    _controller = PageController(
      initialPage: 0,
    );
    _controller.addListener(() {
      int page = _controller.page!.floor();
      if (_currentPage != page) setState(() => _currentPage = page);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          height: 70,
          decoration: BoxDecoration(
              border:
                  Border(top: BorderSide(color: MyColors().navBorderColor))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _pages
                .map((page) => IconButton(
                      enableFeedback: false,
                      onPressed: () {
                        setState(() => _currentPage = page.id);
                        _controller.animateToPage(_currentPage,
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.ease);
                      },
                      icon: Icon(
                        page.icon,
                        color: _currentPage == page.id
                            ? MyColors().activeColor
                            : MyColors().greyColor,
                        size: 30,
                      ),
                    ))
                .toList(),
          ),
        ),
        body: PageView.builder(
          controller: _controller,
          itemCount: _pages.length,
          itemBuilder: (context, index) => _pages[index].page,
        ));
  }
}
