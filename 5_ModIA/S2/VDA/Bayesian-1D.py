# Example of a 1D (scalar function) Bayesian analysis
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns # plots
import pymc3 as pm # Bayesian modeling and Probabilistic ML relying on MCMC

# Generate synthetic data: binomial 
np.random.seed(0)
data = np.random.binomial(n=1, p=0.6, size=100)

# Define the model
with pm.Model() as first_model:
    u = pm.Beta('u', alpha=1., beta=1.) # the prior = beta distribution
    z = pm.Bernoulli('z', p=u, observed=data) # the likelihood = Bernoulli distribution
    trace = pm.sample(1000, random_seed=123) # to draw samples of the posterior (trace of the MCMC algorithm)
    
    # Before drawing these “real” samples, PyMC3 lets the chain converge to the distribution of your model for a certain number of iterations (the tuning phase). 
    # Once this phase is complete, it starts drawing from the distribution. The number of tuning iterations = 1000.

# Plot posterior
pm.plot_posterior(trace, var_names=['u'], credible_interval=0.95, label='posterior')
# Plot the prior distribution
sns.distplot(np.random.beta(1, 1, 1000), hist=False, kde=True, 
             bins=int(180/5), color = 'darkblue', 
             hist_kws={'edgecolor':'black'},
             kde_kws={'linewidth': 4}, label='prior')
# Plot the likelihood distribution
sns.distplot(np.random.binomial(n=1, p=np.mean(data), size=1000), hist=False, kde=True, 
             bins=int(180/5), color = 'darkgreen', 
             hist_kws={'edgecolor':'black'},
             kde_kws={'linewidth': 4}, label='likelihood')

plt.xlabel('u'); plt.ylabel('Density'); plt.title('Distributions')
plt.show()

# Plot the prior and likelihood
pm.plot_posterior(trace, var_names=['u'], credible_interval=0.95, label='posterior')
plt.xlabel('u'); plt.ylabel('Density'); plt.title('Distributions')
plt.show()

# Plot of the MCMC sampling process
pm.traceplot(trace)
plt.show()
# Summary of the MCMC output information
pm.summary(trace).round(2)
