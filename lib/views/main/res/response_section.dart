import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_post/utils/colors.dart';
import 'package:flutter_post/utils/margin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_post/services/provider_registrar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'response.dart';

class ResponseSection extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var provider = useProvider(homeVM);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Text(
              'RESPONSE',
              style: GoogleFonts.lato(
                color: black,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            const XMargin(40),
            if (provider?.responseCode != null &&
                provider.responseCode.isNotEmpty)
              Container(
                color: Colors.black12,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                child: Row(
                  children: [
                    Text(
                      'STATUS    ',
                      style: GoogleFonts.lato(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 10,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    Text(
                      provider?.responseCode ?? '',
                      style: GoogleFonts.lato(
                        color: provider.getReqResColor(),
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              )
          ],
        ),
        const YMargin(30),
        Container(
          color: cardBg,
          child: Response(),
        ),
        const YMargin(20),
      ],
    );
  }
}
