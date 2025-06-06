import 'package:flutter/material.dart';

class AddEventPage extends StatefulWidget {
  final Function(Map<String, String>) onAddEvent;   // function to pass data

  AddEventPage({required this.onAddEvent});

  @override
  _AddEventPageState createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  final _formKey = GlobalKey<FormState>();

  String title = '';
  String description = '';
  String date = '';
  String time = '';
  String category = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Event'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Title'),
                  onChanged: (value) => title = value,
                  validator: (value) => value!.isEmpty ? 'Enter Title' : null,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Description'),
                  onChanged: (value) => description = value,
                  validator: (value) => value!.isEmpty ? 'Enter Description' : null,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Date'),
                  onChanged: (value) => date = value,
                  validator: (value) => value!.isEmpty ? 'Enter Date' : null,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Time'),
                  onChanged: (value) => time = value,
                  validator: (value) => value!.isEmpty ? 'Enter Time' : null,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Category'),
                  onChanged: (value) => category = value,
                  validator: (value) => value!.isEmpty ? 'Enter Category' : null,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      widget.onAddEvent({   // sending data back
                        'title': title,
                        'description': description,
                        'date': date,
                        'time': time,
                        'category': category,
                      });

                      Navigator.pop(context); // go back to Home

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Event Added Successfully!'),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Save Event',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
