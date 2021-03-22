import 'package:flutter/material.dart';

class TakingInputs extends StatelessWidget {
  TakingInputs({Key key, this.addNames}) : super(key: key);

  final firstController = TextEditingController();
  final secondController = TextEditingController();

  final Function addNames;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          TextField(
            controller: firstController,
          ),
          TextField(
            controller: secondController,
          ),
          TextButton(
              onPressed: () {
                addNames(firstController.text, secondController.text);
              },
              child: Text(
                'Add Names',
                style: Theme.of(context).textTheme.headline5,
              )),
        ],
      ),
    );
  }
}
