import 'package:flutter/material.dart';
import 'package:mobile_exam/core/app/view.dart' as base;
import 'package:mobile_exam/screens/exam/models/exam.dart';
import '../bloc.dart';

class ViewState extends base.ViewState {
  ViewState({required Exam exam}) : _exam = exam;

  final Exam _exam;

  @override
  Widget content(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.warning_amber,
            color: Colors.red,
            size: 48,
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Text(
              _exam.errorMessage ?? '',
              style: context.texts.headlineMedium,
            ),
          ),
          ElevatedButton(
            onPressed: () => context.bloc.add(),
            child: Text(context.strings.examActionButtonTitle),
          )
        ],
      ),
    );
  }
}
