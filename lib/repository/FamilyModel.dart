class FamilyModel {
  int id;
  int user_id;
  String religion;
  String belongTo;
  // String motherName;
  // String motherOccupation;
  // String fatherName;
  // String fatherOccupation;
  // String aboutFamily;
  // String createdAt;
  // String updatedAt;

  FamilyModel.fromJson(Map<String, dynamic> data) {
    id = data['id'] ?? 0;
    user_id = data['user_id'] ?? 0;
    religion = data['religion'] ?? "";
    belongTo = ['belongs_to'] ?? "";
    // motherName = ['mother_name'] ?? "";
    // motherOccupation = ['mother_occupation'] ?? "";
    // fatherName = ['father_name'] ?? "";
    // fatherOccupation = ['father_occupation'] ?? "";
    // aboutFamily = ['about_family'] ?? "";
    // createdAt = ['created_at'] ?? "";
    // updatedAt = ['updated_at'] ?? "";
  }
}
