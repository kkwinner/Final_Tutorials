%% matlab_parallel.m
% Written by:   Shelley Knuth (shelley.knuth@colorado.edu)
% Affiliation:  Research Computing, CU-Boulder
% Date:         24 March 2014
% Updated:       8 August 2014
% Purpose:      The purpose of this program is to demonstrate how to take
% normal Matlab code and convert it to run in parallel.  We will also compare how long it takes to run serial vs. parallelized code.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Delete any existing parallel pools 
delete(gcp('nocreate'))

% Create variables
  n = 90000;
  x = randn(1,n) ;
  y = zeros(1,n);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Original, serial code
tic
  for i = 1 : n
      y(i) = std(x(1:i));
  end

  fprintf('\n Not parallel: %f secs\n\n',toc);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% New, parallel code
tic
  pool=parpool(num_workers);
  parfor i = 1 : n
      y(i) = std(x(1:i));
  end

  fprintf('\n     parFor: %f secs\n\n',toc);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Remove pool
  delete(pool);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
