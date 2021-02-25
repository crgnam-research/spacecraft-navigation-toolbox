classdef Attitude < double
    properties
        rotmat
    end
    
    %% Constructor
    methods
        function [self] = Attitude(format,varargin)
            switch lower(format)
                case {'quaternion','quat'}
                    self.rotmat = quat2rotmat(varargin{1});
                case {'rotmat'}
                    self.rotmat = varargin{1};
                case {'euler'}
                    sequence = varargin{1};
                    assert(ischar(sequence) && length(sequence)==3,...
                           'A valid euler angle sequence must be provided (example: ''321'')')
                    angles = varargin{2};
                    self.rotmat = ea2rotmat(angles(1),angles(2),angles(3),sequence);
            end
        end
    end
    
    %% Public Methods
    methods (Access = public)
        function [quat] = quat(self)
            quat = rotmat2quat(self.rotmat);
        end
        
        function [quat] = quaternion(self)
            quat = rotmat2quat(self.rotmat);
        end
    end
    
end