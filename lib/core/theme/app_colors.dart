import 'package:flutter/material.dart';

/// Semantic color tokens consumed via [ThemeExtension].
@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.success,
    required this.onSuccess,
    required this.surfaceMuted,
    required this.border,
  });

  final Color success;
  final Color onSuccess;
  final Color surfaceMuted;
  final Color border;

  static const AppColors light = AppColors(
    success: Color(0xFF2E7D32),
    onSuccess: Color(0xFFFFFFFF),
    surfaceMuted: Color(0xFFF5F5F5),
    border: Color(0xFFE0E0E0),
  );

  static const AppColors dark = AppColors(
    success: Color(0xFF81C784),
    onSuccess: Color(0xFF1B1B1B),
    surfaceMuted: Color(0xFF2C2C2C),
    border: Color(0xFF424242),
  );

  @override
  AppColors copyWith({
    Color? success,
    Color? onSuccess,
    Color? surfaceMuted,
    Color? border,
  }) {
    return AppColors(
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      surfaceMuted: surfaceMuted ?? this.surfaceMuted,
      border: border ?? this.border,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      success: Color.lerp(success, other.success, t)!,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t)!,
      surfaceMuted: Color.lerp(surfaceMuted, other.surfaceMuted, t)!,
      border: Color.lerp(border, other.border, t)!,
    );
  }
}
