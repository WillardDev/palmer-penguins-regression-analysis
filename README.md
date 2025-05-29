## Overview

This project analyzes the Palmer penguins dataset to understand how bill depth relates to bill length across different penguin characteristics. We implement and compare four different regression models of increasing complexity:

1. **Simple Linear Regression** - Basic relationship between bill depth and length
2. **Multiple Regression by Sex** - Different intercepts for male/female penguins
3. **Interaction Model by Sex** - Different intercepts AND slopes by sex
4. **Interaction Model by Species** - Different intercepts AND slopes by species

## Dataset

The analysis uses the `palmerpenguins` R package, which contains data for 344 penguins from three species:
- **Adelie** (*Pygoscelis adeliae*)
- **Chinstrap** (*Pygoscelis antarcticus*) 
- **Gentoo** (*Pygoscelis papua*)

### Key Variables
- `bill_length_mm`: Length of penguin bill in millimeters (response variable)
- `bill_depth_mm`: Depth of penguin bill in millimeters (predictor variable)
- `species`: Penguin species (Adelie, Chinstrap, Gentoo)
- `sex`: Penguin sex (male, female)

## Models Implemented

### Model 1: Simple Linear Regression
```r
bill_length ~ bill_depth
```
- Single regression line for all penguins
- Provides baseline relationship

### Model 2: Additive Model with Sex
```r
bill_length ~ bill_depth + sex
```
- Parallel regression lines by sex
- Different intercepts, same slope

### Model 3: Interaction Model with Sex
```r
bill_length ~ bill_depth * sex
```
- Separate regression lines by sex
- Different intercepts AND slopes

### Model 4: Interaction Model with Species
```r
bill_length ~ bill_depth * species
```
- Separate regression lines by species
- Most comprehensive biological grouping

## Statistical Methods

The analysis includes:
- **Parameter Estimation**: Intercepts and slopes for each model
- **Point Predictions**: Expected values for specific bill depths
- **Confidence Intervals**: For mean responses at given predictor values
- **Prediction Intervals**: For individual observations
- **Hypothesis Testing**: Significance of model parameters
- **Model Comparison**: Evaluating which model best describes the data

## Files

- `STAT311-HW8.R`: Complete R script with all four regression models
- `README.md`: This documentation file
- `assignment-description.pdf`: Original homework assignment details

## Requirements

### R Packages
```r
install.packages("palmerpenguins")
library(palmerpenguins)
```

### R Version
- R 4.0.0 or higher recommended
- Base R statistical functions (no additional packages required beyond palmerpenguins)

## Usage

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourusername/palmer-penguins-regression-analysis.git
   cd palmer-penguins-regression-analysis
   ```

2. **Install required packages:**
   ```r
   install.packages("palmerpenguins")
   ```

3. **Run the analysis:**
   ```r
   source("STAT311-HW8.R")
   ```

4. **View the data (optional):**
   ```r
   # Uncomment the plotting function to visualize data
   # makeplot()
   ```

## Key Findings

- **Positive Relationship**: All models show a positive relationship between bill depth and bill length
- **Species Differences**: Significant variation exists between penguin species in both intercepts and slopes
- **Sex Differences**: Males and females show different baseline bill lengths
- **Model Performance**: The species-based interaction model (Model 4) likely provides the best fit due to capturing biological differences between species

## Statistical Insights

### Confidence vs Prediction Intervals
- **Confidence intervals**: Narrower, represent uncertainty in the mean response
- **Prediction intervals**: Wider, account for individual variation around the mean

### Parameter Significance
- All models show statistically significant relationships between bill depth and length
- Species-based groupings capture more biological variation than sex-based groupings

## Academic Context

This analysis was completed as part of STAT 311 coursework, focusing on:
- Linear regression modeling
- Model comparison and selection
- Statistical inference (confidence intervals, hypothesis testing)
- R programming for statistical analysis

## Contributing

This is an academic project, but suggestions for improving the analysis or extending the models are welcome through issues or pull requests.

## License

This project is for educational purposes. The Palmer penguins dataset is provided under the CC0 license.

## References

- Horst AM, Hill AP, Gorman KB (2020). palmerpenguins: Palmer Archipelago (Antarctica) penguin data. R package version 0.1.0.
- Gorman KB, Williams TD, Fraser WR (2014). Ecological Sexual Dimorphism and Environmental Variability within a Community of Antarctic Penguins (Genus Pygoscelis). PLoS ONE 9(3): e90081.
