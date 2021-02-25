classdef Time < handle
    properties
        % Tracked for the simulation:
        dt %(sec)
        
        % Time tracked internally via julianday
        julianday
    end
    
    %% Constructor
    methods
        function [self] = Time(start_time,time_system)
            if isa(start_time,'datetime')
                self.julianday = datetime2julianday(start_time);
            else
                switch lower(time_system)
                    case 'julianday'
                        self.julianday = start_time;
                    case 'unix'
                        self.julianday = unix2julianday(start_time);
                    case 'gregorian'
                        self.julianday = gregorian2julianday(start_time);
                    case 'gmst'
                        error('GMST NOT YET IMPLEMENTED')
                    otherwise
                        error(['The specified time_system must be one of the following: \n',...
                               'julianday | unix | gregorian | gmst'])
                end
            end
        end
    end
    
    %% Public Methods
    methods (Access = public)
        function [] = update(self,dt)
            % Update the julian day:
            self.julianday = self.julianday + dt/86400;
            
            % Store the time step:
            self.dt = dt;
        end
        
        function [matlab_datetime] = datetime(self)
            matlab_datetime = julianday2datetime(self.julianday);
        end
        
        function [u] = unix(self)
           u = julianday2unix(self.julianday); 
        end
        
        function [greg] = gregorian(self)
            greg = julianday2gregorian(self.julianday);
        end
    end
end