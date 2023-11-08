class ResumeModel {
  int? id;
  String? name;
  PersonalInfo? personalInfo;
  Address? address;
  String? date;

  ResumeModel({this.id, this.name, this.personalInfo, this.address, this.date});

  ResumeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    personalInfo = json['personalInfo'] != null
        ? new PersonalInfo.fromJson(json['personalInfo'])
        : null;
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.personalInfo != null) {
      data['personalInfo'] = this.personalInfo!.toJson();
    }
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['date'] = this.date;
    return data;
  }
}

class PersonalInfo {
  String? name;
  String? fullName;
  String? mobileNumber;
  String? email;

  PersonalInfo({this.name, this.fullName, this.mobileNumber, this.email});

  PersonalInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    fullName = json['fullName'];
    mobileNumber = json['mobileNumber'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['fullName'] = this.fullName;
    data['mobileNumber'] = this.mobileNumber;
    data['email'] = this.email;
    return data;
  }
}

class Address {
  String? address;
  String? zipCode;
  String? country;
  String? state;
  String? city;

  Address({this.address, this.zipCode, this.country, this.state, this.city});

  Address.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    zipCode = json['zipCode'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['zipCode'] = this.zipCode;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    return data;
  }
}
