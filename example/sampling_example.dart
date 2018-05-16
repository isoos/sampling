import 'dart:math';

import 'package:sampling/sampling.dart';

void main() {
  final sampler = new ReservoirSampler(25, random: new Random.secure());
  sampler.addAll(new List.generate(10000, (i) => i));
  print(sampler.getSample());
}
