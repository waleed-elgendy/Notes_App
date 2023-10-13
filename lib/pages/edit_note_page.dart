import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/shared_widgets/custom_appBar.dart';
import 'package:notes_app/shared_widgets/custom_text_form_field.dart';

class EditNote extends StatelessWidget {
  const EditNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const SizedBox(height: 50),
            CustomAppBar(
              text: "Edit",
              icon: IconButton(icon: const Icon(FontAwesomeIcons.check),onPressed: (){},),
            ),
            const SizedBox(height: 24,),
            const CustomTextField(
              hint: 'Title',
              maxlines: 1,
            ),
            const SizedBox(height: 16,),
            const CustomTextField(
              hint: 'Content',
              maxlines: 7,
            ),
            const SizedBox(height: 80),

          ],
        ),
      ),
    );
  }
}
