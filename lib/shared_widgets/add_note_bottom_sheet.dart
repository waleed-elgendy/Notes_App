import 'package:flutter/material.dart';
import 'package:notes_app/shared_widgets/button.dart';
import 'package:notes_app/shared_widgets/custom_text_form_field.dart';

class AddNote extends StatelessWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: AddNoteForm(),
    );
  }
}

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          Padding(
              padding:
                  const EdgeInsets.only(top: 30, bottom: 15, right: 15, left: 15),
              child: CustomTextField(
                onSaved: (value) {
                  title = value;
                },
                hint: 'Title',
                maxlines: 1,
              )),
          Padding(
            padding: const EdgeInsets.only(top: 5, right: 15, left: 15),
            child: CustomTextField(
              hint: 'Content',
              maxlines: 7,
              onSaved: (value) {
                content = value;
              },
            ),
          ),
          const SizedBox(height: 40),
           CustomButton(text: 'Add',ontap: (){
            if(formKey.currentState!.validate())
              {
                formKey.currentState!.save();
              }else{
              autovalidateMode=AutovalidateMode.always;
            }
          },)
        ],
      ),
    );
  }
}
