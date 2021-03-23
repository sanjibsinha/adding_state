import 'package:flutter/material.dart';
import '../models/names.dart';

class GivingOutputs extends StatelessWidget {
  /// the first property a list of names based on a model class
  /// so the type of list is model class Names
  ///
  final List<Names> names;
  GivingOutputs(this.names);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: names.map((name) {
          return Container(
            width: 300,
            height: 250,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            child: Card(
              elevation: 10,
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    name.id,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    name.firstName,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Text(
                    name.lastName,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Text(
                    name.date.day.toString(),
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
