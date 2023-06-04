import 'dart:math';

import 'package:sampling/sampling.dart';

void main() {
  final sampler = ReservoirSampler(25, random: Random.secure());
  sampler.addAll(List.generate(10000, (i) => i));
  print(sampler.getSample());
}
