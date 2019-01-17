function [uA] = union(p, q, A)
    uA = A;
    uA(root(p, A)) = root(q, A);
end