function out = LoadROIasStruct(file)
tmp = ReadImageJROI(file);
try
    out(1) = tmp{1};
    for i=2:length(tmp)
        out(i) = tmp{i};
    end
catch
    out = tmp;
end