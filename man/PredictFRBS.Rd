% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/PredictFRBS.R
\name{PredictFRBS}
\alias{PredictFRBS}
\title{Function to carry out predictions with zero-order Takagi–Sugeno–Kang fuzzy rule-based systems for fish habitat evaluation.}
\usage{
PredictFRBS(Data, FRBS)
}
\arguments{
\item{Data}{the evaluated dataset in data.frame format}

\item{FRBS}{the list compiling the elements describing a zero-order Takagi–Sugeno–Kang fuzzy rule-based system}
}
\value{
matrix with the membership of each datum to each fuzzy rule obtained using the function FUZZIFY.FRBS.Fast and the predicted habitat suitability in the last column
}
\description{
Function to carry out predictions with zero-order Takagi–Sugeno–Kang fuzzy rule-based systems for fish habitat evaluation.
}
