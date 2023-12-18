import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile_exam/core/app/view.dart' as base;
import 'package:mobile_exam/screens/exam/models/exam.dart';
import '../bloc.dart';

class ViewState extends base.ViewState {
  ViewState({required Exam exam}) : _exam = exam;

  final Exam _exam;

  @override
  Widget content(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(height: 20),
          _buildImage(),
          const SizedBox(height: 16),
          Text(_exam.message ?? ''),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => context.bloc.add(),
            child: Text(context.strings.examActionButtonTitle),
          )
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Center(
        child: _exam.hasImage
            ? CachedNetworkImage(
                imageUrl: _exam.image!,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => const Icon(
                    Icons.warning_amber,
                    color: Colors.blue,
                    size: 48))
            : Container());
  }
}
