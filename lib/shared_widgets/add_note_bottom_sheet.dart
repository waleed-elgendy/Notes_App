import 'package:flutter/material.dart';
import 'package:notes_app/shared_widgets/button.dart';
import 'package:notes_app/shared_widgets/custom_text_field.dart';

class AddNote extends StatelessWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
            padding: EdgeInsets.only(top: 30, bottom: 15, right: 15, left: 15),
            child: CustomTextField(
              hint: 'Title',
              vContent: 25,
              hContent: 10,
            )),
        Padding(
          padding: EdgeInsets.only(top: 5, right: 15, left: 15),
          child: CustomTextField(hint: 'Content', vContent: 80, hContent: 10),
        ),
        SizedBox(height: 80),
        CustomButton(text: 'Add')
      ],
    );
  }
}
