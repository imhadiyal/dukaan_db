class LoginModals {
  int id;
  String email;
  String password;
  LoginModals(this.id, this.email, this.password);
  factory LoginModals.fromMap({required Map data}) => LoginModals(
        data['id'],
        data['email'],
        data['password'],
      );
  Map<String, dynamic> get users => {
        'id': id,
        'email': email,
        'password': password,
      };
}
