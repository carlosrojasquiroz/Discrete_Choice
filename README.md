# Standard incomplete market model with discrete choices

The `master.m` file computes the policy functions (assets, consumption and labor) in a model of incomplete markets with discrete choice. 
Consumer decides each period whether participates in the labor market or not. To obtain "smooth" policy function, I also include extreme value taste shocks, following Iskhakov et al. (2017).
Consumer problem is as follows:

$$
\max_{ \{c_t,n_t \} } \mathbb{E} \sum_{t=0}^{\infty} \beta^t \left\( u(c_t) - \phi n_t + \sigma_{\epsilon} \epsilon (n_t) \right)
$$  
