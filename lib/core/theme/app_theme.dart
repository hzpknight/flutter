import 'package:flutter/material.dart';
import 'package:riverpod_demo/core/theme/app_colors.dart';
import 'package:riverpod_demo/core/theme/app_spacing.dart';
import 'package:riverpod_demo/core/theme/app_typography.dart';

/// Builds [ThemeData] from design tokens — no widget-level color/size literals.
class AppTheme {
  const AppTheme._();

  static ThemeData light() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF1565C0),
      brightness: Brightness.light,
    );
  return _buildTheme(
      colorScheme: colorScheme,
      appColors: AppColors.light,
      typography: AppTypography.light(colorScheme),
    );
  }

  static ThemeData dark() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF1565C0),
      brightness: Brightness.dark,
    );
    return _buildTheme(
      colorScheme: colorScheme,
      appColors: AppColors.dark,
      typography: AppTypography.dark(colorScheme),
    );
  }

  static ThemeData _buildTheme({
    required ColorScheme colorScheme,
    required AppColors appColors,
    required AppTypography typography,
  }) {
    final spacing = AppSpacing.standard;

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      extensions: [
        appColors,
        spacing,
        typography,
      ],
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        titleTextStyle: typography.title,
      ),
      textTheme: TextTheme(
        displayLarge: typography.display,
        titleLarge: typography.title,
        bodyLarge: typography.body,
        labelLarge: typography.label,
        bodySmall: typography.caption,
      ),
      cardTheme: CardThemeData(
        color: colorScheme.surfaceContainerLow,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(spacing.radiusMd),
          side: BorderSide(color: appColors.border),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          textStyle: typography.label,
          padding: EdgeInsets.symmetric(
            horizontal: spacing.md,
            vertical: spacing.sm,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          textStyle: typography.label,
          side: BorderSide(color: appColors.border),
          padding: EdgeInsets.symmetric(
            horizontal: spacing.md,
            vertical: spacing.sm,
          ),
        ),
      ),
    );
  }
}
