import 'package:flutter/material.dart';
import '../models/names.dart';
import '../controllers/giving_ouputs.dart';
import '../controllers/taking_inputs.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AvoidingWidgetRebuilds(),
    );
  }
}

class AvoidingWidgetRebuilds extends StatelessWidget {
  const AvoidingWidgetRebuilds({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: NamesChange(),
    );
  }
}

/// we need a stateful widget because we want to change state
/// of our properties and want our UI should reflect that
/// new state ofthe changed-properties
///
class NamesChange extends StatefulWidget {
  @override
  _NamesChangeState createState() => _NamesChangeState();
}

class _NamesChangeState extends State<NamesChange> {
  /// since we have kept everything in a single stateful widget
  /// each event that happens on the model class, rebuilds the whole widget tree
  /// as a result, a section of the wiget that should not belong to this
  /// wiidget tree, is affected. To solve this problem, we can take those parts
  /// to stateless widgets, however we should pass the needful reference methods
  /// through constructors of required classes
  ///

  final List<Names> names = [
    Names(
      firstName: 'Sanjib',
      lastName: 'Sinha',
    ),
    Names(
      firstName: 'Json',
      lastName: 'Web',
    ),
    Names(
      firstName: 'John',
      lastName: 'Smith',
    ),
  ];

  /// we want to add names to the list dynamically so we want a method
  /// and setState method to add to the list
  ///
  void addNamesToList(String first, String last) {
    final addingNames = Names(firstName: first, lastName: last);
    setState(() {
      names.add(addingNames);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TakingInputs(addNames: addNamesToList),
        GivingOutputs(names),
      ],
    );
  }
}
