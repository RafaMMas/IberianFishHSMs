library(Rcpp)

cppFunction('
#include <Rcpp.h>
#include <cmath>  // For exp()
using namespace Rcpp;

// Sigmoid function
double sigmoid(double x, double a, double b, double k = 10.0) {
    return 1.0 / (1.0 + exp(-k * (x - (a + b) / 2.0)));
}

// True pi membership function
double pi_membership(double x, double a, double b, double c, double d, double k = 10.0) {
    if (x <= a || x >= d) return 0.0;
    if (x > a && x <= (a+b)/2.0) return sigmoid(x, a, b, k);
    if (x > (a+b)/2.0 && x < (c+d)/2.0) return 1.0;
    if (x >= (c+d)/2.0 && x < d) return 1.0 - sigmoid(x, c, d, k);
    return 0.0;
}

// [[Rcpp::export]]
NumericMatrix evaluate_membership(NumericMatrix data, NumericMatrix params) {
    int numRows = data.nrow();
    int numCols = data.ncol();
    
    NumericMatrix membership_values(numRows, numCols);
    
    for (int i = 0; i < numRows; i++) {
        for (int j = 0; j < numCols; j++) {
            // Get membership function parameters
            double a = params(j, 0);
            double b = params(j, 1);
            double c = params(j, 2);
            double d = params(j, 3);
            
            // Compute membership value
            membership_values(i, j) = pi_membership(data(i, j), a, b, c, d);
        }
    }
    
    return membership_values;
}
')

# Sample input data (depth, velocity, substrate, cover)
data <- matrix(c(1.2, 0.5, 3.0, 0.8,
                 2.0, 1.2, 2.5, 0.3,
                 3.5, 0.8, 1.8, 0.6), 
               nrow = 3, byrow = TRUE)

# Membership function parameters (a, b, c, d for each column)
params <- matrix(c(1.0, 1.5, 2.5, 3.0,
                   0.3, 0.6, 1.0, 1.5,
                   1.5, 2.0, 3.0, 3.5,
                   0.2, 0.4, 0.7, 1.0), 
                 nrow = 4, byrow = TRUE)

# Evaluate membership values
evaluate_membership(data, params)