% Function to generate B-spline scaling function coefficients
function h = bspline_filter(n)
    if n == 1
        h = [1/2, 1/2];
    elseif n == 2
        h = [1/4, 1/2, 1/4];
    elseif n == 3
        h = [1/8, 3/8, 3/8, 1/8];
    else
        h = conv(bspline_filter(n-1), [1/2, 1/2]);
    end
end