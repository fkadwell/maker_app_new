import 'package:flutter/material.dart';

void main() {
  runApp(SignUpApp());
}

class SignUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Up Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  String? name;
  String? email;
  String? transgender;
  String? chronicDisability;
  String? serviceMember;
  String? genderIdentity;
  List<String> racialIdentity = [];
  List<String> sexualOrientation = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign Up Page',
          style: TextStyle(color: Color(0xFF014C72)),
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Color(0xFF014C72)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Row(
            children: [
              // First Column with Image
              Expanded(
                child: Container(
                  height: double.infinity, // Occupies all available height
                  child: Image.asset(
                    'images/Maker_space_design.png',
                    fit: BoxFit.contain, // Adjust this as needed (BoxFit.contain, BoxFit.fill, etc.)
                  ),
                ),
              ),
              SizedBox(width: 20),
              // Second Column with Form
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Create a new account',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        color: Color(0xFF014C72),
                      ),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: ListView(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Name',
                              hintText: 'John Doe',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              name = value;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Email Address',
                              hintText: 'example@example.com',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              email = value;
                            },
                          ),
                          Question(
                            question: 'Do you identify as transgender?',
                            options: ['Yes', 'No', 'Don\'t want to share'],
                            groupValue: transgender,
                            onChanged: (value) {
                              setState(() {
                                transgender = value;
                              });
                            },
                          ),
                          Question(
                            question: 'Do you suffer from a chronic disability?',
                            options: ['Yes', 'No', 'Don\'t want to share'],
                            groupValue: chronicDisability,
                            onChanged: (value) {
                              setState(() {
                                chronicDisability = value;
                              });
                            },
                          ),
                          Question(
                            question: 'Are you an active service member or a veteran?',
                            options: ['Yes', 'No', 'Don\'t want to share'],
                            groupValue: serviceMember,
                            onChanged: (value) {
                              setState(() {
                                serviceMember = value;
                              });
                            },
                          ),
                          Question(
                            question: 'How do you describe your gender identity?',
                            options: ['Man', 'Woman', 'Other', 'Prefer not to say'],
                            groupValue: genderIdentity,
                            onChanged: (value) {
                              setState(() {
                                genderIdentity = value;
                              });
                            },
                          ),
                          MultiSelectQuestion(
                            question: 'How do you describe your racial identity?',
                            options: [
                              'White',
                              'Black',
                              'Native American',
                               ' Alaska Native',
                              'Asian',
                              'Native Hawaiian',
                               ' Other Pacific Islander'
                            ],
                            onChanged: (values) {
                              setState(() {
                                racialIdentity = values;
                              });
                            },
                          ),
                          MultiSelectQuestion(
                            question: 'How do you describe your sexual orientation?',
                            options: ['Option 1', 'Option 2', 'Option 3'],
                            onChanged: (values) {
                              setState(() {
                                sexualOrientation = values;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          // Process the data
                          print('Name: $name');
                          print('Email: $email');
                          print('Transgender: $transgender');
                          print('Chronic Disability: $chronicDisability');
                          print('Service Member: $serviceMember');
                          print('Gender Identity: $genderIdentity');
                          print('Racial Identity: $racialIdentity');
                          print('Sexual Orientation: $sexualOrientation');
                        }
                      },
                      child: Text(
                        'SIGN UP',
                        style: TextStyle(color: Color(0xFF014C72)),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(color: Color(0xFF014C72)), // Add a border to distinguish the button
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Question extends StatelessWidget {
  final String question;
  final List<String> options;
  final String? groupValue;
  final ValueChanged<String?> onChanged;

  Question({
    required this.question,
    required this.options,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF014C72),
            ),
          ),
          Column(
            children: options.map((option) {
              return ListTile(
                title: Text(option),
                leading: Radio<String>(
                  value: option,
                  groupValue: groupValue,
                  onChanged: onChanged,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class MultiSelectQuestion extends StatefulWidget {
  final String question;
  final List<String> options;
  final ValueChanged<List<String>> onChanged;

  MultiSelectQuestion({
    required this.question,
    required this.options,
    required this.onChanged,
  });

  @override
  _MultiSelectQuestionState createState() => _MultiSelectQuestionState();
}

class _MultiSelectQuestionState extends State<MultiSelectQuestion> {
  List<String> selectedOptions = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.question,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF014C72),
            ),
          ),
          Column(
            children: widget.options.map((option) {
              return CheckboxListTile(
                title: Text(option),
                value: selectedOptions.contains(option),
                onChanged: (bool? value) {
                  setState(() {
                    if (value == true) {
                      selectedOptions.add(option);
                    } else {
                      selectedOptions.remove(option);
                    }
                    widget.onChanged(selectedOptions);
                  });
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
