function oF = framePrediction(iF, iMF, iCP, iSize)
    [Y, X] = size(iF);
    [N, M, ~] = size(iMF);
    oF = zeros(Y, X);

    for n= 1:N
        for m = 1:M
            x_st = floor(iCP(n, m, 1) - iSize(1) / 2) + 1;
            y_st = floor(iCP(n, m, 2) - iSize(2) / 2) + 1;

            x_end = x_st + iSize(1) - 1;
            y_end = y_st + iSize(2) - 1;

            predictFrame2 = circshift(iF, [iMF(n, m, 2), iMF(n, m, 1)]); % circularly shifts the elements in array A by K positions

            oF(y_st:y_end, x_st:x_end) = predictFrame2(y_st:y_end, x_st:x_end);
        end
    end
end
