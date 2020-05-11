import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_post/core/viewmodel/home_vm.dart';
import 'package:flutter_post/utils/colors.dart';
import 'package:flutter_post/utils/margin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'req/request_section.dart';
import 'res/response_section.dart';

class MainSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = context.watch<HomeViewModel>();
    return Container(
      height: screenHeight(context),
      child: ListView(
        padding: EdgeInsets.all(30),
        physics: ClampingScrollPhysics(),
        children: [
          const YMargin(30),
          RequestSection(),
          const YMargin(20),
          Container(
            padding: EdgeInsets.all(20),
              color: darkGrey,
            
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
                                style: GoogleFonts.cabin(
                                  textStyle: TextStyle(
                                      color: provider.selectedRequestIndex == 0
                                          ? Colors.white
                                          : Colors.white.withOpacity(0.4),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w800),
                                )),
                            const YMargin(10),
                            if (provider.selectedRequestIndex == 0)
                              Container(
                                height: 2,
                                width: 110,
                                color: Colors.amber,
                              )
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
                                style: GoogleFonts.cabin(
                                  textStyle: TextStyle(
                                      color: provider.selectedRequestIndex == 1
                                          ? Colors.white
                                          : Colors.white.withOpacity(0.4),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w800),
                                )),
                            const YMargin(10),
                            if (provider.selectedRequestIndex == 1)
                              Container(
                                height: 2,
                                width: 110,
                                color: Colors.amber,
                              )
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
                                style: GoogleFonts.cabin(
                                  textStyle: TextStyle(
                                      color: provider.selectedRequestIndex == 2
                                          ? Colors.white
                                          : Colors.white.withOpacity(0.4),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w800),
                                )),
                            const YMargin(10),
                            if (provider.selectedRequestIndex == 2)
                              Container(
                                height: 2,
                                width: 110,
                                color: Colors.amber,
                              )
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
                    icon: Image.asset(
                      'assets/images/rocket2.png',
                      height: 23,
                    ),
                    label: Text(
                      'Send Request',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const YMargin(35),
          ResponseSection(),
          const YMargin(50),
        ],
      ),
    );
  }
}
