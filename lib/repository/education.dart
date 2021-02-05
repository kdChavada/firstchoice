class Education {
  int id;
  int userId;
  String schoolName;
  int schoolPassingYear;
  String collegeName;
  int collegePassingYear;
  String collegeLocation;
  String qualification;
  String createdAt;
  String updatedAt;
  User user;

  Education(
      {this.id,
        this.userId,
        this.schoolName,
        this.schoolPassingYear,
        this.collegeName,
        this.collegePassingYear,
        this.collegeLocation,
        this.qualification,
        this.createdAt,
        this.updatedAt,
        this.user});

  Education.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    schoolName = json['school_name'];
    schoolPassingYear = json['school_passing_year'];
    collegeName = json['college_name'];
    collegePassingYear = json['college_passing_year'];
    collegeLocation = json['college_location'];
    qualification = json['qualification'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['school_name'] = this.schoolName;
    data['school_passing_year'] = this.schoolPassingYear;
    data['college_name'] = this.collegeName;
    data['college_passing_year'] = this.collegePassingYear;
    data['college_location'] = this.collegeLocation;
    data['qualification'] = this.qualification;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  int id;
  String name;
  String phoneNo;
  String email;
  String address;
  String gender;
  String country;
  int height;
  String birthPlace;
  String birthDate;
  String birthTime;
  String livedIn;
  String aboutUser;
  String materialStatus;
  String occupation;
  String interest;
  String createdAt;
  String updatedAt;
  Family family;

  User(
      {this.id,
        this.name,
        this.phoneNo,
        this.email,
        this.address,
        this.gender,
        this.country,
        this.height,
        this.birthPlace,
        this.birthDate,
        this.birthTime,
        this.livedIn,
        this.aboutUser,
        this.materialStatus,
        this.occupation,
        this.interest,
        this.createdAt,
        this.updatedAt,
        this.family});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phoneNo = json['phone_no'];
    email = json['email'];
    address = json['address'];
    gender = json['gender'];
    country = json['country'];
    height = json['height'];
    birthPlace = json['birth_place'];
    birthDate = json['birth_date'];
    birthTime = json['birth_time'];
    livedIn = json['lived_in'];
    aboutUser = json['about_user'];
    materialStatus = json['material_status'];
    occupation = json['occupation'];
    interest = json['interest'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    family =
    json['family'] != null ? new Family.fromJson(json['family']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone_no'] = this.phoneNo;
    data['email'] = this.email;
    data['address'] = this.address;
    data['gender'] = this.gender;
    data['country'] = this.country;
    data['height'] = this.height;
    data['birth_place'] = this.birthPlace;
    data['birth_date'] = this.birthDate;
    data['birth_time'] = this.birthTime;
    data['lived_in'] = this.livedIn;
    data['about_user'] = this.aboutUser;
    data['material_status'] = this.materialStatus;
    data['occupation'] = this.occupation;
    data['interest'] = this.interest;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.family != null) {
      data['family'] = this.family.toJson();
    }
    return data;
  }
}

class Family {
  int id;
  int userId;
  String religion;
  String belongsTo;
  String motherName;
  String motherOccupation;
  String fatherName;
  String fatherOccupation;
  String aboutFamily;
  String createdAt;
  String updatedAt;

  Family(
      {this.id,
        this.userId,
        this.religion,
        this.belongsTo,
        this.motherName,
        this.motherOccupation,
        this.fatherName,
        this.fatherOccupation,
        this.aboutFamily,
        this.createdAt,
        this.updatedAt});

  Family.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    religion = json['religion'];
    belongsTo = json['belongs_to'];
    motherName = json['mother_name'];
    motherOccupation = json['mother_occupation'];
    fatherName = json['father_name'];
    fatherOccupation = json['father_occupation'];
    aboutFamily = json['about_family'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['religion'] = this.religion;
    data['belongs_to'] = this.belongsTo;
    data['mother_name'] = this.motherName;
    data['mother_occupation'] = this.motherOccupation;
    data['father_name'] = this.fatherName;
    data['father_occupation'] = this.fatherOccupation;
    data['about_family'] = this.aboutFamily;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}