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
        function [output] = mtimes(mat1,mat2)
            if isa(mat1,'Attitude') && isa(mat2,'Attitude')
                rotmat_new = mat1.rotmat*mat2.rotmat;
                output = Attitude('rotmat',rotmat_new);
            elseif isa(mat1,'Attitude')
                output = mat1.rotmat*mat2;
            elseif isa(mat2,'Attitude')
                output = mat1*mat2.rotmat;
            end
        end
        
        function [att_t] = ctranspose(att)
            att_t = Attitude('rotmat',eye(3));
            att_t.rotmat = att.rotmat';
        end
        
        function [att_t] = transpose(att)
            att_t = Attitude('rotmat',eye(3));
            att_t.rotmat = att.rotmat';
        end
    end
    
end