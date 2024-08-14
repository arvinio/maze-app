import 'package:flutter/material.dart';

class EmptyListWidget extends StatefulWidget {
  const EmptyListWidget({super.key});

  @override
  State<EmptyListWidget> createState() => _EmptyListWidgetState();
}

class _EmptyListWidgetState extends State<EmptyListWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 38,
                height: 38,
                child: CircularProgressIndicator(
                    strokeWidth: 3.8,
                    valueColor:
                    AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)),
              ),
              const SizedBox(height: 28),
            ],
          ),
        ));
  }
}
