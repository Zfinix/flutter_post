import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_post/core/data/utils/log.dart';
import 'package:flutter_post/core/viewmodel/home_vm.dart';
import 'package:flutter_post/utils/colors.dart';
import 'package:flutter_post/utils/margin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'history/history_section.dart';
import 'main/main_section.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Log.init(false);
    context.read<HomeViewModel>().urlTEC.text =
        'https://api.pexels.com/v1/search';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF272626),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Row(
              children: [
                Flexible(
                  flex: 1,
                  child: HistorySection(),
                ),
                Flexible(
                  flex: 3,
                  child: MainSection(),
                ),
              ],
            ),
          ),
          AppBar(),
        ],
      ),
    );
  }
}



class AppBar extends StatelessWidget {
  const AppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<HomeViewModel>();
    return Column(
      children: [
        Container(
          height: 80,
          decoration: BoxDecoration(
            color: primary,
            boxShadow: [
              BoxShadow(
                  color: black.withOpacity(0.09),
                  blurRadius: 66,
                  offset: Offset(0, 6))
            ],
          ),
          child: Row(
            children: [
              const XMargin(40),
              Image.asset('assets/images/rocket.png', height: 35, color: Colors.white,),
              Text(
                'POST | ',
                style: GoogleFonts.cabin(
                  color: Colors.white,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Baby',
                style: GoogleFonts.cabin(
                  color: grey,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        if (provider.isWorking) LinearProgressIndicator(),
      ],
    );
  }
}
