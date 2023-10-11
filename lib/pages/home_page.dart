import 'package:flutter/material.dart';
import 'package:notes_app/shared%20widgets/custom_appBar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
             SizedBox(
              height: 50,
            ),
            CustomAppBar(),

          ],
        ),
      ),
    );
  }
}


