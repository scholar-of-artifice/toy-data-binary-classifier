# toy-data-binary-classifier
Simple program to create basic dataset for binary classification. Written in Swift.

## What can you make?
This program allows you to create a basic dataset for binary classification.
You provide some parameters and it will create a dataset where each sample is a list of numbers from a distribution of your choice.

### Parameters

`save_location`
A string to specify where you want the program to write data.

`population_count`
The number of examples you want to make for a specific set of arguments.

`sample_size`
The size of each list of numbers.

`seed`
A value to seed the random number generator. This allows you to recreate the dataset.

`is_sorted`
A boolean to state if you want the produced list of numbers to be sorted.

`distribution_specs`
A `DistributionParameters` instance that packages the correct `distribution_type` with the corresponding arguments.

### Using the program

In main, we can do something like this:
```swift

/* Create a uniform random distribution */

/* These are the arguments to provide the generator. */
let argsA = UniformArgs(
    min: -1.3,
    max: 5.85
 )

/* Package the distribution parameters */
let dSetA = DistributionParameters(
    distributionType: .uniform,
    params: argsA
)

/*
Produces 10 examples of data.
Each example is a sorted list of 30 numbers from a uniform random distribution where values d[i] fall between -1.3 <= d[i] <= 5.85
*/
makeSamples(
    save_location: "./Data/",
    population_count: 10,
    sample_size: 30,
    seed: 42,
    is_sorted: true,
    distribution_specs: dSetA
)


/* Create a Gaussian random distribution */

/* These are the arguments to provide the generator. */
let argsB = GaussianArgs(
    sigma: 5.0,
    mu: 1.0
 )

/* Package the distribution parameters */
let dSetB = DistributionParameters(
    distributionType: .gaussian,
    params: argsB
)

/*
Produces 10 examples of data.
Each example is a sorted list of 30 numbers from a Gaussian random distribution where values have a known variance and mean.
*/
makeSamples(
    save_location: "./Data/",
    population_count: 10,
    sample_size: 30,
    seed: 42,
    is_sorted: true,
    distribution_specs: dSetB
)

```

`
