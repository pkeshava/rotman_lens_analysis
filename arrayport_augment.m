function v0 = arrayport_augment(xa, ya, xcyc,off)

    % rotate xa matrix all back down to orign. 
    % split them into +/- 0.5
    % shift by taper length
    % create two more points same y axis but with x shifted w+w0
    % rotate back
   
    theta =  pi-atan(ya./xa);
    s0 = [];
    siz = size(xa,2);
    center = [0;0];
    for i=1:siz
        
        v = [xa(i);ya(i)];
        s = v - center;
        R = [cos(0.1*theta(i)) -sin(theta(i));...
            sin(theta(i)) cos(theta(i))];
        s1 = R*s;
        s0 = [s0 s1];
    end
    v0 = s0;
    
%     x_len = -xcyc(1)+xa; % create a row vector of lengths from the center to the array port
%     theta =  tan(-ya./x_len); % create angles for rotation
% 
%     s0 = [];
%     siz = size(xa,2);
%     center = [-xcyc(1);0];
%     for i=1:siz
%         
%         v = [-xa(i);ya(i)];
%         s = v - center;
%         R = [cos(0.1*theta(i)) sin(theta(i));...
%             -sin(theta(i)) cos(theta(i))];
%         s1 = R*s;
%         s0 = [s0 s1];
% 
%     end
% 
%     v0 = s0 + center;
%     v0 = [-v0(1,:);v0(2,:)];

    
%     v1 = [];
%     
%     for i=1:size(xa,2)
%         y = v0(2,i);
%         v = [v0(1,i) v0(1,i) v0(1,i);y+off y y-off];
%         v1 = [v1 v];  
%         
%     end
%     
%     theta_temp = [];
%     theta_new = [];
%     
%     for i=1:size(xa,2)
%         
%         theta_temp = [theta(i) theta(i) theta(i)];
%         theta_new = [theta_new theta_temp];
%         
%     end
%     
%     m = size(v1,2);
% %     rotate back
%     for i=1:m
% %         the theta variable essentially needs to be duplicated in a way
% %         that will make it the same size as m (21)
%         v2 = [v1(1,i);v1(2,i)];
%         s = v2 - center;
%         R = [cos(theta_new(i)) sin(theta_new(i));...
%             -sin(theta_new(i)) cos(theta_new(i))];
%         s1 = R*s;
%         s0 = [s0 s1];
% 
%     end
%     
%     v0 = s0 + center;
    
    
end
