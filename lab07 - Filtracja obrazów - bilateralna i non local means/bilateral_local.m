function data_filtered = bilateral_local(data, local_window)

    Nx = size(data,2);

    parametr_ro = 25; % poziom szumu w obrazie 

    h = fspecial('gaussian', local_window, 25);

    for i = 1:Nx
        %% lokalny blok
        patch = reshape(data(:, i), local_window);

        %% obliczenie wspolczynnikow odleglosci w dziedzinie przestrzennej obrazu
        [rows, cols] = find(patch == patch);
        rows = reshape(rows, local_window);
        cols = reshape(cols, local_window);

        Ncy = ceil(local_window(1)/2);
        Ncx = ceil(local_window(2)/2);

        dist = sqrt((Ncy - rows).^2 + (Ncx - cols).^2);

        %% odleglosc w przeciwdziedzinie obrazu
        y = abs(patch - patch(Ncy,Ncx));

        gamma = exp(((-1)*(y .* y))/(2*parametr_ro*parametr_ro));
        
        h = exp(((-1)*(dist .* dist))/(2*parametr_ro*parametr_ro));
        %% przemnozenie bloku 'patch' przez wspolczynnik 'h'
        data_filtered(i) = sum(sum(gamma .* patch .* h)/ sum(sum(gamma))) ;
    end
end

