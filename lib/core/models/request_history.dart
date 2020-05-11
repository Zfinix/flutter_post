class RequestHistory {
  String url;
  String type;
  int statusCode;
  int id;

  RequestHistory({this.url, this.type, this.statusCode, this.id});

  RequestHistory.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    type = json['type'];
    statusCode = json['status_code'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['type'] = this.type;
    data['status_code'] = this.statusCode;
    data['id'] = this.id;
    return data;
  }
}
