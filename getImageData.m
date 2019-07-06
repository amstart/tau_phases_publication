function [ ROIs ] = getImageData( roi, data )
%GETIMAGEDATA This extracts the densities measured within each ROI for each
%frame (plus the positions (centers) of each ROI
ROIs = LoadROIasStruct(roi, []);
for i=1:length(ROIs)
    a = ROIs(i).vnRectBounds;
    ROIs(i).center = [mean(a(1),a(3)) mean(a(2),a(4))];
    for j=1:size(data,3)
        ROIs(i).matrix{j} = data(a(1):a(3)-1,a(2):a(4)-1,j);
    end
end

