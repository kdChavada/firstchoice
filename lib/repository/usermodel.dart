class UserModel{
  int id;
  String name;
  String email;
  String phone_no;
  String address;
  String Gender;

  UserModel.fromJson(Map<String, dynamic> data){
    id = data['id'] ?? 0;
    name = data['name'] ?? "";
    phone_no = data['phone_no'] ?? "";
    email = data['email'] ?? "";
    address = data ['address'] ?? "";
    Gender = data ['gender'] ?? "";
  }
}