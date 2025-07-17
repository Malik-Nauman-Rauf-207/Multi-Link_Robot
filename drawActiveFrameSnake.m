function [ h ] = drawActiveFrameSnake( g, alpha, L)
n = size(alpha,1)+1;
h = cell(1,n);%link handle

color = [1 1 1];

k = framesInHead(alpha,L/2);

for i = 1:n
    k{i} = g*k{i};%update module frame
    h{i} = drawActiveFrameEllipse(k{i},L/2,color);
end


end

