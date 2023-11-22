import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:groupchat_clean_architecture/configuration/theme/app_strings.dart';
import 'package:groupchat_clean_architecture/configuration/theme/app_theme.dart';

class SingleChatScreen extends StatefulWidget {
  const SingleChatScreen({super.key});

  @override
  State<SingleChatScreen> createState() => _SingleChatScreenState();
}

class _SingleChatScreenState extends State<SingleChatScreen> {
  String messageContent = "";
  final TextEditingController _messageController = TextEditingController();

  ScrollController _scrollController = ScrollController();

  bool _isTextFieldEmpty = true;
  bool _isRecording = false;

  bool _changeKeyboardType = false;
  int _menuIndex = 0;

  @override
  void dispose() {
    // TODO: implement dispose
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              print('rahul');
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        backgroundColor: AppColors.greenColor,
        title: const Text(AppStrings.strAppName),
      ),
      body: Column(
        children: [
          Expanded(child: Container()),
          _inputMessageTextField(),
        ],
      ),
    );
  }

  Widget _singleChatScreen() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return Container();
      },
    );
  }

  Widget _inputMessageTextField() {
    return Container(
      margin: const EdgeInsets.only(bottom: 10, left: 4, right: 4),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(80)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.2),
                      offset: const Offset(0.0, 0.50),
                      spreadRadius: 1,
                      blurRadius: 1,
                    )
                  ]),
              child: Row(
                children: [
                  const Gap(10),
                  const Icon(Icons.insert_emoticon),
                  const Gap(5),
                  Expanded(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxHeight: 60),
                      child: Scrollbar(
                        child: TextField(
                          style: const TextStyle(fontSize: 14),
                          controller: _messageController,
                          maxLines: null,
                          onChanged: (value) {
                            setState(() {
                              _isTextFieldEmpty = value.isEmpty;
                            });
                          },
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: AppStrings.strTypeYourMessageHere),
                        ),
                      ),
                    ),
                  ),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 1),
                    child:
                        _isTextFieldEmpty ? AnimatedAlign(duration: Duration(milliseconds: 300),alignment: Alignment.topRight,child:_linkCameraWidget()) : _linkWidget(),
                  ),
                ],
              ),
            ),
          ),

          const Gap(5),

          /// mice Button
          _isTextFieldEmpty
              ? CircleAvatar(
                  maxRadius: 25,
                  child: AnimatedContainer(
                      curve: Curves.easeInOutBack,
                      duration: const Duration(milliseconds: 300),
                      child: const Icon(Icons.mic)),
                )
              : CircleAvatar(
                  maxRadius: 25,
                  child: AnimatedContainer(

                      curve: Curves.easeIn,
                      duration: const Duration(milliseconds: 300),
                      child: const Icon(Icons.send)))
        ],
      ),
    );
  }

  Widget _linkWidget() {
    return const Row(
      children: [
        Icon(Icons.link),
        Gap(10),
      ],
    );
  }

  Widget _linkCameraWidget() {
    return const Row(
      children: [
        Icon(Icons.link),
        Gap(10),
        Icon(Icons.camera_alt),
        Gap(10),
      ],
    );
  }
}
