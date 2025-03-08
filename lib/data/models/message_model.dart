class MessageModel {
    String? message;
    int? status;

    MessageModel({
         this.message,
         this.status
    });

    factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        message: json["message"],
        status : json["status"]
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "status" : status
    };
}