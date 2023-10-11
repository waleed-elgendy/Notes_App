import 'package:flutter/material.dart';
import 'package:notes_app/shared%20widgets/custom_appBar.dart';
import 'package:notes_app/shared%20widgets/notes_listView.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            SizedBox(height: 50),
            CustomAppBar(),
            Expanded(
              child: NotesListView(),
            )
          ],
        ),
      ),
    );
  }
}
