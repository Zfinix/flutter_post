import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:flutter_post/core/viewmodel/home_vm.dart';

final registerProviders = <SingleChildWidget>[
  ChangeNotifierProvider(create: (_) => HomeViewModel()),
];
