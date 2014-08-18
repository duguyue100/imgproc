function f1=shift(f)

[m, n]=size(f);

f1=zeros(m, n);

for i=1:m
    for j=1:n
        f1(i,j)=f(i,j)*(-1)^(i+j);
    end
end

end

