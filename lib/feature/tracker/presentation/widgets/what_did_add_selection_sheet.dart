import 'package:flutter/material.dart';
import 'package:maze_app/core/config/assets/assets.dart';
import 'package:maze_app/core/config/dimen.dart';
import 'package:maze_app/core/config/strings.dart';
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
        name: appStrings.greens,
        items: [
          WhatDidAddItem(
              name: appStrings.kitchenScraps, description: appStrings.fruits),
          WhatDidAddItem(
              name: appStrings.freshYardWaste,
              description: appStrings.grassClippings),
          WhatDidAddItem(name:appStrings.other, description: ''),
        ],
      ),
      WhatDidAdd(
        name: appStrings.browns,
        items: [
          WhatDidAddItem(
              name: appStrings.paperProducts,
              description: appStrings.newspaper),
          WhatDidAddItem(
              name: appStrings.dryYardWaste,
              description:appStrings.straw),
          WhatDidAddItem(name: appStrings.other, description: ''),
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
         const SizedBox(height: 10),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: context.scheme().neutralsBackground,
                border:
                    Border.all(color: context.scheme().neutralsBorderDivider),
                borderRadius: const BorderRadius.all(
                    Radius.circular(Dimen.defaultRadius)),
              ),
              child: ListView.separated(
                separatorBuilder: (context, index) => CustomDivider(indent: 10.w,endIndent: 10.w),
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
      //  appAssets.close.svg(width: 24,height: 24),
        IconButton(
          icon: appAssets.close.svg(width: 24,height: 24),
          padding: const EdgeInsets.only(top:10),
          alignment: Alignment.topLeft,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        CustomText(
         appStrings.whatDidYouAdd,
          style:context.titleHeadline,
        ),
        TextButton(
          onPressed: () {
            _handleSaveAction();
          },
          child: CustomText(appStrings.save, style: context.titleHeadline.copyWith(color: context.scheme().primary)),
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
        trailing: appAssets.dropDown.svg(),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(color: Colors.transparent),
        ),
        tilePadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        title:
            CustomText(category.name, style: context.bodyBody),
        children: category.items.asMap().entries.map((entry) {
          int index = entry.key;
          WhatDidAddItem item = entry.value;
          return Column(
            children: [
              CustomDivider(indent: 10.w,endIndent: 10.w,),
              _buildItemTile(item)
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildItemTile(WhatDidAddItem item) {
    return CheckboxListTile(
      title: CustomText(item.name, style: context.bodyBody),
      subtitle: item.description.isNotEmpty
          ?  CustomText(item.description, style: context.footnoteFootnote.copyWith(color: context.scheme().secondaryText))
          : null,
      side:  BorderSide(color:context.scheme().tertiaryText,width: 2),
      contentPadding: const EdgeInsets.only(left: 15,right: 0),
      value: item.isSelected,
      onChanged: (bool? newValue) {
        setState(() {
          item.isSelected = newValue ?? false;
        });
      },

    );
  }
}
