class HttpStatusCodes {
  String code;
  String phrase;
  String description;
  String specTitle;
  String specHref;

  HttpStatusCodes(
      {this.code,
      this.phrase,
      this.description,
      this.specTitle,
      this.specHref});

  HttpStatusCodes.fromJson(Map<String, Object> json) {
    code = json['code'];
    phrase = json['phrase'];
    description = json['description'];
    specTitle = json['spec_title'];
    specHref = json['spec_href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, Object>();
    data['code'] = this.code;
    data['phrase'] = this.phrase;
    data['description'] = this.description;
    data['spec_title'] = this.specTitle;
    data['spec_href'] = this.specHref;
    return data;
  }
}
