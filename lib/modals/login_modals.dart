class LoginModals {
  int id;
  String email;
  String password;

  LoginModals({required this.id, required this.email, required this.password});

  LoginModals.empty({this.id = 0, this.email = '', this.password = ''});

  factory LoginModals.fromJson(Map<String, dynamic> map) => LoginModals(
      id: map['id'], email: map['email'], password: map['password']);

  Map<String, dynamic> toJson() =>
      {"id": id, "email": email, "password": password};
}
