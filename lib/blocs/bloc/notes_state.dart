part of 'notes_bloc.dart';

class NotesState extends Equatable {
  final List<Note> notes;
  const NotesState({this.notes = const <Note>[]});

  @override
  List<Object> get props => [notes];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'notes': notes.map((x) => x.toMap()).toList()});
  
    return result;
  }

  factory NotesState.fromMap(Map<String, dynamic> map) {
    return NotesState(
      notes: List<Note>.from(map['notes']?.map((x) => Note.fromMap(x))),
    );
  }
}

class AddNoteState extends NotesState {
  const AddNoteState(List<Note> notes) : super(notes: notes);
}

class RemoveNoteState extends NotesState {
  const RemoveNoteState(List<Note> notes) : super(notes: notes);
}

class UpdateNoteState extends NotesState {
  const UpdateNoteState(List<Note> note) : super(notes: note);
}
