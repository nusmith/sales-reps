# Inputs
# Quota per representative
quota_per_rep = 1000
# Vector containing number of representatives at the start of the quarter over time
reps = [1, 2, 4, 5, 5, 7, 7, 8]
# Quarters required to be "fully ramped"
q_ramp = 3


# Determine the rep_experience for each rep at the start of each quarter
rep_experience = [2, 3, 4, 1, 5, 1, 2, 2]


# Ramp functions (linear, exponential, etc.)
def ramp_lin(reps):
    output = [0] * len(reps)
    for (i in range(0, len(output))):
         if (reps[i] >= q):
         output[i] = 1
    return output


def ramp_exp(reps):
    output = [1] * len(reps)
    for (i in range(0, len(output))):
        if (reps[i] < q):
            output[i] = exp((log(2)/3)*reps[i]) - 1
    return output


# Use ramp function to determine quota multiplier for each rep. (their "value")
reps_value_lin = ramp_lin(rep_experience)
reps_value_exp = ramp_exp(rep_experience)


# Revenue is a product of sales rep. value and quota per full rep., sum for all reps.
# Choose ramp function
def revenue(rep_experience, ramp_fun, quota):
    return sum(quota * ramp_fun(rep_exp))


print(revenue(rep_experience, ramp_exp, quota_per_rep))


