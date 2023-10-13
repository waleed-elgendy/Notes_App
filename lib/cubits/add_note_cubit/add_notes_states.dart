part of 'add_note_cubit.dart';

@immutable

abstract class NotesStates{}

class NotesInitial extends NotesStates{}
class AddNoteLoading  extends NotesStates{}
class AddNoteSuccess  extends NotesStates{}
class AddNoteFailure  extends NotesStates{
  final String errorMessage;

  AddNoteFailure(this.errorMessage);
}
