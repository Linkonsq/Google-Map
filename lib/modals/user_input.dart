import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class UserInput extends StatefulWidget {
  final double latitude;
  final double longitude;

  UserInput(this.latitude, this.longitude);

  @override
  _UserInputState createState() => _UserInputState(latitude, longitude);
}

class _UserInputState extends State<UserInput> {
  final double latitude;
  final double longitude;

  _UserInputState(this.latitude, this.longitude);

  final _laLongController = TextEditingController();
  final _nameController = TextEditingController(text: "Linkon Siddique");

  @override
  void initState() {
    _laLongController.text = "$latitude, $longitude";
    super.initState();
  }

  void _submitData() {
    final enteredLatLong = _laLongController.text;
    final enteredName = _nameController.text;

    if (enteredName.isEmpty) {
      return;
    }

    if (_laLongController.text.isEmpty) {
      return;
    }

    print("////////////////////////////////");

    print("Latitude, Longitude are: $enteredLatLong");
    print("Name is: $enteredName");

    print("////////////////////////////////");

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Latitude, Longitude'),
                controller: _laLongController,
                keyboardType: TextInputType.number,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Name'),
                controller: _nameController,
              ),
              RaisedButton(
                child: Text('Print to Console'),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white70,
                onPressed: _submitData,
              )
            ],
          ),
        ),
      ),
    );
  }
}
