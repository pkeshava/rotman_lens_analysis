classdef RotmanDesign
    properties
        Na
        Nb
        Nd
        N
        d              % in wavelengths
        excited_port
        lambda_0
        Beta_d
    end
    methods
        function obj = RotmanDesign(Rotmanparams,MicrostripDesign)
            obj.Na = Rotmanparams.Na;
            obj.Nb = Rotmanparams.Nb;
            obj.Nd = Rotmanparams.Nd;
            obj.N = obj.Na+obj.Nb+obj.Nd;
            obj.d = Rotmanparams.d;
            obj.excited_port = Rotmanparams.excited_port;
            obj.lambda_0 = MicrostripDesign.lambda_0;
            obj.Beta_d = 2*pi*obj.d;
        end
        function [AF] = calc_AF(obj,S)
            %Adjust it to only be a 2 dimensional matrix since we only care about the
            %first mode
            for i=1:obj.N
                S_Param(i,:)= S(1,i,:);
            end 
            
            theta = linspace(0,2*pi,5000);
            % Get all S parameters for excited port
            S_Param_antennas = S_Param(:,obj.excited_port);
            %create a smaller matrix with the Transmission parameter of the antenna
            %ports from the excited port i.e S14,1 S13,1 S12,1
            for i=0:obj.Na-1
                S_a(1,i+1) = S_Param_antennas(obj.N-i,1);
            end
            % Determine the phase of each
            for i=1:obj.Na
                a_phase(1,i) = angle(S_a(1,i));
            end
            % Determine the mag of each
            for i=1:obj.Na
                S_mag(1,i) = abs(S_a(1,i));
            end
            % Renormalize relative phase and set phase of last element to zero
            for i=1:obj.Na
                a_phase_r(1,i) = a_phase(1,i) - a_phase(1,1);
            end
            
            for n = 0:obj.Na-1
                for i = 1:size(theta,2)
                    psi(n+1,i) = n*(obj.Beta_d*cos(theta(i))+ a_phase_r(n+1));
                end
            end
            for n = 0:obj.Na-1
                for i = 1:size(theta,2)
                    AF(n+1,i) = S_mag(1,n+1)*exp(-1i*psi(n+1,i));
                end
            end
            AF = abs(sum(AF(1:obj.Na,:)));
            
            
            
        end
    end
end