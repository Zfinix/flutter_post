import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_post/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_post/services/provider_registrar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RequestSection extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var provider = useProvider(homeVM);

    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardBg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Flexible(
                flex: 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: Container(
                    color: Color(0xff2A2C2C),
                    padding: EdgeInsets.all(15),
                    width: 80,
                    height: 45,
                    child: Column(
                      children: [
                        PopupMenuButton(
                          child: Text(
                            provider?.selectedRequestType ?? '',
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          itemBuilder: (_) => <PopupMenuItem<String>>[
                            for (var item in provider.requestTypes)
                              new PopupMenuItem<String>(
                                child: Text(
                                  '$item',
                                  style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontSize: 11,
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
                flex: 34,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(2),
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
                        style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                                color: Colors.white)),
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
                borderRadius: BorderRadius.circular(2),
                child: Container(
                  height: 40,
                  width: 80,
                  child: FlatButton(
                    color: primary,
                    onPressed: () {
                      provider.sendREQ();
                    },
                    child: Text(
                      'SEND',
                      style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 11,
                                color: Colors.white)),
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
