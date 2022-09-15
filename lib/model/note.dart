import 'package:equatable/equatable.dart';
import 'package:flutter/animation.dart';

class Note extends Equatable {
  // String id;
  final String title;
  final String content;
  final DateTime dateCreatedOrModified;
  final Color colorNote;

  const Note({
    // required this.id,
    required this.title,
    required this.content,
    required this.dateCreatedOrModified,
    required this.colorNote,
  });

  Note copyWith({
    String? title,
    String? content,
    DateTime? dateCreated,
    DateTime? dateModified,
    Color? colorNote,
    List<String>? listTage,
  }) {
    return Note(
      title: title ?? this.title,
      content: content ?? this.content,
      dateCreatedOrModified: dateCreated ?? dateCreatedOrModified,
      colorNote: colorNote ?? this.colorNote,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'title': title});
    result.addAll({'content': content});
    result
        .addAll({'dateCreated': dateCreatedOrModified.millisecondsSinceEpoch});

    result.addAll({'colorNote': colorNote.value});

    return result;
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      title: map['title'] ?? '',
      content: map['content'] ?? '',
      dateCreatedOrModified:
          DateTime.fromMillisecondsSinceEpoch(map['dateCreated']),
      colorNote: Color(map['colorNote']),
    );
  }

  @override
  List<Object?> get props => [title, content, colorNote, dateCreatedOrModified];
}
