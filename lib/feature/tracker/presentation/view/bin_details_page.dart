import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:maze_app/feature/tracker/domain/entity/chart_data.dart';
import 'package:maze_app/feature/tracker/domain/entity/bin.dart';
import 'package:maze_app/feature/tracker/domain/entity/entry.dart';

@RoutePage()
class BinDetailsPage extends StatelessWidget {
  final Bin bin;
  final List<EditEntry> entries;

  const BinDetailsPage({super.key, required this.bin, required this.entries});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(bin.nickName),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              _showOptions(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildBinDetails(),
          _buildCompostChart(),
          _buildEntriesList(),
        ],
      ),
    );
  }

  Widget _buildBinDetails() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Image.network(bin.imageUrl ?? ''),
          Text(bin.nickName,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(bin.type.toString().split('.').last),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildDetailCard(
                  'Bin size', '${bin.amountOfLiters ?? 'N/A'} Litres'),
              _buildDetailCard('Total', '${bin.totalAmount ?? 'N/A'} kg'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailCard(String title, String value) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 4),
            Text(value),
          ],
        ),
      ),
    );
  }

  Widget _buildCompostChart() {
    // Implement the chart display here based on bin.chartData
    return Container(); // Placeholder
  }

  Widget _buildEntriesList() {
    return Expanded(
      child: ListView.builder(
        itemCount: entries.length,
        itemBuilder: (context, index) {
          final entry = entries[index];
          return ListTile(
            leading: Icon(_getEntryIcon(entry.type)),
            title: Text(
                '${entry.entryDate.day} ${_getMonthName(entry.entryDate.month)} ${entry.entryDate.year}'),
            subtitle: Text(
                entry.type.toString().split('.').last.replaceAll('-', ' ')),
            onTap: () {
              // Handle entry tap
            },
          );
        },
      ),
    );
  }

  IconData _getEntryIcon(EntryType type) {
    switch (type) {
      case EntryType.emptiedBin:
        return Icons.delete_outline;
      case EntryType.generalNote:
        return Icons.note_outlined;
      case EntryType.addedWaste:
        return Icons.add_circle_outline;
      case EntryType.emptiedCompost:
        return Icons.restore_from_trash_outlined;
      default:
        return Icons.info_outline;
    }
  }

  String _getMonthName(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[month - 1];
  }

  void _showOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.edit),
                title: Text('Edit details'),
                onTap: () {
                  // Handle edit
                },
              ),
              ListTile(
                leading: Icon(Icons.notifications_off),
                title: Text('Mute notifications'),
                onTap: () {
                  // Handle mute notifications
                },
              ),
              ListTile(
                leading: Icon(Icons.delete, color: Colors.red),
                title: Text('Delete ${bin.nickName}'),
                onTap: () {
                  // Handle delete
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
