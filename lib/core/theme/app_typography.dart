import 'package:flutter/material.dart';

/// Typography tokens mapped to [TextTheme] roles.
@immutable
class AppTypography extends ThemeExtension<AppTypography> {
  const AppTypography({
    required this.display,
    required this.title,
    required this.body,
    required this.label,
    required this.caption,
  });

  final TextStyle display;
  final TextStyle title;
  final TextStyle body;
  final TextStyle label;
  final TextStyle caption;

  static AppTypography light(ColorScheme scheme) => AppTypography(
        display: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: scheme.onSurface,
        ),
        title: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: scheme.onSurface,
        ),
        body: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: scheme.onSurface,
        ),
        label: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: scheme.onSurfaceVariant,
        ),
        caption: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: scheme.onSurfaceVariant,
        ),
      );

  static AppTypography dark(ColorScheme scheme) => light(scheme);

  @override
  AppTypography copyWith({
    TextStyle? display,
    TextStyle? title,
    TextStyle? body,
    TextStyle? label,
    TextStyle? caption,
  }) {
    return AppTypography(
      display: display ?? this.display,
      title: title ?? this.title,
      body: body ?? this.body,
      label: label ?? this.label,
      caption: caption ?? this.caption,
    );
  }

  @override
  AppTypography lerp(ThemeExtension<AppTypography>? other, double t) {
    if (other is! AppTypography) return this;
    return AppTypography(
      display: TextStyle.lerp(display, other.display, t)!,
      title: TextStyle.lerp(title, other.title, t)!,
      body: TextStyle.lerp(body, other.body, t)!,
      label: TextStyle.lerp(label, other.label, t)!,
      caption: TextStyle.lerp(caption, other.caption, t)!,
    );
  }
}
