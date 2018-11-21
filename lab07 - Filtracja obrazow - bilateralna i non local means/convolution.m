function data_filtered = convolution(data, local_window)

    % uchwyt do funkcji 'convolution_local'
    FUNCTION = @(data_, local_window_)convolution_local(data_, local_window_);

    % przekazanie uchwytu FUNCTION do mechanizmu 'confilt'
    data_filtered = colfilt(data, local_window, 'sliding', FUNCTION, local_window);

end
