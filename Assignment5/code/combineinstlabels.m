function label_out = combineinstlabels(labels)

label_set = unique(labels);
label_num = length(unique(labels));

label_len_ini = 0;
for i = 1:label_num
    label_len = sum(labels==label_set(i));
    if label_len > label_len_ini
        label_out = label_set(i);
        label_len_ini = label_len;
    end
end

end

