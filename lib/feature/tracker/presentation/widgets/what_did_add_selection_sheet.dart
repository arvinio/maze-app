import 'package:flutter/material.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/feature/tracker/domain/entity/what_did_add.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';

class WhatDidYouAddSheet extends StatefulWidget {
  final List<WhatDidAddItem> selectedItems;

  const WhatDidYouAddSheet({super.key, required this.selectedItems});

  @override
  _WhatDidYouAddSheetState createState() => _WhatDidYouAddSheetState();
}

class _WhatDidYouAddSheetState extends State<WhatDidYouAddSheet> {
  late List<WhatDidAdd> categories;

  @override
  void initState() {
    super.initState();
    // Initialize categories here (omitted for brevity)
    _initializeCategories();
  }

  void _initializeCategories() {
    // Example initialization (replace with your actual data)
    categories = [
      WhatDidAdd(
        name: 'Greens',
        items: [
          WhatDidAddItem(
              name: 'Kitchenscraps', description: 'Fruits, Vegetables, etc.'),
          WhatDidAddItem(
              name: 'Fresh yard waste',
              description: 'Grass clippings, plant trimmings, etc.'),
          WhatDidAddItem(name: 'Other', description: ''),
        ],
      ),
      WhatDidAdd(
        name: 'Browns',
        items: [
          WhatDidAddItem(
              name: 'Paper products',
              description: 'Newspaper, cardboard, napkins, etc.'),
          WhatDidAddItem(
              name: 'Dry yard waste',
              description: 'Straw, dry grass, wood chips, dead plants, etc.'),
          WhatDidAddItem(name: 'Other', description: ''),
        ],
      ),
    ];

    // Update items based on the pre-selected items
    for (var category in categories) {
      for (var item in category.items) {
        item.isSelected = widget.selectedItems.contains(item);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      height: MediaQuery.of(context).size.height * 0.7,
      child: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: context.scheme().neutralsBackground,
                border:
                    Border.all(color: context.scheme().neutralsBorderDivider),
                borderRadius: const BorderRadius.all(
                    Radius.circular(Dimen.defaultRadius)),
              ),
              child: ListView.separated(
                separatorBuilder: (context, index) => CustomDivider(),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return _buildCategoryTile(categories[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        Text(
          'What did you add?',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: () {
            _handleSaveAction();
          },
          child: Text('Save', style: TextStyle(color: Colors.green)),
        ),
      ],
    );
  }

  void _handleSaveAction() {
    List<WhatDidAddItem> selectedItems = [];

    for (var category in categories) {
      for (var item in category.items) {
        if (item.isSelected) {
          selectedItems.add(item);
        }
      }
    }

    Navigator.pop(context, selectedItems);
  }

  Widget _buildCategoryTile(WhatDidAdd category) {
    return ListTileTheme(
      child: ExpansionTile(
        initiallyExpanded: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(color: Colors.transparent),
        ),
        tilePadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        title:
            Text(category.name, style: TextStyle(fontWeight: FontWeight.bold)),
        children: category.items.asMap().entries.map((entry) {
          int index = entry.key;
          WhatDidAddItem item = entry.value;
          return Column(
            children: [
              _buildItemTile(item),
              if (index < category.items.length - 1) CustomDivider(),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildItemTile(WhatDidAddItem item) {
    return CheckboxListTile(
      title: Text(item.name),
      subtitle: item.description.isNotEmpty ? Text(item.description) : null,
      value: item.isSelected,
      onChanged: (bool? newValue) {
        setState(() {
          item.isSelected = newValue ?? false;
        });
      },
    );
  }
}
