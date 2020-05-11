class FormModel {
  bool autoValidated;
  List<Fields> fields;

  FormModel({this.autoValidated, this.fields});

  FormModel.fromJson(Map<dynamic, dynamic> map) {
    autoValidated = map['autoValidated'];
    if (map['fields'] != null) {
      fields = new List<Fields>();
      map['fields'].forEach((v) {
        fields.add(new Fields.fromJson(v));
      });
    }
  }

  Map<dynamic, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['autoValidated'] = this.autoValidated;
    if (this.fields != null) {
      data['fields'] = this.fields.map((v) => v.toMap()).toList();
    }
    return data;
  }
}

class Fields {
  String key;
  String type;
  String label;
  String value;
  String placeholder;
  bool isRequired;
  bool hiddenLabel;

  Fields(
      {this.key,
      this.type,
      this.label,
      this.placeholder,
      this.value,
      this.isRequired,
      this.hiddenLabel});

  Fields.fromJson(Map<dynamic, dynamic> map) {
    key = map['key'];
    type = map['type'];
    label = map['label'];
    placeholder = map['placeholder'];
    value = map['value'];
    isRequired = map['required'];
    hiddenLabel = map['hiddenLabel'];
  }

  Map<dynamic, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['type'] = this.type;
    data['label'] = this.label;
    data['placeholder'] = this.placeholder;
    data['value'] = this.value;
    data['required'] = this.isRequired;
    data['hiddenLabel'] = this.hiddenLabel;
    return data;
  }
}