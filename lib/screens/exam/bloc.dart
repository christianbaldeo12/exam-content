export 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:mobile_exam/core/app/bloc.dart' as base;
import 'package:mobile_exam/core/services/server.dart';
import 'package:mobile_exam/screens/exam/models/exam.dart';
import 'package:mobile_exam/screens/exam/models/exam_res.dart';

import 'views/main.dart' as main_view;
import 'views/loading.dart' as loading_view;
import 'views/error.dart' as error_view;

extension Extension on BuildContext {
  Bloc get bloc => read<Bloc>();
}

class Bloc extends base.Bloc {
  Bloc(BuildContext context)
      : super(loading_view.ViewState(), context: context);

  @override
  void init() async {
    final service = context.server;
    await _request(service);
  }

  void add() async {
    final service = context.server;
    service.addToCount(1);
    emit(loading_view.ViewState());
    await _request(service);
  }

  Future<void> _request(Server service) async {
    final response = ExamRes.fromJson(await service.data);
    final exam = Exam.fromResponse(response);

    if (!response.isSuccess) {
      // ignore: avoid_print
      print(response);
      emit(error_view.ViewState(exam: exam));
      return;
    }

    emit(main_view.ViewState(exam: exam));
  }
}
