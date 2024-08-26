import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maze_app/feature/tracker/domain/entity/entry.dart';
import 'package:maze_app/feature/tracker/presentation/bloc/tracker_bloc.dart';

@RoutePage()
class NewEntryPage extends StatefulWidget {
  const NewEntryPage({super.key});

  @override
  State<NewEntryPage> createState() => _NewEntryPageState();
}

class _NewEntryPageState extends State<NewEntryPage> {
  bool _greensSelected = false;
  bool _brownsSelected = false;
  bool _mixed = false;
  String _compostUse = 'General note';
  String _date = '';
  String _binFullness = '';
  String _amountEmptied = '';
  bool _donated = false;
  String _givenToFriend = '';
  String? _photo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Entry'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Entry type (already specified as "Added waste")
            const Text('Entry Type: Added Waste'),

            // Waste types
            CheckboxListTile(
              title: const Text('Greens (Kitchen scraps)'),
              value: _greensSelected,
              onChanged: (value) {
                setState(() {
                  _greensSelected = value!;
                });
              },
            ),
            CheckboxListTile(
              title: const Text('Browns (Dry yard waste)'),
              value: _brownsSelected,
              onChanged: (value) {
                setState(() {
                  _brownsSelected = value!;
                });
              },
            ),

            // Mixed option
            SwitchListTile(
              title: const Text('Mixed'),
              value: _mixed,
              onChanged: (value) {
                setState(() {
                  _mixed = value;
                });
              },
            ),

            // Compost use
            DropdownButtonFormField<String>(
              value: _compostUse,
              onChanged: (value) {
                setState(() {
                  _compostUse = value!;
                });
              },
              items: <String>['General note', 'My garden', 'Other']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),

            // Additional fields
            TextField(
              decoration: const InputDecoration(
                labelText: 'Date',
              ),
              onChanged: (value) {
                _date = value;
              },
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'How full was bin/compost before emptying it?',
              ),
              onChanged: (value) {
                _binFullness = value;
              },
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Amount of compost emptied out',
              ),
              onChanged: (value) {
                _amountEmptied = value;
              },
            ),
            CheckboxListTile(
              title: const Text('Donated'),
              value: _donated,
              onChanged: (value) {
                setState(() {
                  _donated = value!;
                });
              },
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Gave it to a friend of mine who needed some soil',
              ),
              onChanged: (value) {
                _givenToFriend = value;
              },
            ),

            // Photos
            // ... Add code for photo selection or capture

            // Save button
            ElevatedButton(
              onPressed: () {
                // final entry = Entry(
                //     whatRecycled: whatRecycled,
                //     whatDidAdd: whatDidAdd,
                //     compostUsed: compostUsed,
                //     entryDate: entryDate,
                //     binId: binId,
                //     type: type,
                //     mixed: mixed,
                //     note: note,
                //     photo: photo,
                //     howFull: howFull,
                //     amount: amount);
                // context
                //     .read<TrackerBloc>()
                //     .add(TrackerEvent.addEntryToBin(binId: "", entryDetails: entry));
                // Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
