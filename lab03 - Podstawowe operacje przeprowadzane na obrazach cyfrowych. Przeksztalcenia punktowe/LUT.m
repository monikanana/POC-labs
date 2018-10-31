function LUT(obraz, przekodowanie)

    figure(1)
    subplot(2,2,1:2); imshow(obraz); title("oryginalny"); 
    subplot(2,2,3); plot(przekodowanie); title("przekodowanie"); 
    subplot(2,2,4); imshow(intlut(obraz, przekodowanie)); title("przekodowany obraz");

end

