%matlab code which when execute extracts intensities from a file 
folder = 'xyz'; %folder with files
roi = [folder '\singleM.zip']; %singleM.zip contains ROIs created by imagej (squares around single Molecules)
bgroi = [folder '\bg.zip']; %bg.zip contains ROIs created by imagej (squares around patches of background)


singleM = bfopen(file); %bfopen see https://docs.openmicroscopy.org/bio-formats/6.1.1/users/matlab/index.html
%singleM contains a movie in which immobilized single molecules are being
%bleached. In the end, the 'findpts' function is used to determine the
%height of the bleaching steps, which is then taken to be the single
%molecule intensity
singleMdata = [];
singleM = singleM{1};
singleM = singleM(:,1);
for i = 1:length(singleM)
    singleMdata(:,:,i) = double(singleM{i});
end
signal = get_singleM.getImageData(roi, singleMdata);
bg = get_singleM.getImageData(bgroi, singleMdata);
for i=1:length(bg)
    for j = 1:length(singleM)
        bg(i).mean(j) = median(bg(i).matrix{j}(:));
    end
end
matrix = zeros(length(signal), length(singleM));
time = zeros(length(signal), length(singleM));
bgcenters = vertcat(bg.center);
for i=1:length(signal)
    [~,signal(i).bgid] = min(CalcDistance(bgcenters, signal(i).center));
end
for i=1:length(signal)
    for j=1:length(singleM)
        matrix(i,j) = sum(signal(i).matrix{j}(:)) - ...
        bg(signal(i).bgid).mean(j)*numel(signal(i).matrix{j});%bgval(j)*numel(signal(i).matrix{j}(:));
        time(i,j) = j;
    end
end

