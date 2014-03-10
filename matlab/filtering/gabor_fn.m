function gb=gabor_fn(nstds, sigma, theta, lambda, psi, gamma)
% from wikipedia
%
% %%%Input%%%
% nstds: length
% sigma: standard deviation of the Gaussian envelope
% theta: orientation of normal to the parallel stripes of a gabor function
% lambda: wavelength of the sinusoidal factor
% psi: phase offset
% gamma: spatial aspect ratio
%
% %%%Output%%%
% gb: gabor function
 
sigma_x = sigma;
sigma_y = sigma/gamma;
 
% Bounding box
xmax = max(abs(nstds*sigma_x*cos(theta)),abs(nstds*sigma_y*sin(theta)));
xmax = ceil(max(1,xmax));
ymax = max(abs(nstds*sigma_x*sin(theta)),abs(nstds*sigma_y*cos(theta)));
ymax = ceil(max(1,ymax));
xmin = -xmax; ymin = -ymax;
[x,y] = meshgrid(xmin:xmax,ymin:ymax);
 
% Rotation 
x_theta=x*cos(theta)+y*sin(theta);
y_theta=-x*sin(theta)+y*cos(theta);
 
gb= exp(-.5*(x_theta.^2/sigma_x^2+y_theta.^2/sigma_y^2)).*cos(2*pi/lambda*x_theta+psi);

noRows=size(gb,1);
noCols=size(gb,2);
if (noRows>noCols)
    diff=(noRows-noCols)/2;
    gb=[zeros(noRows, diff), gb, zeros(noRows, diff)];
else if (noRows<noCols)
    diff=(noCols-noRows)/2;
    gb=[zeros(diff, noCols); gb; zeros(diff, noCols)];
    end
end

end