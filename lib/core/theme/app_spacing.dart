import 'package:flutter/material.dart';

/// Spacing and radius design tokens.
@immutable
class AppSpacing extends ThemeExtension<AppSpacing> {
  const AppSpacing({
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
    required this.radiusSm,
    required this.radiusMd,
    required this.radiusLg,
  });

  final double xs;
  final double sm;
  final double md;
  final double lg;
  final double xl;
  final double radiusSm;
  final double radiusMd;
  final double radiusLg;

  static const AppSpacing standard = AppSpacing(
    xs: 4,
    sm: 8,
    md: 16,
    lg: 24,
    xl: 32,
    radiusSm: 8,
    radiusMd: 12,
    radiusLg: 16,
  );

  @override
  AppSpacing copyWith({
    double? xs,
    double? sm,
    double? md,
    double? lg,
    double? xl,
    double? radiusSm,
    double? radiusMd,
    double? radiusLg,
  }) {
    return AppSpacing(
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      radiusSm: radiusSm ?? this.radiusSm,
      radiusMd: radiusMd ?? this.radiusMd,
      radiusLg: radiusLg ?? this.radiusLg,
    );
  }

  @override
  AppSpacing lerp(ThemeExtension<AppSpacing>? other, double t) {
    if (other is! AppSpacing) return this;
    return AppSpacing(
      xs: lerpDouble(xs, other.xs, t)!,
      sm: lerpDouble(sm, other.sm, t)!,
      md: lerpDouble(md, other.md, t)!,
      lg: lerpDouble(lg, other.lg, t)!,
      xl: lerpDouble(xl, other.xl, t)!,
      radiusSm: lerpDouble(radiusSm, other.radiusSm, t)!,
      radiusMd: lerpDouble(radiusMd, other.radiusMd, t)!,
      radiusLg: lerpDouble(radiusLg, other.radiusLg, t)!,
    );
  }
}

double? lerpDouble(double a, double b, double t) => a + (b - a) * t;
