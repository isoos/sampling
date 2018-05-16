import 'package:test/test.dart';

import 'package:sampling/src/sampler.dart';

void main() {
  group('IntSampler', () {
    test('A few numbers', () {
      final sampler = new IntSampler();
      sampler.addAll([1, 2, 3, 4, 5]);
      expect(sampler.min, 1);
      expect(sampler.max, 5);
      expect(sampler.sum, 15);
      expect(sampler.totalCount, 5);
    });

    test('Delegating', () {
      final sampler = new IntSampler();
      sampler.addAll(new List.generate(20, (i) => i));
      expect(sampler.min, 0);
      expect(sampler.max, 19);
      expect(sampler.sum, 190);
      expect(sampler.totalCount, 20);
    });
  });
}
