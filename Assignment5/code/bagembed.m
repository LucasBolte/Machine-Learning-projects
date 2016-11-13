function m= bagembed(bags,instance)
sigma = 25;
distance_f = 0;
m_i = [];
m = cell(length(bags),1);
    for i=1:length(bags)
        bag_ins = bags{i}; 
        for j=1:size(instance,1)
            for z=1:size(bag_ins,1)
%                 distance_z = sum(instance(j,:)-bag_ins(z,:)).^2;
                distance_z = exp(-sum((instance(j,:)-bag_ins(z,:)).^2)/sigma);
                if(distance_z>distance_f)
                    distance_f = distance_z;
                end
            end
            s_j = distance_f;
            m_i = [m_i s_j];
            distance_f = 0;
        end
        m{i,1} = m_i;
        m_i = [];
    end
end

