classdef Attitude < handle
    %@code{true}
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
                    self.rotmat = ea2rotmat(sequence,angles(1),angles(2),angles(3),varargin{3:end});
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
    
    %% Overloaded Methods
    methods (Access = public)
        function [output] = mtimes(att1,vec)
            if isa(vec,'Attitude')
                rotmat_new = att1.rotmat*vec.rotmat;
                output = Attitude('rotmat',rotmat_new);
            else
                output = att1.rotmat*vec;
            end
        end
        
        function [att_t] = ctranspose(att)
            att.rotmat = att.rotmat';
            att_t = att;
        end
        
        function [att_t] = transpose(att)
            att.rotmat = att.rotmat';
            att_t = att;
        end
    end
    
end