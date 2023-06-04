import 'dart:math';

import 'package:sampling/src/reservoir.dart';
import 'package:test/test.dart';

void main() {
  group('ReservoirSampler', () {
    test('Less than the limit', () {
      final sampler = ReservoirSampler<int>(10);
      sampler.addAll([1, 2, 3, 4, 5]);
      expect(sampler.getSample(), [1, 2, 3, 4, 5]);
    });

    test('One over the limit', () {
      final sampler = ReservoirSampler<int>(10, random: Random(123));
      sampler.addAll(List.generate(11, (i) => i));
      expect(sampler.getSample(), hasLength(10));
      expect(sampler.getSample(), [0, 1, 2, 3, 4, 5, 6, 7, 8, 10]);
    });

    test('10x sampling', () {
      final sampler = ReservoirSampler<int>(10, random: Random(123));
      sampler.addAll(List.generate(100, (i) => i));
      expect(sampler.getSample(), hasLength(10));
      expect(sampler.getSample(), [92, 44, 45, 93, 4, 76, 79, 7, 21, 19]);
    });
  });
}
