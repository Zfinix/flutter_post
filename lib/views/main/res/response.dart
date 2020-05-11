
import 'package:flutter/material.dart';
import 'package:flutter_post/core/viewmodel/home_vm.dart';
import 'package:flutter_post/utils/margin.dart';
import 'package:flutter_post/utils/pretty_json.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Response extends StatefulWidget {
  @override
  _ResponseState createState() => _ResponseState();
}

class _ResponseState extends State<Response>{

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<HomeViewModel>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const YMargin(20),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 18.0,
          ),
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: () => provider.changeResponseTab(0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text('RAW',
                        style: GoogleFonts.cabin(
                          textStyle: TextStyle(
                              color: provider.selectedResponseIndex == 0
                                 ? Colors.white
                                  : Colors.white.withOpacity(0.4),
                              fontSize: 13,
                              fontWeight: FontWeight.w800),
                        )),
                    if (provider.selectedResponseIndex == 0)
                      Column(
                        children: [
                          const YMargin(10),
                          Container(
                            height: 2,
                            width: 110,
                            color: Colors.amber,
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
                        style: GoogleFonts.cabin(
                          textStyle: TextStyle(
                              color: provider.selectedResponseIndex == 1
                                ?  Colors.white
                                  : Colors.white.withOpacity(0.4),
                              fontSize: 13,
                              fontWeight: FontWeight.w800),
                        )),
                    if (provider.selectedResponseIndex == 1)
                      Column(
                        children: [
                          const YMargin(10),
                          Container(
                            height: 2,
                            width: 110,
                            color: Colors.amber,
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
                        style: GoogleFonts.cabin(
                          textStyle: TextStyle(
                              color: provider.selectedResponseIndex == 2
                                 ? Colors.white
                                  : Colors.white.withOpacity(0.4),
                              fontSize: 13,
                              fontWeight: FontWeight.w800),
                        )),
                    if (provider.selectedResponseIndex == 2)
                      Column(
                        children: [
                          const YMargin(10),
                          Container(
                            height: 2,
                            width: 110,
                            color: Colors.amber,
                          ),
                        ],
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
        const YMargin(40),
        provider.responseTabs()[provider.selectedResponseIndex],
      ],
    );
  }
}

class HttpTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = context.watch<HomeViewModel>();
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

class RawTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = context.watch<HomeViewModel>();
    return provider.response != null
        ? SelectableText(
            '${jsonPretty(provider.response)}',
            style: GoogleFonts.sourceCodePro(
              textStyle: TextStyle(
                  fontWeight: FontWeight.w400, color: Colors.white70),
            ),
          )
        : Container();
  }
}
