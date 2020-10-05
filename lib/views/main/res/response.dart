import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_post/utils/colors.dart';
import 'package:flutter_post/utils/margin.dart';
import 'package:flutter_post/utils/pretty_json.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_post/services/provider_registrar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Response extends StatefulHookWidget {
  @override
  _ResponseState createState() => _ResponseState();
}

class _ResponseState extends State<Response> {
  @override
  Widget build(BuildContext context) {
    var provider = useProvider(homeVM);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const YMargin(30),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: () => provider.changeResponseTab(0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('RAW',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              color: provider.selectedResponseIndex == 0
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.4),
                              fontSize: 11,
                              fontWeight: FontWeight.w800),
                        )),
                    if (provider.selectedResponseIndex == 0)
                      Column(
                        children: [
                          const YMargin(10),
                          Container(
                            height: 2,
                            width: 80,
                            color: primary,
                          ),
                        ],
                      )
                  ],
                ),
              ),
              const XMargin(30),
              GestureDetector(
                onTap: () => provider.changeResponseTab(1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('FORMATTED',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              color: provider.selectedResponseIndex == 1
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.4),
                              fontSize: 11,
                              fontWeight: FontWeight.w800),
                        )),
                    if (provider.selectedResponseIndex == 1)
                      Column(
                        children: [
                          const YMargin(10),
                          Container(
                            height: 2,
                            width: 80,
                            color: primary,
                          ),
                        ],
                      )
                  ],
                ),
              ),
              const XMargin(30),
              GestureDetector(
                onTap: provider.responseHeaders != null
                    ? () => provider.changeResponseTab(2)
                    : null,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('HTTP',
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              color: provider.selectedResponseIndex == 2
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.4),
                              fontSize: 11,
                              fontWeight: FontWeight.w800),
                        )),
                    if (provider.selectedResponseIndex == 2)
                      Column(
                        children: [
                          const YMargin(10),
                          Container(
                            height: 2,
                            width: 80,
                            color: primary,
                          ),
                        ],
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
     
        Padding(
          padding: EdgeInsets.all(30),
          child: provider.responseTabs()[provider.selectedResponseIndex],
        ),
        const YMargin(40),
      ],
    );
  }
}

class HttpTab extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var provider = useProvider(homeVM);
    return provider.response != null
        ? Column(
            children: [
              SelectableText(
                '${provider.responseHeaders ?? ''}\n\n${provider.response}',
                style: GoogleFonts.sourceCodePro(
                  textStyle: TextStyle(
                      fontWeight: FontWeight.w100, color: Colors.white),
                ),
              ),
              const YMargin(10),
            ],
          )
        : Container();
  }
}

class RawTab extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var provider = useProvider(homeVM);
    return provider.response != null
        ? SelectableText(
            '${jsonPretty(provider.response)}',
            style: GoogleFonts.sourceCodePro(
              textStyle:
                  TextStyle(fontWeight: FontWeight.w400, color: Colors.white70),
            ),
          )
        : Container();
  }
}
