part of 'add_note_cubit.dart';

class AddNotesStates {}

class AddNotesInitial extends AddNotesStates {}

class AddNoteLoading extends AddNotesStates {}

class AddNoteSuccess extends AddNotesStates {}

class AddNoteFailure extends AddNotesStates {
  final String errorMessage;

  AddNoteFailure(this.errorMessage);
}
