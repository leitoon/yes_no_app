

import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier
{
  final GetYesNoAnswer getYesNoAnswer= GetYesNoAnswer();
  final ScrollController chatScrollController= ScrollController();
  List<Message> messageList = [
    
  ];

  Future<void> sendMessage (String text) async {
    if(text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);
    if(text.endsWith('?')){
       herReply();
    }
    notifyListeners();
    WidgetsBinding.instance.addPostFrameCallback(
      (_){
          moveScrollToBottom();
      }
    );
 
  }
  Future<void> herReply() async
  {
    final herMessage= await getYesNoAnswer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();
    WidgetsBinding.instance.addPostFrameCallback(
      (_){
          moveScrollToBottom();
      }
    );
  }

  void moveScrollToBottom(){
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 300), 
      curve: Curves.easeOut);
  }
}