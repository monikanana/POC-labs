function [rootL] = root(L, A)
    rootL = A(L);
    while rootL ~= L
        L = rootL;
        rootL = A(L);
    end
end