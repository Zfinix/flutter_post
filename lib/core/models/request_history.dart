class RequestHistory {
  String url;
  String type;
  int statusCode;
  int id;
  String fullHeader;
  String response;
  List<Headers> headers;
  List<UrlParam> urlParam;

  RequestHistory(
      {this.url,
      this.type,
      this.statusCode,
      this.id,
      this.fullHeader,
      this.response,
      this.headers,
      this.urlParam});

  RequestHistory.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    type = json['type'];
    statusCode = json['status_code'];
    id = json['id'];
    fullHeader = json['full_header'];
    response = json['response'];
    if (json['headers'] != null) {
      headers = new List<Headers>();
      json['headers'].forEach((v) {
        headers.add(new Headers.fromJson(v));
      });
    }
    if (json['url_param'] != null) {
      urlParam = new List<UrlParam>();
      json['url_param'].forEach((v) {
        urlParam.add(new UrlParam.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['type'] = this.type;
    data['status_code'] = this.statusCode;
    data['id'] = this.id;
    data['full_header'] = this.fullHeader;
    data['response'] = this.response;
    if (this.headers != null) {
      data['headers'] = this.headers.map((v) => v.toJson()).toList();
    }
    if (this.urlParam != null) {
      data['url_param'] = this.urlParam.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Headers {
  String header;
  String value;

  Headers({this.header, this.value});

  Headers.fromJson(Map<String, dynamic> json) {
    header = json['header'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['header'] = this.header;
    data['value'] = this.value;
    return data;
  }
}

class UrlParam {
  String key;
  String value;

  UrlParam({this.key, this.value});

  UrlParam.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['value'] = this.value;
    return data;
  }
}
