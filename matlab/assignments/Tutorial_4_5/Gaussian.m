function f=Gaussian(M, N, sig)

if (mod(M, 2)==0)
    cM=floor(M/2)+0.5;
else
    cM=floor(M/2)+1;
end

if (mod(M, 2)==0)
    cN=floor(N/2)+0.5;
else
    cN=floor(N/2)+1;
end

f=zeros(M, N);
for i=1:M
    for j=1:N
        dis=(i-cM)^2+(j-cN)^2;
        f(i,j)=exp(-dis/2/sig^2);
    end
end

end