import 'package:flutter/material.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/presentation/widget/custom_text_field.dart';
import 'package:maze_app/core/style/app_theme.dart';
import 'package:maze_app/core/util/extentsion/context_ext.dart';
import 'package:maze_app/feature/tracker/domain/entity/compost_use.dart';
import 'package:maze_app/feature/tracker/presentation/widgets/tracker_widgets.dart';

class CompostUseSheet extends StatefulWidget {
  final List<CompostUseItem> selectedItems;

  const CompostUseSheet({super.key, required this.selectedItems});

  @override
  _CompostUseSheetState createState() => _CompostUseSheetState();
}

class _CompostUseSheetState extends State<CompostUseSheet> {
  late List<CompostUseItem> items;
  final TextEditingController _noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeItems();
  }

  void _initializeItems() {
    // Example initialization (replace with your actual data)
    items = [
      CompostUseItem(name: 'My garden'),
      CompostUseItem(name: 'Donated'),
      CompostUseItem(name: 'Other'),
    ];

    // Update items based on the pre-selected items
    for (var item in items) {
      item.isSelected = widget.selectedItems.contains(item);
    }

    // If 'Other' was previously selected, pre-fill the note field
    CompostUseItem otherItem = items.firstWhere(
      (item) => item.name == 'Other',
      orElse: () =>
          CompostUseItem(name: 'Other', isSelected: false), // Fallback item
    );

    if (otherItem.isSelected) {
      _noteController.text = otherItem.note ?? '';
    }
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Determine if the "Other" item is selected
    bool isOtherSelected =
        items.any((item) => item.name == 'Other' && item.isSelected);

    return Container(
      padding: const EdgeInsets.all(16.0),
      height: MediaQuery.of(context).size.height * 0.53,
      child: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10.dg),
              decoration: BoxDecoration(
                color: context.scheme().neutralsBackground,
                border:
                    Border.all(color: context.scheme().neutralsBorderDivider),
                borderRadius: const BorderRadius.all(
                    Radius.circular(Dimen.defaultRadius)),
              ),
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  if (isOtherSelected && index == items.length - 1) {
                    return const SizedBox.shrink();
                  }
                  return const CustomeDivider();
                },
                itemCount: items.length +
                    (isOtherSelected
                        ? 1
                        : 0), // Add extra item if "Other" is selected
                itemBuilder: (context, index) {
                  // Check if we are at the last item, which is the note field
                  if (isOtherSelected && index == items.length) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: CustomTextField.outline(
                        textEditingController: _noteController,
                        maxLines: 5,
                      ),
                    );
                  } else {
                    return _buildItemTile(items[index]);
                  }
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
          'Compost Use',
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
    List<CompostUseItem> selectedItems = [];

    for (var item in items) {
      if (item.isSelected) {
        if (item.name == 'Other') {
          // Save the note if "Other" is selected
          item.note = _noteController.text;
        }
        selectedItems.add(item);
      }
    }

    Navigator.pop(context, selectedItems);
  }

  Widget _buildItemTile(CompostUseItem item) {
    return CheckboxListTile(
      title: Text(item.name),
      value: item.isSelected,
      onChanged: (bool? newValue) {
        setState(() {
          item.isSelected = newValue ?? false;
        });
      },
    );
  }
}
