# Inputs

# Quota per representative lalala
quota_per_rep = 1000
# Vector containing number of representatives at the start of the quarter over time
reps = c(1, 2, 3, 4, 5, 6, 7)
# Quarters required to be "fully ramped"
q = 3

# Ramp functions
ramp_lin = function(reps){
  output = rep(0, length(reps))
  for (i in 1:length(output)){
    if (reps[i] >= q){
      output[i] = 1
    }
  }
  output
}
ramp_exp = function(reps){
  output = rep(1, length(reps))
  for (i in 1:length(output)){
    if (reps[i] < q){
      output[i] = exp((log(2)/3)*reps[i]) - 1
    }
  }
  output
}
# Use ramp function to determine quota multiplier for each rep. (their "value")
reps_value_lin = ramp_lin(rep_experience)
plot(rep_experience, ramp_lin(rep_experience), main = "Rep. Ramp-- Lin", type="b", pch=16, lty=1, 
     xlab="Qs of experience", ylab = "Sales Representative Value")
reps_value_exp = ramp_exp(rep_experience)
plot(rep_experience, ramp_exp(rep_experience), main = "Rep. Ramp-- Exp", type="b", pch=16, lty=1,
     xlab="Qs of experience", ylab = "Sales Representative Value")



# Revenue is a product of sales rep. value and quota per full rep., sum for all reps.
# Choose ramp function
revenue = function(reps, ramp_fun, quota){
  for (q in 1:length(reps)){
    rep_info = rep(NA, reps[q])
    for (rep in 1:reps[q]){
      
    }
    
    
  }
  sum(quota * ramp_fun(rep_exp))
}
revenue(rep_experience, ramp_exp, quota_per_rep)


