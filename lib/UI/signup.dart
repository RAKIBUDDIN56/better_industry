import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spar/UI/home/home.dart';

class SignUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => SignUpScreen(),
      },
    );
  }
}

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SizedBox(
          width: 400,
          child: Card(
            child: SignUpForm(),
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _firstNameTextController = TextEditingController();
  final _lastNameTextController = TextEditingController();
  final _usernameTextController = TextEditingController();
  final _dobTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _rePasswordTextController = TextEditingController();

  double _formProgress = 0;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LinearProgressIndicator(value: _formProgress),
          Text('Sign up', style: Theme.of(context).textTheme.headline3),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _firstNameTextController,
              decoration: InputDecoration(hintText: 'First name'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _lastNameTextController,
              decoration: InputDecoration(hintText: 'Last name'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _usernameTextController,
              decoration: InputDecoration(hintText: 'Username'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _dobTextController,
              decoration: InputDecoration(hintText: 'DOB'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _emailTextController,
              decoration: InputDecoration(hintText: 'Email'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _passwordTextController,
              decoration: InputDecoration(hintText: 'Password'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _rePasswordTextController,
              decoration: InputDecoration(hintText: 'ReType Password'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 200.0),
            child: OutlineButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChildForm()),
                );
              },
              child: Text('+ Add a Child', style: TextStyle(color: Colors.red)),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
              child: Text('Sign up'),
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}

class ChildForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text('Add Child Details'),
        ),
      ),
      body: Center(
        child: SizedBox(
          width: 400,
          child: Card(
            child: AddChildForm(),
            color: Colors.blue[100],
          ),
        ),
      ),
    );
  }
}

class AddChildForm extends StatefulWidget {
  @override
  _AddChildFormState createState() => _AddChildFormState();
}

class _AddChildFormState extends State<AddChildForm> {
  final _childNameTextController = TextEditingController();
  final _childDobTextController = TextEditingController();
  final _childGenderTextController = TextEditingController();
  String dropdownValue = 'I am their...';

  Widget build(BuildContext context) {
    return Form(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _childNameTextController,
              decoration: InputDecoration(hintText: 'Child name'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _childDobTextController,
              decoration: InputDecoration(hintText: 'DOB'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _childGenderTextController,
              decoration: InputDecoration(hintText: 'Gender'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 20,
                  elevation: 24,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  underline: Container(
                    height: 1,
                    color: Colors.black,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>[
                    'I am their...',
                    'Father',
                    'Mother',
                    'Sibiling',
                    'Guardian',
                    'Relations',
                    'Teacher'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: RaisedButton(
              color: Colors.blue[900],
              onPressed: () {
                return showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Child Added!'),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            Text('Your Child details recorded.'),
                            Text(
                                'You can View and get use of the app according to your Child.'),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        RaisedButton(
                          child: Text('OK'),
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Add',
                  style: TextStyle(fontSize: 24, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
