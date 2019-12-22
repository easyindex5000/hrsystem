class Contract {
  String companyNameEn;
  String companyNameAr;
  String country;
  String city;
  String mobileNumber;
  String phoneNumber;
  String website;
  String companyAddress;
  String contractTypeId;
  String companyLogo;
  String designFile;
  String taxIdPhoto;
  String commercialIdPhoto;
  int employeeId;
  int id;
 
  Contract(
      {this.companyNameEn,
      this.companyNameAr,
      this.country,
      this.city,
      this.mobileNumber,
      this.phoneNumber,
      this.website,
      this.companyAddress,
      this.contractTypeId,
      this.companyLogo,
      this.designFile,
      this.taxIdPhoto,
      this.commercialIdPhoto,
      this.employeeId,
      this.id});

  Contract.fromJson(Map<String, dynamic> json) {
    companyNameEn = json['company_name_en'];
    companyNameAr = json['company_name_ar'];
    country = json['country'];
    city = json['city'];
    mobileNumber = json['mobile_number'];
    phoneNumber = json['phone_number'];
    website = json['website'];
    companyAddress = json['company_address'];
    contractTypeId = json['contract_type_id'];
    companyLogo = json['company_logo'];
    designFile = json['design_file'];
    taxIdPhoto = json['tax_id_photo'];
    commercialIdPhoto = json['commercial_id_photo'];
    employeeId = json['employee_id'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['company_name_en'] = this.companyNameEn;
    data['company_name_ar'] = this.companyNameAr;
    data['country'] = this.country;
    data['city'] = this.city;
    data['mobile_number'] = this.mobileNumber;
    data['phone_number'] = this.phoneNumber;
    data['website'] = this.website;
    data['company_address'] = this.companyAddress;
    data['contract_type_id'] = this.contractTypeId;
    data['company_logo'] = this.companyLogo;
    data['design_file'] = this.designFile;
    data['tax_id_photo'] = this.taxIdPhoto;
    data['commercial_id_photo'] = this.commercialIdPhoto;
    data['employee_id'] = this.employeeId;
    data['id'] = this.id;
    return data;
  }
}
