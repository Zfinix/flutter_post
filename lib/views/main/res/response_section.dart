import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_post/core/viewmodel/home_vm.dart';
import 'package:flutter_post/utils/colors.dart';
import 'package:flutter_post/utils/margin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'response.dart';


class ResponseSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = context.watch<HomeViewModel>();

    return Container(
      padding: EdgeInsets.all(20),
        color: darkGrey,
     
      // height: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Text(
                'RESPONSE',
                style: GoogleFonts.cabin(
                  color: black,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const XMargin(40),
              if (provider?.responseCode != null &&
                  provider.responseCode.isNotEmpty)
                Container(
                  color: Colors.blueGrey[900],
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: Row(
                    children: [
                      Text(
                        'STATUS    ',
                        style: GoogleFonts.cabin(
                          color: grey,
                          fontSize: 10,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      Text(
                        provider?.responseCode ?? '',
                        style: GoogleFonts.cabin(
                          color: provider?.responseCode != null &&
                                  provider.responseCode.isNotEmpty &&
                                  int.parse(provider?.responseCode) >= 400
                              ? Colors.red
                              : provider?.responseCode != null &&
                                      provider.responseCode.isNotEmpty &&
                                      int.parse(provider?.responseCode) >=
                                          200 &&
                                      int.parse(provider?.responseCode) < 300
                                  ? Colors.green
                                  : Colors.blue,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                )
            ],
          ),
          const YMargin(10),
          Divider(),
          Response(),
          const YMargin(20),
        ],
      ),
    );
  }
}
