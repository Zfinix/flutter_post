import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_post/core/data/utils/log.dart';
import 'package:flutter_post/utils/colors.dart';
import 'package:flutter_post/services/provider_registrar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'history/history_section.dart';
import 'main/main_section.dart';

class HomePage extends StatefulHookWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Log.init(false);
    context.read(homeVM).urlTEC.text =
        'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?earth_date=2016-6-3&camera=NAVCAM&api_key=DEMO_KEY';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkGrey,
      body: Row(
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
    );
  }
}
