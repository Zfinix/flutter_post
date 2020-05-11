import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_post/core/viewmodel/home_vm.dart';
import 'package:flutter_post/utils/colors.dart';
import 'package:flutter_post/utils/margin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HistorySection extends StatelessWidget {
  const HistorySection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<HomeViewModel>();
    return Container(
      color: Color(0xFF2B2B2B),
      height: screenHeight(context),
      child: ListView(
        padding: EdgeInsets.only(left: 30, right: 5),
        shrinkWrap: true,
        children: [
          const YMargin(25),
          Row(
            children: [
              Text(
                'History',
                style: GoogleFonts.cabin(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
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
                    borderRadius: BorderRadius.circular(4),
                    child: Container(
                      height: 35,
                      width: 55,
                      color: provider.getReqHistoryColor(history.type),
                      child: Center(
                        child: Text(
                          history.type ?? '',
                          style: TextStyle(color: Colors.white, fontSize: 11),
                        ),
                      ),
                    ),
                  ),
                  const XMargin(20),
                  Flexible(
                    child: Text(
                      'https://api.staging.altostream.app/user/api/v1/register/',
                      style: GoogleFonts.ptMono(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 12,
                        fontWeight: FontWeight.w100,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      history?.statusCode != null
                          ? history.statusCode.toString()
                          : '',
                      style: GoogleFonts.cabin(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 12,
                        fontWeight: FontWeight.w100,
                      ),
                      overflow: TextOverflow.ellipsis,
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
