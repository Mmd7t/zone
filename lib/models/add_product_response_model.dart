class AddProductResponseModel {
  AddProductResponseModel({
    this.maincode,
    this.code,
    this.error,
    this.data,
  });

  int maincode;
  int code;
  dynamic error;
  String data;

  factory AddProductResponseModel.fromJson(Map<String, dynamic> json) =>
      AddProductResponseModel(
        maincode: json["maincode"],
        code: json["code"],
        error: json["error"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "maincode": maincode,
        "code": code,
        "error": error,
        "data": data,
      };
}
