function drv_mbrtpar(scale)

% computes mandelbrot set

N=round(6000*sqrt(scale));
Nmax=round(10^3*sqrt(scale));
tic
set=mandelbrot(N, Nmax);
toc
%disp(set);

end

