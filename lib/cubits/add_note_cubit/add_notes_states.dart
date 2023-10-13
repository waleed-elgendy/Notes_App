part of 'add_note_cubit.dart';

@immutable

abstract class AddNotesStates{}

class NotesInitial extends AddNotesStates{}
class AddNoteLoading  extends AddNotesStates{}
class AddNoteSuccess  extends AddNotesStates{}
class AddNoteFailure  extends AddNotesStates{
  final String errorMessage;

  AddNoteFailure(this.errorMessage);
}
