import 'package:flutter/material.dart';
import 'package:riverpod_demo/core/theme/app_colors.dart';
import 'package:riverpod_demo/core/theme/app_spacing.dart';
import 'package:riverpod_demo/core/theme/app_typography.dart';

extension ThemeContextX on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colorScheme => theme.colorScheme;

  AppColors get appColors => theme.extension<AppColors>()!;

  AppSpacing get spacing => theme.extension<AppSpacing>()!;

  AppTypography get typography => theme.extension<AppTypography>()!;
}
