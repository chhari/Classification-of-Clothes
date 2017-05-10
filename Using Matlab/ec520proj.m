%%import csv file of data

filename = 'pants2.csv';
delimiter = ',';
formatSpec = '%q%f%f%f%f%[^\n\r]';
fileID = fopen(filename,'r');
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'EmptyValue' ,NaN, 'ReturnOnError', false);
fclose(fileID);
dataArray([2, 3, 4, 5]) = cellfun(@(x) num2cell(x), dataArray([2, 3, 4, 5]), 'UniformOutput', false);
data4 = [dataArray{1:end-1}];
clearvars filename delimiter formatSpec fileID dataArray ans;

[row, col] = size(data4);
dc = cell(row,2);
for i= 1:row
    
    dc{i,1} = data4{i,1};
    b = [data4{i,2} data4{i,3} data4{i,4} data4{i,5}];
    dc{i,2} = b;
end

t5 =table(dc(:,1) , dc(:,2));
%T = cell2table(dc,'VariableNames',{'Location' 'clothingitem'});
save('pant.mat','t5');
