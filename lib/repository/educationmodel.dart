class EducationModel {
  int id;
  int userId;
  String schoolName;
  String schoolPassingYear;
  String collegeName;
  String collegePassingYear;
  String collegeLocation;
  String qualification;
  String createdAt;
  String updatedAt;

  EducationModel.fromJson(Map<String, dynamic> data) {
    id = data['id'] ?? 0;
    userId = data['user_id'] ?? 0;
    schoolName = data['school_name'] ?? "";
    schoolPassingYear = data['school_passing_year'] ?? "";
    collegeName = data['college_name'] ?? "";
    collegePassingYear = data['college_passing_year'] ?? "";
    collegeLocation = data['college_location'] ?? "";
    qualification = data['qualification'] ?? "";
    createdAt = data['created_at'] ?? "";
    updatedAt = data['updated_at'] ?? "";
  }
}
