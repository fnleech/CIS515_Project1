function [p] = calculateDE( b, n)
p = [];
depth = 0;
[p,~] = calculateDEsub(b, p, depth, n);
end
% --------------------------------
function [p, depth] = calculateDEsub(b, p, depth, n)
if depth < n
    m = size(b, 1);
    blist = [];
    while size(b,1) > 1
        blist = [blist ; b(1,:), b(end, :)];
        b = 1/2 * (b(1:(end-1),:) + b(2:end,:));
    end
    blist(end, :) = repmat(b, 1, 2);
    p = [p;b];
    depth = depth + 1;
    blist_left = blist(:, 1:2);
    blist_right = blist(:, 3:4);
    [p, ~] = calculateDEsub(blist_left, p, depth, n);
    [p, ~] = calculateDEsub(blist_right, p, depth, n);
end
end
