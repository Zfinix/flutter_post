import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_post/utils/colors.dart';
import 'package:flutter_post/utils/margin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_post/services/provider_registrar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BodySection extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var provider = useProvider(homeVM);

    return Container(
      color: darkGrey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const YMargin(10),
          Divider(),
          const YMargin(20),
          Row(
            children: <Widget>[
              InkWell(
                onTap: () => provider.changeRequestBodyTab(0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('FORM DATA',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              color: provider.selectedRequestIndex == 0
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.4),
                              fontSize: 11,
                              fontWeight: FontWeight.w200),
                        )),
                    const YMargin(10),
                    if (provider.selectedRequestIndex == 0)
                      Container(
                        height: 2,
                        width: 90,
                        color: Colors.amber,
                      )
                  ],
                ),
              ),
              const XMargin(20),
              InkWell(
                onTap: () => provider.changeRequestBodyTab(1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('URL-ENCODED',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              color: provider.selectedRequestIndex == 1
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.4),
                              fontSize: 11,
                              fontWeight: FontWeight.w200),
                        )),
                    const YMargin(10),
                    if (provider.selectedRequestIndex == 1)
                      Container(
                        height: 2,
                        width: 90,
                        color: Colors.amber,
                      )
                  ],
                ),
              ),
              const XMargin(20),
              InkWell(
                onTap: provider.selectedRequestType == 'GET'
                    ? null
                    : () => provider.changeRequestBodyTab(2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('RAW',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              color: provider.selectedRequestIndex == 2
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.4),
                              fontSize: 11,
                              fontWeight: FontWeight.w200),
                        )),
                    const YMargin(10),
                    if (provider.selectedRequestIndex == 2)
                      Container(
                        height: 2,
                        width: 90,
                        color: Colors.amber,
                      )
                  ],
                ),
              ),
            ],
          ),
          Divider(),
          const YMargin(20),
          provider.requestBodyTabs()[provider.selectedRequestIndex]
        ],
      ),
    );
  }
}
