import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_post/services/provider_registrar.dart';
import 'package:flutter_post/utils/colors.dart';
import 'package:flutter_post/utils/margin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:line_icons/line_icons.dart';

class HistorySection extends HookWidget {
  const HistorySection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = useProvider(homeVM);
    return Container(
      color: Color(0xFF333030),
      height: screenHeight(context),
      child: Column(
        children: [
          AppBar(),
          Flexible(
            child: ListView(
              padding: EdgeInsets.only(left: 20, right: 20),
              shrinkWrap: true,
              children: [
                const YMargin(35),
                Row(
                  children: [
                    Text(
                      'HISTORY',
                      style: GoogleFonts.lato(
                        color: grey,
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const YMargin(10),
                for (var history in provider.requestHistory)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(2),
                          child: Container(
                            height: 30,
                            width: 50,
                            color: provider.getReqHistoryColor(history.type),
                            child: Center(
                              child: Text(
                                history.type ?? '',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        const XMargin(20),
                        Flexible(
                          flex: 3,
                          child: Text(
                            history.url ?? '',
                            style: GoogleFonts.ptMono(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 12,
                              fontWeight: FontWeight.w100,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const XMargin(5),
                        Flexible(
                          flex: 1,
                          child: Text(
                            history?.statusCode != null
                                ? history.statusCode.toString()
                                : '',
                            style: GoogleFonts.lato(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AppBar extends HookWidget {
  const AppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = useProvider(homeVM);
    return Column(
      children: [
        Container(
          height: 80,
          color: primary,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                LineIcons.connectdevelop,
                size: 25,
                color: Colors.white,
              ),
            ],
          ),
        ),
        if (provider.isWorking)
          Container(
            height: 3,
            child: LinearProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.amber),
              backgroundColor: primary,
            ),
          ),
      ],
    );
  }
}
