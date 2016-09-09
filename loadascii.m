function A = loadascii(patha,filename)
% This function is almost pointless.

A = load(patha);
A = rot90(A);
