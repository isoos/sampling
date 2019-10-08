# Dart library for sampling items

Various algorithms for selection of a subset (a statistical sample) of individuals from within
a statistical population to estimate characteristics of the whole population. This can be useful
for tracking and sampling a stream of values.

Current algorithms:

- latest N item
- reservoir sampling (fair random sampling)

It can also track basic statistics of integer populations.

## Usage

A simple usage example:

    final sampler = new ReservoirSampler(25, random: new Random.secure());
    sampler.addAll(new List.generate(10000, (i) => i));
    print(sampler.getSample());
