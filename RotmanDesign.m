classdef RotmanDesign
% This class creates an object for a rotman lens. The constructor requires 
% a prior microstrip object to have been created. It also requires that the
% rotman lens design parameters be input as a struct. These are defined in
% the 'properties' (fields) of the class. A certain convention for which
% ports are the the array ports is defined based on the excited port. This
% is described below
    
    
% Identify row of interests for excitation to determine relative phase
% differences and thereby calculate alpha. If there are N total ports, Nb
% Beam ports and Na array ports then ports 1-Nb will be excitations and ports
% N - M will be array ports. That means the numbers in between are dummy
% ports Nd
% This is the convention I will use moving forward
% For example
%
%                P3 P2 P1(excited)
%           P4               P8       
%           P5               P9
%           P6               P10
%           P7               P11
%               P12 P13 P14 
%               
%
    properties
        Na             % Number of array ports
        Nb             % Number of beam ports
        Nd             % Number of dummy ports
        Nt             % Number of total ports
        N              % Y Distance of off axis antenna element
        d              % Antenna element seperation in wavelengths
        excited_port   % The excited port index in the S Matrix
        lambda_0       % free space wavelength
        lambda_g       % guided wavelength
        Beta_d         % wavenumber times distance for array factor calc
        alpha          % focal angle 
        theta_t        % tilt angle
        beta           % ratio of focal lengths F/G i.e F = G*Beta (Hansen)
        g_ideal        % inverse beta (rotman) but calculated using ideal
                       % optical abberation
        G              % on axis focal length as a function of lambda_g
        F              % off axis focal length
        W0             % length of center transmission line in  wavelengths
        taper_a        % length of tapers from antenna port to antenna TL in wavelengths
    end
    methods
        function obj = RotmanDesign(Rotmanparams,MicrostripDesign)
            % check to make sure that port numbers are odd
            if (mod(Rotmanparams.Na,2) == 0 || mod(Rotmanparams.Nb,2) == 0)
                msg = 'Error: Number of Beam and Array Ports must be odd';
                error(msg);
            else
                obj.Na = Rotmanparams.Na;
                obj.Nb = Rotmanparams.Nb;
                obj.Nd = Rotmanparams.Nd;
                obj.Nt = obj.Na+obj.Nb+obj.Nd;
                obj.d = Rotmanparams.d;
                obj.excited_port = Rotmanparams.excited_port;
                obj.lambda_0 = MicrostripDesign.lambda_0;
                obj.N = obj.d*obj.lambda_0;
                obj.Beta_d = 2*pi*obj.d;
                obj.lambda_g = MicrostripDesign.lambda_g;
                obj.alpha = pi/180*Rotmanparams.alpha;
                obj.theta_t = pi/180*Rotmanparams.theta_t;
                obj.beta = Rotmanparams.beta;
                obj.G = Rotmanparams.G*obj.lambda_g;
                obj.W0 = Rotmanparams.W0*obj.lambda_g;
                obj.taper_a = Rotmanparams.taper_a*obj.lambda_g;
                obj.F = obj.G*obj.beta;
                obj.g_ideal = 1+obj.alpha^2/2;
            end
        end
        function [AF] = calc_AF(obj,S)
            % Adjust it to only be a 2 dimensional matrix since we only care 
            % about the first mode
            for i=1:obj.Nt
                S_Param(i,:)= S(1,i,:);
            end 
            theta = linspace(0,2*pi,5000);
            % Get all S parameters for excited port
            S_Param_antennas = S_Param(:,obj.excited_port);
            % create a smaller matrix with the Transmission parameter of the 
            % antenna ports from the excited port i.e S14,1 S13,1 S12,1
            for i=0:obj.Na-1
                S_a(1,i+1) = S_Param_antennas(obj.Nt-i,1);
            end
            for i=1:obj.Na
                % Determine the phase of each
                a_phase(1,i) = angle(S_a(1,i));
                % Determine the mag of each
                S_mag(1,i) = abs(S_a(1,i));
                % Renormalize relative phase and set phase of last element 
                % to zero 
                a_phase_r(1,i) = a_phase(1,i) - a_phase(1,1);
            end         
            % Calculate the phase psi for each element based on simple
            % linear array theory and then the corresponding array factor
            for n = 0:obj.Na-1
                for i = 1:size(theta,2)
                    psi(n+1,i) = n*(obj.Beta_d*cos(theta(i))+ ... 
                        a_phase_r(n+1));
                    AF(n+1,i) = S_mag(1,n+1)*exp(-1i*psi(n+1,i));
                end
            end
            AF = abs(sum(AF(1:obj.Na,:)));
 
        end
        function [a, b, c, w, xa, ya] = calc_dimensions(obj,microstrip)
            % First define normalized parameters
            Ny=(1:1:obj.Na)*obj.d*obj.lambda_0-(obj.Na+1)*obj.d*obj.lambda_0/2;
            eta = Ny./obj.F;
            g = 1/obj.beta;
            a0 = cos(obj.alpha);
            b0 = sin(obj.alpha);
            epseff_epr = microstrip.eps_eff./microstrip.Sub_epsr;
            
            a = epseff_epr.*(1 - eta.^2./microstrip.Sub_epsr - ((g-1)/(g - a0)).^2);
            
            b = sqrt(epseff_epr)*...
                (2.*g.*((g-1)./(g-a0)-1) -...
                (g-1)./((g-a0).^2)*...
                b0.^2.*eta.^2./microstrip.Sub_epsr...
                + 2.*eta.^2./microstrip.Sub_epsr);
                
            c = g.*eta.^2.*b0.^2./(microstrip.Sub_epsr.*(g-a0))- eta.^4 ...
            .*b0.^4./(4.*microstrip.Sub_epsr.^2.*(g-a0).^2) - ...
                eta.^2./microstrip.Sub_epsr;
            
            w = (-b - sqrt(b.^2 - 4.*a.*c))./(2.*a);
            
            % array contour calculations
            xa = sqrt(epseff_epr).*(1-g)./(g-a0).*w...
                - eta.^2.*b0.^2./(2.*(g-a0).*microstrip.Sub_epsr);
            
            ya = eta./sqrt(microstrip.Sub_epsr).*(1 - sqrt(epseff_epr).*w);

        end
        
        function beam = beam_contour(obj)
            
            beam = beamport_struct(obj);
            
            if (beam.N_add > 0)
                beam = additional_ports(beam);
            end
            beam = microstrip50_coord(beam,obj);
        end
       
        function [xant_yant] = antenna_positions(obj, xa, w)
           x_ant = obj.W0/obj.F*ones(size(w,2),1) + obj.taper_a*ones(size(w,2),1); 
           y_ant = (-(obj.Na-1)/2:1:(obj.Na-1)/2)*obj.d*obj.lambda_0/obj.F;
           xant_yant = [x_ant y_ant'];
        end
       
        function beam = beamport_struct(obj)
            % beamport struct creates a structure with 
            % all the relvant variables required to create
            % the geometry of the beamport and the tapered extention

            % N.add                 Number of additional ports
            % xb/yb/xbyb            beam port untapered coordinates
            % xb_t/yb_t/xbyb_t      beam port tapered coordinates
            % theta_r               incremental angles measured from beam port
            %                       radius defining additional port placement
            % rb                    radius of beam port contour
            % rb_t                  radius of tapered beam port contour
            % xcyc                  beam port contour center coordinates
            % xcyc_t                tapered beam port contour center coordinates
            % xtm ytm 

            % Determine number of additional focal beam points
            beam.N_add = (obj.Nb - 3)/2;

            beam.xb = [-cos(obj.alpha);-1/obj.beta;-cos(obj.alpha)];
            beam.yb = [sin(obj.alpha);0;-sin(obj.alpha)]; 
            beam.xbyb = [beam.xb beam.yb];

            % Determine center and radius of beam port contour
            ABC = [beam.xb(1) beam.yb(1);beam.xb(2)...
                beam.yb(2);beam.xb(3) beam.yb(3)];
            [beam.rb,beam.xcyc_b] = fit_circle_through_3_points(ABC); 

            % calculate length of line from center of beam contour to x position of Focal point
            x_l = -cos(obj.alpha) - beam.xcyc_b(1); 
            % determine the angle represented by radius and x_l
            beam.theta_r = acos(abs(x_l/beam.rb)); 
            % Use this to calculate the position of each additional port

            % Determine length of line from origin to taper end on beam port. Use to calculate taper coordinate
            z = (obj.F+obj.taper_a)/obj.F;

            % Rinse and repeat for contour extended by taper length. 
            beam.xb_t = [-z*cos(obj.alpha);-z/obj.beta;-z*cos(obj.alpha)];
            beam.yb_t = [z*sin(obj.alpha);0;-z*sin(obj.alpha)]; 
            ABC2 = [beam.xb_t(1) beam.yb_t(1);beam.xb_t(2)...
                beam.yb_t(2);beam.xb_t(3) beam.yb_t(3)];
            beam.xbyb_t = [beam.xb_t beam.yb_t];
            [beam.rb_t,beam.xcyc_t] = fit_circle_through_3_points(ABC2);
        end
       
        function beam = microstrip50_coord(beam,obj)
            % calculate the offset angle between the 
            % centerline of the tapered beam coordinate
            % and where the edge of the 50 ohm microstrip is
            phi = atan(0.0005/(obj.F*beam.rb_t));
            xd = 0.0005/obj.F*sin(phi);
            yd = 0.0005/obj.F*cos(phi);    
            
            for i=1:obj.Nb                
                if(i < (obj.Nb+1)/2)
                    x_u_u = beam.xbyb_t(i,1)+xd;
                    y_u_u = beam.xbyb_t(i,2)+yd;
                    x_u_d = beam.xbyb_t(i,1)-xd;
                    y_u_d = beam.xbyb_t(i,2)-yd;
                
                elseif(i == (obj.Nb+1)/2)
                    x_m_u = beam.xbyb_t(i,1);
                    y_m_u = beam.xbyb_t(i,2)+0.0005/obj.F;
                    x_m_d = beam.xbyb_t(i,1);
                    y_m_d = beam.xbyb_t(i,2)-0.0005/obj.F;
                    
                
                elseif(i > (obj.Nb+1)/2)
                    x_d_u = beam.xbyb_t(i,1)-xd;
                    y_d_u = beam.xbyb_t(i,2)+yd;
                    x_d_d = beam.xbyb_t(i,1)+xd;
                    y_d_d = beam.xbyb_t(i,2)-yd;
                end
            end
            beam.x_t_m = [x_u_u';x_u_d';x_m_u;x_m_d;x_d_u';x_d_d'];
            beam.y_t_m = [y_u_u';y_u_d';y_m_u;y_m_d;y_d_u';y_d_d'];
            beam.xtmytm = [beam.x_t_m beam.y_t_m];
            
        end
        
    end
    
end