data {
  int<lower=1> T;            // num observations
  int<lower=1> K;            // number of predictors
  array[T] real y;           // observed outputs
  matrix[T, K] x;        // inputs (exclusing the autoregressive part)
}
parameters {
  real alpha;                // mean coeff
  vector[K] beta;        // exogenous
  real phi;                  // autoregression coeff
  real theta;                // moving avg coeff
  real<lower=0> sigma;       // noise scale
}
transformed parameters {
  vector[T] nu;              // prediction for time t
  vector[T] err;             // error for time t
  nu[1] = alpha + x[1]*beta + phi * (alpha + x[1]*beta);     // assume err[0] == 0
  err[1] = y[1] - nu[1];
  for (t in 2:T) {
    nu[t] = alpha + x[t]*beta + phi*y[t - 1] + theta*err[t - 1];
    err[t] = y[t] - nu[t];
  }
}
model {
  //mu ~ normal(0, 10);        // priors
  //phi ~ normal(0, 2);
  //theta ~ normal(0, 2);
  //sigma ~ cauchy(0, 5);
  err ~ normal(0, sigma);    // likelihood
}
generated quantities {
  vector[T] prediction;   // in sample predictions, use y
  for (n in 1:T) {
    prediction[n] = normal_rng(nu[n], sigma);
  }
}