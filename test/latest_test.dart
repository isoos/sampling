import 'package:sampling/src/latest.dart';
import 'package:test/test.dart';

void main() {
  group('LatestSampler', () {
    test('Less than the limit', () {
      final sampler = LatestSampler<int>(10);
      sampler.addAll([1, 2, 3, 4, 5]);
      expect(sampler.getSample(), [1, 2, 3, 4, 5]);
    });

    test('One over the limit', () {
      final sampler = LatestSampler<int>(10);
      sampler.addAll(List.generate(11, (i) => i));
      expect(sampler.getSample(), hasLength(10));
      expect(sampler.getSample(), [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
    });

    test('10x sampling', () {
      final sampler = LatestSampler<int>(10);
      sampler.addAll(List.generate(100, (i) => i));
      expect(sampler.getSample(), hasLength(10));
      expect(sampler.getSample(), [90, 91, 92, 93, 94, 95, 96, 97, 98, 99]);
    });
  });
}
