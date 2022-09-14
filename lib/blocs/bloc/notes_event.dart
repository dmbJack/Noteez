part of 'notes_bloc.dart';

abstract class NotesEvent extends Equatable {
  final Note note;
  const NotesEvent(
    this.note,
  );

  @override
  List<Object> get props => [note];
}

class AddNoteEvent extends NotesEvent {
  const AddNoteEvent(super.note);
}

class UpdateNoteEvent extends NotesEvent {
  final Note oldNote;
  const UpdateNoteEvent(this.oldNote, super.note);
}

class RemoveNoteEvent extends NotesEvent {
  const RemoveNoteEvent(super.note);
}
