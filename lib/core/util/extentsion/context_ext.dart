import 'package:flutter/material.dart';

extension ThemeExt on BuildContext{
  ThemeData theme() => Theme.of(this);

  ColorScheme scheme() => theme().colorScheme;
}