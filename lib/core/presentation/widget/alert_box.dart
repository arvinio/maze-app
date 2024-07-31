/*import 'package:flutter/material.dart';

/// Define a generic alert box to show a warning message
class AlertBox extends StatefulWidget {
  const AlertBox({
    Key? key,
    required this.title,
    required this.description,
    this.icon,
    required this.onTapYes,
  }) : super(key: key);

  final String title;
  final String description;
  final String? icon;
  final Function onTapYes;

  @override
  _AlertBoxState createState() => _AlertBoxState();
}

class _AlertBoxState extends ResourcefulState<AlertBox> {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Container(
      width: 90.w,
      padding: EdgeInsets.all(2.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.icon != null) icon(),
          Expanded(child: content()),
        ],
      ),
    );
  }

  Widget icon() {
    return Card(
      surfaceTintColor: Colors.transparent,
      shape: AppShapes.rectangleMild,
      color: AppColors.colors.warning,
      elevation: 4,
      child: ImageUtils.fromLocal(
        widget.icon ?? 'assets/icon/lamp.svg',
        color: AppColors.colors.primary,
        width: 8.w,
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
      ),
    );
  }

  Widget content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: typography.titleLarge?.copyWith(
            fontFamily: fontFamily.medium(),
            color: AppColors.colors.focusedText,
          ),
        ),
        const Space(height: 6),
        Text(
          widget.description,
          style: typography.bodyLarge?.copyWith(
            fontFamily: fontFamily.medium(),
            color: AppColors.colors.focusedText.withOpacity(0.7),
          ),
        ),
        Space(height: 3.h),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: MaterialButton(
                  onPressed: () => widget.onTapYes.call(),
                  height: 8.h,
                  color: AppColors.colors.primary,
                  shape: AppShapes.rectangleMedium
                      .copyWith(borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    intl.yes,
                    style: typography.labelLarge!
                        .copyWith(color: AppColors.colors.white),
                  ),
                ),
              ),
              Space(width: 2.w),
              Expanded(
                child: MaterialButton(
                  onPressed: () => Navigator.pop(context),
                  height: 8.h,
                  shape: AppShapes.rectangleMedium.copyWith(
                      borderRadius: BorderRadius.circular(50),
                      side: BorderSide(color: AppColors.colors.purple, width: 2)),
                  child: Text(
                    intl.no,
                    style: typography.labelLarge!
                        .copyWith(color: AppColors.colors.purple),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
*/