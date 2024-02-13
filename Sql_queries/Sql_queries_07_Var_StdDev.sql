SELECT 
	  --VARIANCE(amount) AS var_amount, --historical alias for var_samp
	  VAR_POP(amount) AS var_pop_amount,
	  VAR_SAMP(amount) AS var_samp_amount,
	  --STDDEV(amount) as stddev_amount, --historical alias for stddev_samp
	  STDDEV_SAMP(amount) as stddev_sample_amount,
	  STDDEV_POP(amount) as stddev_pop_amount
	FROM public.bill2;