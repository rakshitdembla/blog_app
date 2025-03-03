class LoginModel {
  String? message;
  String? access_token;
  String? token_type;

  LoginModel(
      { this.message,
       this.access_token,
     this.token_type});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
        message: json["message"],
        access_token: json["access_token"],
        token_type: json["token_type"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "message": message,
      "access_token": access_token,
      "token_type": token_type
    };
  }
}
