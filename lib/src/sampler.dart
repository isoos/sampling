/// Select a subset (a statistical sample) of items.
abstract class Sampler<T> {
  /// The total number of items added to the sampler.
  int get totalCount;

  /// Add an item to the sampler.
  void add(T item);

  /// Add multiple items to the sampler.
  void addAll(Iterable<T> items);
}

class SamplerBase<T> implements Sampler<T> {
  int _totalCount = 0;

  @override
  int get totalCount => _totalCount;

  @override
  void add(T item) {
    _totalCount++;
  }

  @override
  void addAll(Iterable<T> items) {
    items?.forEach(add);
  }
}

class ComparableSampler<T extends Comparable> extends SamplerBase<T> {
  T _min;
  T _max;

  T get min => _min;
  T get max => _max;

  @override
  void add(T item) {
    super.add(item);
    _min ??= item;
    _max ??= item;
    if (_min.compareTo(item) > 0) {
      _min = item;
    }
    if (_max.compareTo(item) < 0) {
      _max = item;
    }
  }
}

class IntSampler extends ComparableSampler<int> {
  int _sum = 0;

  int get sum => _sum;
  double get avg => _sum / totalCount;

  @override
  void add(int item) {
    super.add(item);
    _sum += item;
  }
}

class CompositeSampler<T> extends SamplerBase<T> {
  final List<Sampler<T>> _samplers;
  CompositeSampler(this._samplers);

  @override
  void add(T item) {
    super.add(item);
    _samplers.forEach((s) => s.add(item));
  }
}
