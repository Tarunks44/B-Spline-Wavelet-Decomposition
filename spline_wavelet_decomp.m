% Function to perform wavelet decomposition using splines
function [a, d, mse] = spline_wavelet_decomp(signal, level, spline_order)
    % Get filter coefficients
    h = bspline_filter(spline_order);
    
    % Create wavelet filter
    g = h .* (-1).^(0:length(h)-1);
    g = fliplr(g);
    
    % Initialize coefficient arrays
    a = cell(level, 1);
    d = cell(level, 1);
    
    % Current signal
    current = signal;
    
    % For MSE calculation
    mse = zeros(level, 1);
    
    % Perform decomposition
    for i = 1:level
        % Extend signal periodically
        extended = [current(end-length(h)+2:end) current current(1:length(h)-1)];
        
        % Calculate approximation coefficients
        a{i} = conv(extended, h, 'valid');
        a{i} = a{i}(1:2:end);
        
        % Calculate detail coefficients
        d{i} = conv(extended, g, 'valid');
        d{i} = d{i}(1:2:end);
        
        % Calculate MSE for this level
        reconstructed = upsample(a{i}, 2);
        if length(reconstructed) ~= length(current)
            reconstructed = reconstructed(1:length(current));
        end
        mse(i) = mean((current - reconstructed).^2);
        
        % Update signal
        current = a{i};
    end
end