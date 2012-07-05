function md = mahalDist(xy,cx,cy,covMat)
% function md = mahalDist(xy,cx,cy,covMat)
J = sqrtm(inv(covMat));
xy_u = [xy(1,:)-cx; xy(2,:)-cy];
A = xy_u'*J;
B = J*xy_u;
md = sqrt(real(sum(A.*conj(B)',2)));
