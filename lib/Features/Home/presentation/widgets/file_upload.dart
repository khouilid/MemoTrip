import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:template/core/presentation/managers/color_manager.dart';
import 'package:template/core/presentation/utils/functions.dart';
import 'package:template/theme/shared/spacing.dart';

class FileUpload extends HookWidget {
  const FileUpload({
    super.key,
    this.supportedExtensions,
    required this.onFileSelected,
  });

  final Function(File file) onFileSelected;
  final List<String>? supportedExtensions;

  @override
  Widget build(BuildContext context) {
    final selectedFileNotifier = useState<File?>(null);
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: () {
          pickFile(allowedExtensions: supportedExtensions).then(
            (value) {
              if (value != null) {
                selectedFileNotifier.value = value;
                onFileSelected(value);
              }
            },
          );
        },
        child: DottedBorder(
          borderType: BorderType.RRect,
          radius: const Radius.circular(8),
          padding: const EdgeInsets.all(6),
          color: AppColors.grey,
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: Spacing.large,
            ),
            width: double.infinity,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: selectedFileNotifier.value != null
                          ? AppColors.lightGrey
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(999),
                    ),
                    child: Icon(
                      CupertinoIcons.cloud_upload,
                      color: selectedFileNotifier.value == null
                          ? AppColors.grey
                          : AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
