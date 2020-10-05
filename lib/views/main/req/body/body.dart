import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
class ReqBody extends StatefulHookWidget {
  ReqBody({Key key}) : super(key: key);

  @override
  _ReqBodyState createState() => _ReqBodyState();
}

class _ReqBodyState extends State<ReqBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: TextField(
            maxLines: null,
            minLines: 10,
            keyboardType: TextInputType.multiline,
            style: TextStyle(
                fontWeight: FontWeight.w200, fontSize: 14, color: Colors.white),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.all(25),
                filled: true,
                fillColor: Color(0xFF2A2C2C),
                hintText: ''),
          ),
        ),
      ],
    );
  }
}
