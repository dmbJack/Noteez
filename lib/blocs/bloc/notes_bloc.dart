import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:note_app/model/note.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends HydratedBloc<NotesEvent, NotesState> {
  NotesBloc() : super(const NotesState(notes: [])) {
    on<AddNoteEvent>(_onAddNote);
    on<RemoveNoteEvent>(_onRemoveNote);
    on<UpdateNoteEvent>(_onUpdateNote);
  }
  void _onAddNote(AddNoteEvent event, Emitter<NotesState> emit) {
    emit(AddNoteState(List.from(state.notes)..insert(0, event.note)));
  }

  void _onUpdateNote(UpdateNoteEvent event, Emitter<NotesState> emit) {
    // final indexOfNote = state.notes.indexOf(event.oldNote);
    final newList = List.from(state.notes)..remove(event.oldNote);
    emit(UpdateNoteState(List.from(newList)..insert(0, event.note)));
  }

  void _onRemoveNote(RemoveNoteEvent event, Emitter<NotesState> emit) {
    emit(RemoveNoteState(List.from(state.notes)..remove(event.note)));
  }

  @override
  NotesState? fromJson(Map<String, dynamic> json) {
    return NotesState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(NotesState state) {
    return state.toMap();
  }
}
