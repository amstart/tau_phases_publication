%this takes the matrix and plots its time traces, such that relevant
%sections can be manually selected for later processing with the script
%'findpts'
N = size(matrix,2);
n = 1:N;
% interesting = [4 5];
% numpoints = [1 1];
% frames = {10:N, [1:4 6:N]};
% interesting = [1 2 3 4 7 8 10 15];
% numpoints = [1 2 1 2 1 1 2 1];
% frames = {[1:55 68:203], 1:N, 1:N, 1:N 1:N 35:N 1:N [1:102 159:N]};
% interesting = [4 5 6 7 9 11 12];
% numpoints = [1 1 2 1 1 1 1];
% frames = {1:N 1:N 1:N n n n n};
interesting = [1 2 3 7 8 10 12 13 14 15 17 18 21 22 24 25 19 16 11 5];
numpoints =   [3 1 1 1 1 1  3  1  1  1  2  2  1  2  2 1 6 1 1 2];
frames = {26:381 44:79 100:400 590:900 370:682 n 25:N 386:N 700:N 400:N 16:377 1:91 679:818 230:N 196:682 384:562 39:N 672:N 36:231 274:639};
% interesting = [];
% numpoints = [];
% frames = {};
offset = [0 700 900];
ii=0;

% interesting = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16];
% numpoints =   [1 2 2 1 2 1 2 2 1 1 2 1 2 1 2 1];
% frames = {22:400 n n 300:N n n n n 300:N 300:N n n n 120:400 n 9:N};
% interesting = [1 3 4 5 9 10 11 12 14 15 16];
% numpoints = [1 2 1 2 1 1 1 1 2 1 1];
% frames = {50:N n 135:N n n n n n n 1:150 1:150};

% interesting = [1 2 3 4 5 6 8 9 11 12 13 14 15];
% numpoints = [1 1 1 1 1 1 1 1 1 1 1 1 1];
% frames = {n n n n n n n n n n 80:N 1 1};

figure
hold on
for i = 4
    ii = ii+1;
    plot(offset(find(ii))+matrix(i,1:end));
    title(num2str(i));
end
