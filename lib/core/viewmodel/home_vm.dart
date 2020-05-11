import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_post/core/data/utils/dynamic_form.dart';
import 'package:flutter_post/core/models/request_history.dart';
import 'package:flutter_post/views/main/req/headers.dart';
import 'package:flutter_post/views/main/req/url_params.dart';
import 'package:flutter_post/views/main/res/response.dart';
import 'package:json_to_form/json_schema.dart';
import 'package:json_viewer/json_viewer.dart';

import '../api.dart';

class HomeViewModel extends Api {
  List<String> requestTypes = ['GET', 'POST', 'PUT', 'PATCH', 'DELETE'];

  String get selectedRequestType => _selectedRequestType;
  String _selectedRequestType = 'GET';

  JsonSchema headersForm;
  JsonSchema headersValueForm;
  JsonSchema urlParamsForm;
  JsonSchema urlParamsValueForm;

  String _responseCode;
  String get responseCode => _responseCode;

  Object _response;
  Object get response => _response;

  var _responseHeaders;
  Object get responseHeaders => _responseHeaders;

  //Header Fields
  List get headerFieldList => _headerFieldList;
  List _headerFieldList = [
    {'key': 'header', 'type': 'TextInput', 'placeholder': 'Header', 'label': ''}
  ];

  List get headerFieldValueList => _headerFieldValueList;
  List _headerFieldValueList = [
    {'key': 'value', 'type': 'TextInput', 'placeholder': 'Value', 'label': ''}
  ];

  //URL Params Fields
  List get urlParamsFieldList => _urlParamsFieldList;
  List _urlParamsFieldList = [
    {'key': 'key', 'type': 'TextInput', 'placeholder': 'Key', 'label': ''}
  ];

  List get urlParamsFieldValueList => _urlParamsFieldValueList;
  List _urlParamsFieldValueList = [
    {'key': 'value', 'type': 'TextInput', 'placeholder': 'Value', 'label': ''}
  ];
  List<RequestHistory> _requestHistory  = new List();
  List<RequestHistory> get requestHistory => _requestHistory;

  //Header Fields
  final headerFormKey = GlobalKey<FormState>();
  final headerValueFormKey = GlobalKey<FormState>();

  //URL Params Fields
  final urlParamsFormKey = GlobalKey<FormState>();
  final urlParamsValueFormKey = GlobalKey<FormState>();

  //Header Fields
  Map<dynamic, dynamic> formHeaderMap() =>
      {'autoValidated': false, 'fields': _headerFieldList};
  Map<dynamic, dynamic> formHeaderValueMap() =>
      {'autoValidated': false, 'fields': _headerFieldValueList};

  //URL Params Fields
  Map<dynamic, dynamic> formUrlParamsMap() =>
      {'autoValidated': false, 'fields': _urlParamsFieldList};
  Map<dynamic, dynamic> formUrlParamsValueMap() =>
      {'autoValidated': false, 'fields': _urlParamsFieldValueList};

  requestTabs() => [ReqHeaders(), UrlParams(), ReqHeaders()];
  responseTabs() =>
      [RawTab(), Center(child: JsonViewerRoot(jsonObj: _response)), HttpTab()];

  int _selectedRequestIndex = 0;
  int get selectedRequestIndex => _selectedRequestIndex;

  int _selectedResponseIndex = 0;
  int get selectedResponseIndex => _selectedResponseIndex;

  final TextEditingController urlTEC = new TextEditingController();

  Map<String, Object> formattedHeaders = {};
  Map<String, Object> formattedParams = {};

  bool _isWorking = false;
  bool get isWorking => _isWorking;

  set isWorking(bool val) {
    _isWorking = val;
    notifyListeners();
  }

  set responseHeaders(bool val) {
    _responseHeaders = val;
    notifyListeners();
  }

  set requestHistory(val) {
    _requestHistory = val;
    notifyListeners();
  }

  set selectedRequestType(String val) {
    _selectedRequestType = val;
    notifyListeners();
  }

  set selectedRequestIndex(val) {
    _selectedRequestIndex = val;
    notifyListeners();
  }

  set selectedResponseIndex(val) {
    _selectedResponseIndex = val;
    notifyListeners();
  }

  set headerFieldValueList(val) {
    _headerFieldValueList = val;
    notifyListeners();
  }

  set headerFieldList(val) {
    _headerFieldList = val;
    notifyListeners();
  }

  set urlParamsFieldList(val) {
    _urlParamsFieldList = val;
    notifyListeners();
  }

  set urlParamsFieldValueList(val) {
    _urlParamsFieldValueList = val;
    notifyListeners();
  }

  set responseCode(String val) {
    _responseCode = val;
    notifyListeners();
  }

  set response(Object val) {
    _response = val;
    notifyListeners();
  }

  sendREQ() async {
    _isWorking = true;
    notifyListeners();
    switch (_selectedRequestType) {
      case 'GET':
        switch (_selectedRequestIndex) {
          case 0:
            getHeaders();
            break;
          case 1:
            getUrlParams();
            break;
          default:
        }
        await _handleGetRequest();
        break;
      case 'POST':
        await _handleGetRequest();
        break;
      case 'PUT':
        await _handleGetRequest();
        break;
      case 'PATCH':
        await _handleGetRequest();
        break;
      case 'DELETE':
        await _handleGetRequest();
        break;
      default:
    }

    _isWorking = false;
    notifyListeners();
  }

  _handleGetRequest() async {
    try {
      var r = await http.get(urlTEC.text, formattedHeaders,
          queryParameters: formattedParams);
     

      if (r != null) {
        _responseCode = r?.statusCode.toString();
        _response = json.decode(r.toString());
        _responseHeaders = r.headers.toString();
        //urlTEC.text = r.request.uri.toString();
         _requestHistory.add(RequestHistory(
            id: _requestHistory.length + 1,
            url: urlTEC.text,
            statusCode: r?.statusCode,
            type: _selectedRequestType)); 

        print("Length:");
      } else {
      }
    } catch (e) {
      print(e);
      if (e is DioError) {
        try {
          _responseCode = e?.response?.statusCode.toString();
          _response = json.decode(e.response.toString());
          urlTEC.text = e.request.uri.toString();

          _requestHistory.add(RequestHistory(
              id: _requestHistory.length + 1,
              url: urlTEC.text,
              statusCode: e?.response?.statusCode,
              type: _selectedRequestType));
          notifyListeners();
          print(e?.response?.statusCode);
          print(e?.response?.toString());
        } catch (e) {}
      }
    }
  }

  getHeaders() {
    formattedHeaders = {};
    notifyListeners();
    headerFormKey.currentState.validate();
    headerFormKey.currentState.validate();
    for (var i = 0; i < _headerFieldList.length; i++) {
      Fields header = Fields.fromJson(_headerFieldList[i]);

      Fields value = Fields.fromJson(_headerFieldValueList[i]);
      if (header.value != null && value.value != null)
        formattedHeaders.addAll({header.value: value.value});
    }
    notifyListeners();

    notifyListeners();
  }

  getUrlParams() {
    formattedParams = {};
    notifyListeners();
    urlParamsFormKey.currentState.validate();
    urlParamsValueFormKey.currentState.validate();
    for (var i = 0; i < _urlParamsFieldList.length; i++) {
      Fields key = Fields.fromJson(_urlParamsFieldList[i]);

      Fields value = Fields.fromJson(_urlParamsFieldValueList[i]);
      if (key.value != null && value.value != null)
        formattedParams.addAll({key.value: value.value});
    }
    notifyListeners();
    // return formattedParams.length > 0 ? formattedParams : null;
  }

  changeRequestTab(int i) {
    switch (_selectedRequestIndex) {
      case 0:
        getHeaders();
        break;
      case 1:
        getUrlParams();
        break;
      default:
    }
    _selectedRequestIndex = i;
    notifyListeners();
  }

  changeResponseTab(int i) {
    /* switch (_selectedRequestIndex) {
      case 0:
        getHeaders();
        break;
      case 1:
        getUrlParams();
        break;
      default:
    } */
    _selectedResponseIndex = i;
    notifyListeners();
  }

  getReqHistoryColor(String type) {
    switch (type) {
      case 'GET':
        return Colors.blue[800];
        break;
      default:
    }
  }
}
