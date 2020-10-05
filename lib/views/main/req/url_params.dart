import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_post/utils/colors.dart';
import 'package:flutter_post/utils/form/json_schema.dart';
import 'package:flutter_post/utils/margin.dart';
import 'package:flutter_post/services/provider_registrar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UrlParams extends StatefulHookWidget {
  UrlParams({Key key}) : super(key: key);

  @override
  _UrlParamsState createState() => _UrlParamsState();
}

class _UrlParamsState extends State<UrlParams> {
  Map decorations = {
    'key': InputDecoration(
      hintText: 'KEY',
      contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
      filled: true,
      hintStyle: TextStyle(fontSize: 11, color: grey),
      fillColor: Color(0xFF2A2C2C),
      border: InputBorder.none,
    ),
    'value': InputDecoration(
      hintText: 'VALUE',
      contentPadding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
      filled: true,
      hintStyle: TextStyle(fontSize: 11, color: grey),
      fillColor: Color(0xFF2A2C2C),
      border: InputBorder.none,
    ),
  };

  var response;

  @override
  Widget build(BuildContext context) {
    var provider = useProvider(homeVM);
    provider.urlParamsForm = JsonSchema(
      decorations: decorations,
      textStyle: TextStyle(
          fontWeight: FontWeight.w200, fontSize: 11, color: Colors.white),
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
          fontWeight: FontWeight.w200, fontSize: 11, color: Colors.white),
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
        const YMargin(20),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: Material(
                  color: primary,
                  child: InkWell(
                    onTap: () {
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
                    child: Container(
                      height: screenHeight(context, percent: .04),
                      width: screenHeight(context, percent: .04),
                      child: Icon(
                        Icons.add,
                        size: 17,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const XMargin(20),
              ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: Material(
                  color: Colors.grey[800],
                  child: InkWell(
                    onTap: () {
                      try {
                        setState(() {
                          provider.urlParamsFieldList.removeLast();
                          provider.urlParamsFieldValueList.removeLast();
                        });
                      } catch (e) {
                        print(e.toString());
                      }
                    },
                    child: Container(
                      height: screenHeight(context, percent: .04),
                      width: screenHeight(context, percent: .04),
                      child: Icon(
                        Icons.remove,
                        size: 17,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
