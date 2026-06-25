import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Global counter state managed by Riverpod.
class CounterNotifier extends Notifier<int> {
  @override
  int build() => 0;

  void increment() => state = state + 1;

  void decrement() => state = state - 1;
}

final counterProvider = NotifierProvider<CounterNotifier, int>(
  CounterNotifier.new,
);
