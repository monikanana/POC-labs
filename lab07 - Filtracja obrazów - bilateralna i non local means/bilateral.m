function data_filtered = bilateral(data, local_window)
    
    % uchwyt do funkcji 'bilateral_local'
    FUNCTION = @(data_, local_window_)bilateral_local(data_, local_window_);

    % przekazanie uchwytu FUNCTION do mechanizmu 'confilt'
    data_filtered = colfilt(data, local_window, 'sliding', FUNCTION, local_window);
    
end