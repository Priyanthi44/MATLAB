function [x ,y]= UseKnnSearch(X,Y)

[x ,y] =knnsearch(X,Y,'k',1,'distance','euclidean');