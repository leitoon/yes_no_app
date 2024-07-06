

import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
   MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    final textcontroller = TextEditingController();
    final focusNode = FocusNode();
    final outlineIputBorder= UnderlineInputBorder
    (
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40)
    );
    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textcontroller,
      decoration: InputDecoration
      (
        
        hintText: 'End your message with a "?"',
        enabledBorder: outlineIputBorder,
        focusedBorder: outlineIputBorder,
        filled: true,
        suffixIcon: IconButton(
         onPressed: () {
           final textValue = textcontroller.value.text;
           onValue(textValue);

           textcontroller.clear();
         }, 
        icon: Icon( Icons.send_outlined)),
        


      ),
      
      onFieldSubmitted: (value) {
        print('onchange $value');
        textcontroller.clear();
        focusNode.requestFocus();
      },
    );
  }
}