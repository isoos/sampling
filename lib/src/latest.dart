import 'dart:collection';

import 'package:sampling/src/sampler.dart';

/// Keeps the latest N items in the sample.
class LatestSampler<T> extends SamplerBase<T> {
  final int _limit;
  final Queue<T> _items = new Queue();

  LatestSampler(int limit) : _limit = limit;

  @override
  void add(T item) {
    super.add(item);
    if (_items.length >= _limit) {
      _items.removeFirst();
    }
    _items.add(item);
  }

  /// The current sample.
  List<T> getSample() => _items.toList();
}
