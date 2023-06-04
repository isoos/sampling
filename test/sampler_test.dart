import 'package:sampling/src/sampler.dart';
import 'package:test/test.dart';

void main() {
  group('IntSampler', () {
    test('A few numbers', () {
      final sampler = IntSampler();
      sampler.addAll([1, 2, 3, 4, 5]);
      expect(sampler.min, 1);
      expect(sampler.max, 5);
      expect(sampler.sum, 15);
      expect(sampler.totalCount, 5);
    });

    test('Delegating', () {
      final sampler = IntSampler();
      sampler.addAll(List.generate(20, (i) => i));
      expect(sampler.min, 0);
      expect(sampler.max, 19);
      expect(sampler.sum, 190);
      expect(sampler.totalCount, 20);
    });
  });
}
