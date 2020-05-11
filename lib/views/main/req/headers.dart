import 'package:flutter/material.dart';
import 'package:flutter_post/core/viewmodel/home_vm.dart';
import 'package:flutter_post/utils/margin.dart';
import 'package:json_to_form/json_schema.dart';
import 'package:provider/provider.dart';

class ReqHeaders extends StatefulWidget {
  ReqHeaders({Key key}) : super(key: key);

  @override
  _ReqHeadersState createState() => _ReqHeadersState();
}

class _ReqHeadersState extends State<ReqHeaders> {
  Map decorations = {
    'header': InputDecoration(
      hintText: 'Header',
      contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
      filled: true,
      hintStyle: TextStyle(fontSize: 14, color: Colors.white),
      fillColor: Color(0xFF2A2C2C),
      border: InputBorder.none,
    ),
    'value': InputDecoration(
      hintText: 'Value',
      contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
      filled: true,
      hintStyle: TextStyle(fontSize: 14, color: Colors.white),
      fillColor: Color(0xFF2A2C2C),
      border: InputBorder.none,
    ),
  };

  var response;

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<HomeViewModel>();
    provider.headersForm = JsonSchema(
      decorations: decorations,
      textStyle: TextStyle(
                            fontWeight: FontWeight.w200,
                            fontSize: 14,
                            color: Colors.white),
      formMap: provider.formHeaderMap(),
      onChanged: (dynamic _) {
        response = _;
      },
      actionSave: (Map data) {
        provider.headerFieldList = data['fields'];
      },
      form: null,
      formKey: provider.headerFormKey,
    );
    provider.headersValueForm = JsonSchema(
      decorations: decorations,
      textStyle: TextStyle(
                            fontWeight: FontWeight.w200,
                            fontSize: 14,
                            color: Colors.white),
      formMap: provider.formHeaderValueMap(),
      onChanged: (dynamic _) {
        response = _;
      },
      actionSave: (Map data) {
        //  print(data);
        provider.headerFieldValueList = data['fields'];
      },
      form: null,
      formKey: provider.headerValueFormKey,
    );
    return Column(
      children: [
        Container(
          width: screenWidth(context),
          // height: 100,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // if (provider.formMap()['fields'] != null)
              Flexible(flex: 2, child: provider.headersForm),
              Flexible(flex: 9, child: provider.headersValueForm),
            ],
          ),
        ),
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.add_circle_outline),
              onPressed: () {
                try {
                  setState(() {
                    provider.headerFieldList.add({
                      'key': 'header',
                      'type': 'TextInput',
                      'label': '',
                      'placeholder': "Header",
                    });
                    provider.headerFieldValueList.add({
                      'key': 'value',
                      'type': 'TextInput',
                      'label': '',
                      'placeholder': "Value",
                    });
                  });
                } catch (e) {
                  print(e.toString());
                }
              },
            ),
            IconButton(
              icon: Icon(Icons.remove_circle_outline),
              onPressed: () {
                try {
                  setState(() {
                    provider.headerFieldList.removeLast();
                    provider.headerFieldValueList.removeLast();
                  });
                } catch (e) {
                  print(e.toString());
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
