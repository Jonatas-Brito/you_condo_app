import 'dart:io';

import 'package:equatable/equatable.dart';

class FileEntity extends Equatable {
  final int temporaryId;
  final File file;

  const FileEntity({required this.temporaryId, required this.file});

  @override
  List<Object?> get props => [temporaryId, file];
}
