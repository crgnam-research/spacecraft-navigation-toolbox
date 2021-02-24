classdef UKF < handle
    properties (Access = public)
        % Estimator:
        x_hat % Estimate
        P % Estimate Covariance Matrix
        Q % Process Noise Covariance Matrix
        R % Measurement Noise Covariance Matrix
        
        % Models:
        dynamics_model
        measurement_model
        model_args
        
        % Stored parameters:
        predicted_measurement
        
        % Tuning parameters:
        alpha
        beta
        kappa
    end
    
    %% Constructor
    methods
        function [self] = UKF(x_hat,P,Q,R,dynamics_model,dynamics_args,...
                              measurement_model,measurement_args,...
                              alpha,beta,kappa)
            % Format appropriately:
            if isrow(x_hat)
                x_hat = x_hat';
            end
            
            % Check the inputs for inconsistencies:
            assert(all(size(P)==size(Q)), 'P and Q must be the same size')
            assert(size(x_hat,1)==size(P,1), 'P must have the same number of rows as x_hat')
            assert(ishandle(dynamics_model), 'dynamics_model must be a function handle')
            assert(ishandle(measurement_model), 'measurement_model must be a function handle')
            
            % Store values:
            self.x_hat = x_hat;
            self.P = P;
            self.Q = Q;
            self.R = R;
            self.dynamics_model = dynamics_model;
            self.measurement_model = measurement_model;
            self.model_args  = {dynamics_args, measurement_args};
            self.alpha = alpha;
            self.beta  = beta;
            self.kappa = kappa;
        end
    end
    
    %% Public Methods:
    methods (Access = public)
        function [] = estimate(self, dt, measurement, measAvails)
            [x_hat2,P2,y_hat] = ukf(self.dynamics_model, self.measurement_model,...
                                    self.x_hat, dt,...
                                    self.P, self.Q, self.R, measAvails, measurement,...
                                    self.alpha, self.beta, self.kappa, self.model_args);
            self.x_hat = x_hat2;
            self.P = P2;
            self.predicted_measurement = y_hat;
        end
        
        function [self] = update_args(self,dynamics_args,measurement_args)
            self.model_args = {dynamics_args, measurement_args};
        end
    end
end