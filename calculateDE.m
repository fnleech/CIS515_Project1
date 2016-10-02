function [p] = calculateDE( b, n, t)
p = []; % points used to draw the curve 
depth = 0; % iterate time 
[p,~] = calculateDEsub(b, p, depth, n, t);
end
% --------------------------------
function [p, depth] = calculateDEsub(b, p, depth, n, t)
if depth < n
    blist = []; % to store our control points ud and ld
                % blist look like this [ud , ld]
    while size(b,1) > 1 % when not yet get the final point of each iteration keep going  
        blist = [blist ; b(1,:), b(end, :)]; % find the control points 
        b = (1-t) * b(1:(end-1),:) + t * b(2:end,:);% construct each layer of points 
    end
    blist = [blist; repmat(b, 1, 2)];
    p = [p;b]; % add the final single point b to our draw point p
    depth = depth + 1; % add one to iterate time 
    blist_left = blist(:, 1:2); % ud control points
    blist_right = blist(:, 3:4); % ld control points 
    [p, ~] = calculateDEsub(blist_left, p, depth, n, t); % recursively call ud
    [p, ~] = calculateDEsub(blist_right, p, depth, n, t); % recursively call ld 
end
end
