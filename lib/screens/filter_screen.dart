import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String? selectedUniversity;
  String? selectedDate;
  String? selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Events'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton<String>(
              value: selectedUniversity,
              hint: const Text('Select University'),
              isExpanded: true,
              onChanged: (String? newValue) {
                setState(() {
                  selectedUniversity = newValue;
                });
              },
              items: <String>['All Universities', 'AUST', 'DIU', 'UIU']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: selectedDate,
              hint: const Text('Select Date'),
              isExpanded: true,
              onChanged: (String? newValue) {
                setState(() {
                  selectedDate = newValue;
                });
              },
              items: <String>['All Dates', '2025-04-10', '2025-04-15', '2025-04-20', '2025-04-25', '2025-04-30', '2025-05-05']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: selectedCategory,
              hint: const Text('Select Category'),
              isExpanded: true,
              onChanged: (String? newValue) {
                setState(() {
                  selectedCategory = newValue;
                });
              },
              items: <String>['All Categories', 'Job Fair', 'Research', 'Tour', 'Contest', 'Workshop', 'Career', 'Design']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Send the filter results back to the HomePage
                Navigator.pop(context, {
                  'university': selectedUniversity ?? 'All Universities',
                  'date': selectedDate ?? 'All Dates',
                  'category': selectedCategory ?? 'All Categories',
                });
              },
              child: const Text('Apply Filters'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
            ),
          ],
        ),
      ),
    );
  }
}
