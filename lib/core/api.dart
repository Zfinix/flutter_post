import 'package:flutter/material.dart';

import 'data/utils/http_wrapper.dart';

class Api extends ChangeNotifier{
  Api() : http = HttpWrapper();
  final HttpWrapper http;
}
