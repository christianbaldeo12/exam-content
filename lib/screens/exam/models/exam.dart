import 'package:mobile_exam/screens/exam/models/exam_res.dart';

class Exam {
  Exam({
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

  factory Exam.fromResponse(ExamRes response) {
    return Exam(
      statusCode: response.statusCode,
      errorMessage: response.errorMessage,
      count: response.count,
      image: response.image,
      message: response.message,
    );
  }

  bool get hasImage {
    return image != null && (image?.isNotEmpty ?? false);
  }
}
