function beta = reverseinterp2(TSR,Cp,TSRvec,betavec,Cp_table)

[lambda,pitch] = meshgrid(TSRvec, betavec);   % x and y are vectors

% Define function of Y only
F = @(y) interp2(lambda, pitch, Cp_table, TSR, y, 'linear') - Cp;

% Use root finder to solve for Yq
betaguess = 12;
beta = fzero(F, betaguess);

end