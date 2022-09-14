import 'package:equatable/equatable.dart';
import 'package:flutter/animation.dart';

class Note extends Equatable {
  // String id;
  String title;
  String content;
  DateTime dateCreated;
  DateTime dateModified;
  Color colorNote;

  Note({
    // required this.id,
    required this.title,
    required this.content,
    required this.dateCreated,
    required this.dateModified,
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
      dateCreated: dateCreated ?? this.dateCreated,
      dateModified: dateModified ?? this.dateModified,
      colorNote: colorNote ?? this.colorNote,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'title': title});
    result.addAll({'content': content});
    result.addAll({'dateCreated': dateCreated.millisecondsSinceEpoch});
    result.addAll({'dateModified': dateModified.millisecondsSinceEpoch});
    result.addAll({'colorNote': colorNote.value});

    return result;
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      title: map['title'] ?? '',
      content: map['content'] ?? '',
      dateCreated: DateTime.fromMillisecondsSinceEpoch(map['dateCreated']),
      dateModified: DateTime.fromMillisecondsSinceEpoch(map['dateModified']),
      colorNote: Color(map['colorNote']),
    );
  }

  @override
  List<Object?> get props =>
      [title, content, colorNote, dateCreated, dateModified];
}
