import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_post/core/viewmodel/home_vm.dart';
import 'package:flutter_post/utils/colors.dart';
import 'package:flutter_post/utils/margin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RequestSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = context.watch<HomeViewModel>();

    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: darkGrey,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'REQUEST',
                style: GoogleFonts.cabin(
                  color: black,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const YMargin(20),
          Row(
            children: [
              Flexible(
                flex: 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    color: Color(0xff2A2C2C),
                    padding: EdgeInsets.all(15),
                    width: 80,
                    child: Column(
                      children: [
                        PopupMenuButton(
                          child: Text(
                            provider?.selectedRequestType ?? '',
                            style: GoogleFonts.cabin(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          itemBuilder: (_) => <PopupMenuItem<String>>[
                            for (var item in provider.requestTypes)
                              new PopupMenuItem<String>(
                                child: Text(
                                  '$item',
                                  style: GoogleFonts.cabin(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                value: '$item',
                              ),
                          ],
                          onSelected: (_) {
                            provider.selectedRequestType = _;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Spacer(),
              Flexible(
                flex: 35,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Container(
                    color: Color(0xFF2A2C2C),
                    child: Container(
                      height: 45,
                      child: TextFormField(
                        validator: (value) {
                          if (value.isNotEmpty &&
                              value.length >= 1 &&
                              value.contains('http')) {
                            return null;
                          } else if (value.isEmpty) {
                            return "This field can't be left empty";
                          } else {
                            return "Please enter a valid URL";
                          }
                        },
                        controller: provider.urlTEC,
                        keyboardType: TextInputType.phone,
                        style: TextStyle(
                            fontWeight: FontWeight.w200,
                            fontSize: 14,
                            color: Colors.white),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 15),
                            filled: true,
                            fillColor: Color(0xFF2A2C2C),
                            hintText: ''),
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Container(
                  height: 45,
                  width: 80,
                  child: FlatButton(
                    color: primary,
                    onPressed: () {
                      provider.sendREQ();
                    },
                    child: Text(
                      'Send',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
