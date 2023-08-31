class ValidationForm {
  ValidationForm({
    this.message,
    this.check,
  });

  String? message;
  bool? check;

  factory ValidationForm.fromJson(Map<String, dynamic> json) => ValidationForm(
    message: json["message"],
    check: json['check'],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "check": check,
  };
}