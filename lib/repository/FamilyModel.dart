class FamilyModel {
  int id;
  int userId;
  String religion;
  String beLogTo;

FamilyModel(this.id, this.userId, this.religion, this.beLogTo);


  // FamilyModel.fromJson(Map<String, dynamic> data){
  //   id = data['id'] ?? 0;
  //   userId = data['user_id'] ?? "";
  //   religion = data['religion'] ?? "";
  //   beLogTo =  data ['belongs_to'] ?? "";
  // }
}
