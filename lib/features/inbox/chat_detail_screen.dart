import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/utils.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  String message = '';
  bool isTyping = false;

  void _onTapOutside() {
    FocusScope.of(context).unfocus();
  }

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(() {
      setState(() {
        message = _textEditingController.text;

        if (message.isNotEmpty) {
          isTyping = true;
        } else {
          isTyping = false;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: Sizes.size8,
          leading: Stack(
            children: [
              const CircleAvatar(
                foregroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/3612017',
                ),
                radius: Sizes.size20,
              ),
              Positioned(
                bottom: -2,
                right: -2,
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                    border: Border.all(width: 2, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          title: const Text(
            '니꼬',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          subtitle: const Text('Active now'),
          trailing: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                FontAwesomeIcons.flag,
                color: Colors.black,
                size: Sizes.size20,
              ),
              Gaps.h32,
              FaIcon(
                FontAwesomeIcons.ellipsis,
                color: Colors.black,
                size: Sizes.size20,
              )
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          GestureDetector(
            onTap: _onTapOutside,
            child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                    vertical: Sizes.size20, horizontal: Sizes.size14),
                itemBuilder: (context, index) {
                  final isMine = index % 2 == 0;
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: isMine
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(Sizes.size14),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(Sizes.size20),
                              topRight: const Radius.circular(Sizes.size20),
                              bottomLeft: Radius.circular(
                                  isMine ? Sizes.size20 : Sizes.size5),
                              bottomRight: Radius.circular(
                                  !isMine ? Sizes.size20 : Sizes.size5),
                            ),
                            color: isMine
                                ? Colors.blue
                                : Theme.of(context).primaryColor),
                        child: const Text(
                          'This is a message',
                          style: TextStyle(
                              color: Colors.white, fontSize: Sizes.size16),
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => Gaps.v10,
                itemCount: 10),
          ),
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: BottomAppBar(
              color: isDark ? null : Colors.grey.shade100,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size20, vertical: Sizes.size12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 40,
                        child: TextField(
                          controller: _textEditingController,
                          keyboardType: TextInputType.visiblePassword,
                          autocorrect: false,
                          textAlignVertical: TextAlignVertical.center,
                          cursorColor: Theme.of(context).primaryColor,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(left: 10),
                            focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(Sizes.size10),
                                ),
                                borderSide:
                                    BorderSide(width: 1, color: Colors.white)),
                            suffixIcon: const Padding(
                              padding: EdgeInsets.only(top: 4),
                              child: FaIcon(
                                FontAwesomeIcons.faceSmile,
                                color: Colors.black,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(Sizes.size10),
                                ),
                                borderSide: BorderSide(
                                    width: 1, color: Colors.grey.shade500)),
                            hintText: 'Send a message...',
                            hintStyle: TextStyle(
                                fontSize: Sizes.size16,
                                color: isDark ? Colors.grey.shade800 : null),
                          ),
                          style: const TextStyle(
                              fontSize: Sizes.size18, color: Colors.black),
                        ),
                      ),
                    ),
                    Gaps.h20,
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: 6, bottom: 10, left: 7, right: 9),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              isTyping ? Colors.yellow : Colors.grey.shade400,
                        ),
                        child: FaIcon(
                          FontAwesomeIcons.solidPaperPlane,
                          color: isTyping ? Colors.green : Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
