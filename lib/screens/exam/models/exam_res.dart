class ExamRes {
  ExamRes({
    required this.statusCode,
    this.errorMessage,
    this.count,
    this.image,
    this.message,
  });

  final int statusCode;
  final String? errorMessage;
  final int? count;
  final String? image;
  final String? message;

  factory ExamRes.fromJson(Map<String, dynamic> json) {
    return ExamRes(
      statusCode: json['status_code'],
      errorMessage: json['error_message'],
      count: int.tryParse(json['count'].toString()),
      image: json['image'],
      message: json['message'],
    );
  }

  bool get isSuccess {
    return statusCode >= 200 && statusCode <= 299;
  }
}
