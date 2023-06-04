import 'dart:math';

import 'package:sampling/src/sampler.dart';

/// Reservoir sampler following the algorithm in
/// https://en.wikipedia.org/wiki/Reservoir_sampling
class ReservoirSampler<T> extends SamplerBase<T> {
  final List<T> _items = [];
  final int _limit;
  final Random _random;
  int _totalCount = 0;

  ReservoirSampler(int limit, {Random? random})
      : _limit = limit,
        _random = random ?? Random.secure();

  @override
  void add(T item) {
    super.add(item);
    _totalCount++;
    if (_totalCount <= _limit) {
      _items.add(item);
      return;
    }
    final index = _random.nextInt(_totalCount);
    if (index < _limit) {
      _items[index] = item;
    }
  }

  /// The current sample, with the active (non-copy) backing list.
  List<T> getSample() => _items;
}
