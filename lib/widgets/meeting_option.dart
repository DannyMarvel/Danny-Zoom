import 'package:danny_zoom/utils/colors.dart';
import 'package:flutter/material.dart';

class MeetingOption extends StatelessWidget {
  const MeetingOption({
    super.key,
    required this.text,
    required this.isMute,
    required this.onChange,
  });
  final String text;
  final bool isMute;
  final Function(bool) onChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: secondaryBackgroundColor,
      child: Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween, 
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: TextStyle(fontSize: 16),
            ),
          ),
//Switch.adaptive makes it adapt to IOS or Android          
          Switch.adaptive(
            value: isMute, 
            onChanged: onChange,)
        ],
      ),
    );
  }
}
