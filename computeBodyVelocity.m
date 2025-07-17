function [ xi ] = computeBodyVelocity(alpha, d_alpha, K, L)
g = framesInHead(alpha,L/2);
J = spatialJacobian(alpha,L/2);
%compute the body velocity of the head frame
%compute all the frames relative to the head frame
n=size(g,2);
K = [K [0; 0]; 0 0 0];
%compute omega1
omega1 = (myAdjoint(inv(g{1}))).'*K;
for i = 2:n
    omega1 = omega1+(myAdjoint(inv(g{i}))).'*K*myAdjoint(inv(g{i}));
end

%compute omega2
%compute spatial Jacobian
omega2 = zeros(3,1);
for i = 2:n
    omega2 = omega2+(myAdjoint(inv(g{i}))).'*K*myAdjoint(inv(g{i}))*[J(:,1:i-1),zeros(3,n-i)]*d_alpha;
end

xi = -omega1\omega2;
end


