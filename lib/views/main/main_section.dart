import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_post/utils/colors.dart';
import 'package:flutter_post/utils/margin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_post/services/provider_registrar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'req/request_section.dart';
import 'res/response_section.dart';

class MainSection extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var provider = useProvider(homeVM);
    return Container(
      height: screenHeight(context),
      child: ListView(
        padding: EdgeInsets.all(30).add(EdgeInsets.symmetric(horizontal: 30)),
        physics: ClampingScrollPhysics(),
        children: [
          Row(
            children: [
              Text(
                'REQUEST',
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const YMargin(40),
          RequestSection(),
          const YMargin(40),
          Container(
            padding: EdgeInsets.all(20),
            color: cardBg,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const YMargin(10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    children: <Widget>[
                      InkWell(
                        onTap: () => provider.changeRequestTab(0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('HEADERS',
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      color: provider.selectedRequestIndex == 0
                                          ? Colors.white
                                          : Colors.white.withOpacity(0.4),
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700),
                                )),
                            const YMargin(10),
                            if (provider.selectedRequestIndex == 0)
                              Container(height: 2, width: 80, color: primary)
                          ],
                        ),
                      ),
                      const XMargin(20),
                      InkWell(
                        onTap: () => provider.changeRequestTab(1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('URL PARAMS',
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      color: provider.selectedRequestIndex == 1
                                          ? Colors.white
                                          : Colors.white.withOpacity(0.4),
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700),
                                )),
                            const YMargin(10),
                            if (provider.selectedRequestIndex == 1)
                              Container(height: 2, width: 80, color: primary)
                          ],
                        ),
                      ),
                      const XMargin(20),
                      InkWell(
                        onTap: provider.selectedRequestType == 'GET'
                            ? null
                            : () => provider.changeRequestTab(2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('BODY',
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
                                      color: provider.selectedRequestIndex == 2
                                          ? Colors.white
                                          : Colors.white.withOpacity(0.4),
                                      fontSize: 11,
                                      fontWeight: FontWeight.w700),
                                )),
                            const YMargin(10),
                            if (provider.selectedRequestIndex == 2)
                              Container(height: 2, width: 80, color: primary)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                provider.requestTabs()[provider.selectedRequestIndex],
              ],
            ),
          ),
          const YMargin(25),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Container(
                  height: 45,
                  child: FlatButton.icon(
                    color: primary,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    onPressed: () {
                      provider.sendREQ();
                    },
                    icon: Icon(
                      LineIcons.rocket,
                      size: 25,
                      color: Colors.white,
                    ),
                    label: Text(
                      'SEND REQUEST',
                      style: GoogleFonts.lato(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const YMargin(60),
          ResponseSection(),
          const YMargin(50),
        ],
      ),
    );
  }
}
