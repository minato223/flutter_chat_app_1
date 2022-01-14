import 'package:chat_app_1/services/constant.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:video_player/video_player.dart';

class MessageBox extends StatefulWidget {
  const MessageBox({Key? key}) : super(key: key);

  @override
  _MessageBoxState createState() => _MessageBoxState();
}

class _MessageBoxState extends State<MessageBox>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  String videoUrl =
      "https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4";
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  bool looping = false;
  bool autoplay = false;
  bool _isRecording = false;
  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(videoUrl);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 5 / 8,
      autoInitialize: true,
      autoPlay: autoplay,
      looping: looping,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
    );
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 700), vsync: this);
    final _curveAnimation = CurvedAnimation(
        parent: _animationController,
        curve: Curves.ease,
        reverseCurve: Curves.ease);
    _animation = Tween<double>(begin: 60, end: 0).animate(_curveAnimation)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            _isRecording = true;
          });
        }
        if (status == AnimationStatus.dismissed) {
          setState(() {
            _isRecording = false;
          });
        }
      });
  }

  @override
  void dispose() {
    super.dispose();
    _chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          children: [
            header(),
            Expanded(
                child: Container(
              color: MyColors().messageBoxBackGroundColor,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView(
                children: [
                  datePopup(),
                  ...List.generate(
                      5, (index) => message(sender: index % 2 == 0))
                ],
              ),
            )),
            const SizedBox(height: 70)
          ],
        ),
        messageInput(),
      ],
    )));
  }

  Widget header() {
    return Container(
      padding: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                CupertinoIcons.back,
                color: MyColors().greyColor,
              )),
          Expanded(
            child: Text(lorem(words: 1),
                maxLines: 2,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontFamily: "Ubuntu",
                    fontWeight: FontWeight.w600,
                    fontSize: 18)),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.list_bullet_below_rectangle,
                color: MyColors().greyColor,
              ))
        ],
      ),
    );
  }

  Widget messageInput() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        recorder(),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
          child: Row(
            children: [
              Expanded(
                  child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  color: MyColors().searchBarColor,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(CupertinoIcons.smiley,
                            color: MyColors().greyColor, size: 24)),
                    const Expanded(
                        child: TextField(
                      style: TextStyle(
                          overflow: TextOverflow.clip,
                          fontFamily: "Ubuntu",
                          fontSize: 17,
                          fontWeight: FontWeight.w300),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Tapoter un message ...",
                          hintStyle: TextStyle(
                              fontFamily: "Ubuntu",
                              fontSize: 17,
                              fontWeight: FontWeight.w300)),
                    )),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 0),
                      child: IconButton(
                          onPressed: () {
                            _isRecording
                                ? _animationController.reverse()
                                : _animationController.forward();
                          },
                          icon: Icon(CupertinoIcons.mic_fill,
                              color: MyColors().greyColor, size: 24)),
                    )
                  ],
                ),
              )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.paperplane,
                      color: MyColors().greyColor,
                    )),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget datePopup() {
    return Chip(
      label: Text(lorem(words: 1),
          maxLines: 2,
          textAlign: TextAlign.center,
          style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              fontFamily: "Ubuntu",
              fontWeight: FontWeight.w600,
              fontSize: 15)),
      backgroundColor: Colors.white,
    );
  }

  Widget message({bool sender = true}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: sender
            ? messageWidgets(sender: sender)
            : messageWidgets(sender: sender).reversed.toList(),
      ),
    );
  }

  List<Widget> messageWidgets({bool sender = true}) {
    return [
      Expanded(flex: 3, child: Container(height: 60)),
      Expanded(
          flex: 17,
          child: messageContent(sender: sender, messages: [
            Text(lorem(paragraphs: 1),
                style: TextStyle(
                    fontFamily: "Ubuntu",
                    height: 1.5,
                    color: sender ? Colors.white : null,
                    fontWeight: FontWeight.w400,
                    fontSize: 16)),
            const SizedBox(height: 7),
            Container(
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/image.png"))),
            ),
            const SizedBox(height: 7),
            FittedBox(
              child: Chewie(
                controller: _chewieController,
              ),
            ),
          ])),
      const Expanded(
          flex: 3,
          child: SizedBox(
              height: 60,
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/user.png'),
              )))
    ];
  }

  Widget messageContent({bool sender = true, List<Widget>? messages}) {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
      margin: sender
          ? const EdgeInsets.fromLTRB(0, 10, 5, 0)
          : const EdgeInsets.fromLTRB(5, 10, 0, 0),
      decoration: BoxDecoration(
          color: sender ? MyColors().activeColor : Colors.white,
          borderRadius: BorderRadius.circular(7)),
      child: Column(
        children: messages!,
      ),
    );
  }

  Widget recorder() {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Row(
          children: [
            const Expanded(child: SizedBox()),
            Transform.translate(
              offset: Offset(_animation.value, 0),
              child: Opacity(
                opacity: _animationController.value,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin: const EdgeInsets.only(bottom: 10, right: 60),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: MyColors().greyColor.withOpacity(0.6),
                            offset: Offset.zero,
                            blurRadius: 10,
                            spreadRadius: 1)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  alignment: Alignment.centerRight,
                  child: Row(
                    children: [
                      Text("00:03",
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontFamily: "Ubuntu",
                              color: MyColors().greyColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 22)),
                      IconButton(
                          onPressed: () {
                            print("oki");
                          },
                          icon: const Icon(
                            CupertinoIcons.trash,
                            color: Colors.red,
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
      child: widget,
    );
  }
}
