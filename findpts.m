%this function returns the median change in intensity (which is the final intensity per single Molecule)
%of the particular time traces found with the script 'plottraces'
function [medchange, changesinmeans] = findpts(matrix, interesting, frames, numpoints)
changesinmeans = [];
firstframe = 1;

allR = [];
allmeans = [];
numFrames = length(firstframe:size(matrix,2));
for j=1:length(interesting)%
    figure
    hold on
    row = interesting(j);
    title(num2str(row));
    vec = matrix(row,frames{j});
    [changepts, R] = findchangepts(vec,'MaxNumChanges',numpoints(j));
    k = [1 changepts length(vec)];
    ci = [];
    plot(frames{j}, vec, 'b')
    for l = 2:length(k)
        mean_region = mean(vec(k(l-1):k(l)));
        ci = [ci mean_region];
        plot([frames{j}(k(l-1)) frames{j}(k(l))],[mean_region mean_region], 'r');
    end
    allR = [allR R];
    changesinmeans = [changesinmeans abs(diff(ci))];
    allmeans = [allmeans ci];
end
figure
histogram(changesinmeans)
figure
boxplot(changesinmeans);
medchange = median(abs(changesinmeans));
% average = tracked.meanOut(changesinmeans);
% stddev = std(changesinmeans);