function gp_weighted_mean, values_in, sigma_in, std_out=std_out
values=double(values_in)
sigma=double(sigma_in)

if norm(sigma) then begin
   weights=(1/sigma^2)/TOTAL(1/sigma^2)
   mean_out=TOTAL(values*weights)/TOTAL(weights)

   Q=TOTAL(weights*(values-mean_out)^2)
   std_out=sqrt(Q/(n_elements(values)-1)/TOTAL(weights))
endif else begin
   mean_out=mean(values)
   std_out=norm(sigma)
endelse

return,mean_out

end
