# toy-data-binary-classifier
Program to create basic dataset for binary classification. Written in Swift.

## Problem
Architecting local AI models or calibrating MLX architectures and development pipelines on Apple Silicon, relies on cumbersom data-science stacks across multiple technologies.
Researchers require a precise, lightweight method to forge controlled materials for early-stage testing, benchmarking, etc without being tethered to slow high-level dependencies.

## Solution
This project is a specilized instrument written natively in Swift. It serves as a rapid, dependency-free forge to create basic datasets for binary classification.
This bypasses bloated environments and deterministically generates synthetic numerical data directly on macOS.
Feel free to use this tool for rapid prototyping in your early stage ML pipelines.

## Who is this for?
This tool is crafted for those working at the intersection of local ML and Apple hardware:

### MLX Creators
Engineers seeking lightweight, native data generation to pipe directly into Apple MLX models.

### AI Researchers
Scientists requiring strictly deterministic datasets to benchmark model convergence and recreate anomalies.

### Private Compute Advocates
Developers constructing isolated, on-device pipelines who prefer tools with zero external dependencies.

## Core Mechanisms
The program grants you precise control over the synthesized data through a defined set of parameters. Let's go over a few:

### Distribution Geometry
Utilize `distribution_specs` to define the shape of the data. Currently supports Uniform and Gaussian distributions with configurable arguments.

### Absolute Determinism
A `seed` parameter ensures identical dataset recreation across every run.

### Volume Control
Manipualte `population_count` (total examples in dataset) and `sample_size` (list length) to instantly scale the dimensions of your synthetic materials.

### Sequence Ordering
Toggle the `is_sorted` boolean to automatically order the generated numerical sequence.

### IO Routing
Designate a `save_location` string to write to disk.

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

The following example illustrates how to create a dataset:
- of `100` examples
- where each list is `30` *sorted* values
- where each value is from a *uniform distrubtion*
- and all values fall between `-10.5` and `3.2`

```swift

```
