class LogoutModel {
    String? message;

    LogoutModel({
         this.message,
    });

    factory LogoutModel.fromJson(Map<String, dynamic> json) => LogoutModel(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}
