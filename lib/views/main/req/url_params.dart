import 'package:flutter/material.dart';
import 'package:flutter_post/core/viewmodel/home_vm.dart';
import 'package:flutter_post/utils/margin.dart';
import 'package:json_to_form/json_schema.dart';
import 'package:provider/provider.dart';

class UrlParams extends StatefulWidget {
  UrlParams({Key key}) : super(key: key);

  @override
  _UrlParamsState createState() => _UrlParamsState();
}

class _UrlParamsState extends State<UrlParams> {
  Map decorations = {
    'key': InputDecoration(
      hintText: 'Key',
      contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
      filled: true,
      hintStyle: TextStyle(fontSize: 14, color:Colors.white),
      fillColor: Color(0xFF2A2C2C),
      border: InputBorder.none,
    ),
    'value': InputDecoration(
      hintText: 'Value',
      contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
      filled: true,
      hintStyle: TextStyle(fontSize: 14, color:Colors.white),
      fillColor: Color(0xFF2A2C2C),
      border: InputBorder.none,
    ),
  };

  var response;

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<HomeViewModel>();
    provider.urlParamsForm = JsonSchema(
      decorations: decorations,
      textStyle: TextStyle(
                            fontWeight: FontWeight.w200,
                            fontSize: 14,
                            color: Colors.white),
      formKey: provider.urlParamsFormKey,
      formMap: provider.formUrlParamsMap(),
      onChanged: (dynamic _) {
        response = _;
      },
      actionSave: (Map data) {
        provider.urlParamsFieldList = data['fields'];
        provider.getUrlParams();
      },
      form: null,
    );
    provider.urlParamsValueForm = JsonSchema(
      decorations: decorations,
      textStyle: TextStyle(
                            fontWeight: FontWeight.w200,
                            fontSize: 14,
                            color: Colors.white),
      formMap: provider.formUrlParamsValueMap(),
      formKey: provider.urlParamsValueFormKey,
      onChanged: (dynamic _) {
        response = _;
      },
      actionSave: (Map data) {
        //  print(data);
        provider.urlParamsFieldValueList = data['fields'];
        provider.getUrlParams();
      },
      form: null,
    );
    return Column(
      children: [
        Container(
          width: screenWidth(context),
          // height: 100,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                flex: 2,
                child: provider.urlParamsForm,
              ),
              Flexible(
                flex: 9,
                child: provider.urlParamsValueForm,
              ),
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
                    provider.urlParamsFieldList.add({
                      'key': 'key',
                      'type': 'TextInput',
                      'label': '',
                      'placeholder': "Key",
                    });
                    provider.urlParamsFieldValueList.add({
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
                    provider.urlParamsFieldList.removeLast();
                    provider.urlParamsFieldValueList.removeLast();
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
