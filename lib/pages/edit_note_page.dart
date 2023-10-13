import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/shared_widgets/custom_appBar.dart';
import 'package:notes_app/shared_widgets/custom_text_field.dart';

class EditNote extends StatelessWidget {
  const EditNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 50),
            CustomAppBar(
              text: "Edit",
              icon: IconButton(icon: Icon(FontAwesomeIcons.check),onPressed: (){},),
            ),
            SizedBox(height: 24,),
            CustomTextField(
              hint: 'Title',
              maxlines: 1,
            ),
            SizedBox(height: 16,),
            CustomTextField(
              hint: 'Content',
              maxlines: 7,
            ),
            SizedBox(height: 80),

          ],
        ),
      ),
    );
  }
}
