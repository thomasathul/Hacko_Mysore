function GUI2()
    MyGUI()
    function MyGUI()
    % Create the main window
    mainFig = figure('Name', 'Encryption/Decryption GUI', 'Position', [200, 200, 400, 300], 'Color', [0.9 0.9 0.9],'Toolbar','none','Menubar','none');
    set(mainFig,'NumberTitle','off');
    % Create the encrypt button
    encryptBtn = uicontrol('Parent', mainFig, 'Style', 'pushbutton', 'String', 'Encrypt', 'Position', [150, 20, 100, 30], 'BackgroundColor', 'yellow', 'Callback', @showEncryptPanel);

    % Create the decrypt button
    decryptBtn = uicontrol('Parent', mainFig, 'Style', 'pushbutton', 'String', 'Decrypt', 'Position', [260, 20, 100, 30], 'BackgroundColor', 'yellow', 'Callback', @showDecryptPanel);

    % Create the encrypt panel as a fixed screen within the main window
    encryptPanel = uipanel('Parent', mainFig, 'Title', 'Encrypt', 'Position', [0.05, 0.2, 0.9, 0.7], 'BackgroundColor', [1,0.7,0.7], 'Visible', 'on');

    % Create the encrypt window elements within the encrypt panel
    encryptsourceLabel = uicontrol('Parent', encryptPanel, 'Style', 'text', 'String', 'Source:', 'Position', [50, 160, 60, 20], 'BackgroundColor', [0.8 0.8 0.8]);
    encryptsourceDisplayBox = uicontrol('Parent', encryptPanel, 'Style', 'text', 'String', '', 'Position', [120, 160, 120, 20]);
    encryptsourceSelectBtn = uicontrol('Parent', encryptPanel, 'Style', 'pushbutton', 'String', 'Select File', 'Position', [260, 160, 100, 20], 'Callback', @encryptsourceSelectCallback);

    encryptImg1Label = uicontrol('Parent', encryptPanel, 'Style', 'text', 'String', 'Image 1:', 'Position', [50, 120, 60, 20], 'BackgroundColor', [0.8 0.8 0.8]);
    encryptImg1DisplayBox = uicontrol('Parent', encryptPanel, 'Style', 'text', 'String', '', 'Position', [120, 120, 120, 20]);
    encryptImg1SelectBtn = uicontrol('Parent', encryptPanel, 'Style', 'pushbutton', 'String', 'Select File', 'Position', [260, 120, 100, 20], 'Callback', @encryptImg1SelectCallback);

    encryptImg2Label = uicontrol('Parent', encryptPanel, 'Style', 'text', 'String', 'Image 2:', 'Position', [50, 90, 60, 20], 'BackgroundColor', [0.8 0.8 0.8]);
    encryptImg2DisplayBox = uicontrol('Parent', encryptPanel, 'Style', 'text', 'String', '', 'Position', [120, 90, 120, 20]);
    encryptImg2SelectBtn = uicontrol('Parent', encryptPanel, 'Style', 'pushbutton', 'String', 'Select File', 'Position', [260, 90, 100, 20], 'Callback', @encryptImg2SelectCallback);

    encryptSendBtn = uicontrol('Parent', encryptPanel, 'Style', 'pushbutton', 'String', 'Send', 'Position', [140, 30, 100, 30], 'BackgroundColor', 'white', 'Callback', @encryptSendCallback);

    % Create the decrypt panel as a fixed screen within the main window
    decryptPanel = uipanel('Parent', mainFig, 'Title', 'Decrypt', 'Position', [0.05, 0.2, 0.9, 0.7], 'BackgroundColor', [0.8 0.9 0.8], 'Visible', 'off');

    % Create the decrypt window elements within the decrypt panel
    decryptImg1Label = uicontrol('Parent', decryptPanel, 'Style', 'text', 'String', 'Image 1:', 'Position', [50, 120, 60, 20], 'BackgroundColor', [0.8 0.8 0.8]);
    decryptImg1DisplayBox = uicontrol('Parent', decryptPanel, 'Style', 'text', 'String', '', 'Position', [120, 120, 120, 20]);
    decryptImg1SelectBtn = uicontrol('Parent', decryptPanel, 'Style', 'pushbutton', 'String', 'Select File', 'Position', [260, 120, 100, 20], 'Callback', @decryptImg1SelectCallback);

    decryptImg2Label = uicontrol('Parent', decryptPanel, 'Style', 'text', 'String', 'Image 2:', 'Position', [50, 90, 60, 20], 'BackgroundColor', [0.8 0.8 0.8]);
    decryptImg2DisplayBox = uicontrol('Parent', decryptPanel, 'Style', 'text', 'String', '', 'Position', [120, 90, 120, 20]);
    decryptImg2SelectBtn = uicontrol('Parent', decryptPanel, 'Style', 'pushbutton', 'String', 'Select File', 'Position', [260, 90, 100, 20], 'Callback', @decryptImg2SelectCallback);

    decryptSendBtn = uicontrol('Parent', decryptPanel, 'Style', 'pushbutton', 'String', 'Send', 'Position', [140, 30, 100, 30], 'BackgroundColor', 'white', 'Callback', @decryptSendCallback);
    % Callback functions

    function showEncryptPanel(~, ~)
        set(encryptPanel, 'Visible', 'on');
        set(decryptPanel, 'Visible', 'off');
    end

    function showDecryptPanel(~, ~)
        set(encryptPanel, 'Visible', 'off');
        set(decryptPanel, 'Visible', 'on');
    end

    function encryptsourceSelectCallback(~, ~)
        [filename, pathname] = uigetfile('*.png', 'Select an image file');
        if isequal(filename, 0) || isequal(pathname, 0)
            disp('No file selected.');
        else
            fullFilePath1 = fullfile(pathname, filename);
            set(encryptsourceDisplayBox, 'String', filename);
            disp(['Selected file for Image 1: ', fullFilePath1]);
        end
    end

    function encryptImg1SelectCallback(~, ~)
        [filename, pathname] = uigetfile('*.jpg', 'Select an image file');
        if isequal(filename, 0) || isequal(pathname, 0)
            disp('No file selected.');
        else
            fullFilePath2 = fullfile(pathname, filename);
            set(encryptImg1DisplayBox, 'String', filename);
            disp(['Selected file for Image 1: ', fullFilePath2]);
        end
    end

    function encryptImg2SelectCallback(~, ~)
        [filename, pathname] = uigetfile('*.jpg', 'Select an image file');
        if isequal(filename, 0) || isequal(pathname, 0)
            disp('No file selected.');
        else
            fullFilePath3 = fullfile(pathname, filename);
            set(encryptImg2DisplayBox, 'String', filename);
            disp(['Selected file for Image 2: ', fullFilePath3]);
        end
    end

    function encryptSendCallback(~, ~)
        i=imread(fullFilePath1);
        u=rgb2gray(i);
        y=imbinarize(u,.9);
        s=[true,true;false,true];
        for m=2:2:74
            for n=2:2:100
                b=y(m-1:m,n-1:n);
                b1=xor(b,s);
                s1(m-1:m,n-1:n)=b1;
            end
        end
        s2=~s1;
        figure;imshow(y)
        figure;imshow(s1)
        figure;imshow(s2)
        c11=rgb2gray(fullFilePath2);
        c12=rgb2gray(fullFilePath3);
        cnt = 0;
        s1_array = s1(:);
        idct_val_1 = c11;
        for m1=8:8:768
            for n1=8:8:1024
                k1=s1_array(cnt+1);
                if ((cnt+1)>=length(s1_array))
                    break
                end
                k2=s1_array(cnt+2);
                if ((cnt+2)>=length(s1_array))
                    break
                end
                k3=s1_array(cnt+3);
                if ((cnt+3)>=length(s1_array))
                    break
                end
                cnt = cnt + 3;
                b=c11(m1-7:m1,n1-7:n1);
                dct_out=dct2(b);
                q1 = dct_out(1:4,1:4);
                q2 = dct_out(5:8,1:4);
                q3 = dct_out(1:4,5:8);
                q4 = dct_out(5:8,5:8);
                qe = [q2;q3;q4];
                mu = max(max(abs(qe)));
                %================for Each Block===============%
                if(k1==true)
                    q2(3,4) = (q2(3,4))+mu;
                else
                    q2(3,4) = (q2(3,4))-mu;
                end
                if(k2==true)
                    q3(3,4) = (q3(3,4))+mu;
                else
                    q3(3,4) = (q3(3,4))-mu;
                end
                if(k3==true)
                    q4(3,4) = (q4(3,4))+mu;
                else
                    q4(3,4) = (q4(3,4))-mu;
                end
                q2(1,4)=mu;
                qb=[q1,q3;q2,q4];
                idct_val_1(m1-7:m1,n1-7:n1)=idct2(qb);
            end
        end
        figure;imshow(idct_val_1);
        cnt = 0;
        s2_array = s2(:);
        idct_val_2 = c12;
        for m1=8:8:768
            for n1=8:8:1024
                k1=s2_array(cnt+1);
                if ((cnt+1)>=length(s2_array))
                    break
                end
                k2=s2_array(cnt+2);
                if ((cnt+2)>=length(s2_array))
                    break
                end
                k3=s2_array(cnt+3);
                if ((cnt+3)>=length(s2_array))
                    break
                end
                cnt = cnt + 3;
                b=c12(m1-7:m1,n1-7:n1);
                dct_out=dct2(b);
                q1 = dct_out(1:4,1:4);
                q2 = dct_out(5:8,1:4);
                q3 = dct_out(1:4,5:8);
                q4 = dct_out(5:8,5:8);
                qe = [q2;q3;q4];
                mu = max(max(abs(qe)));
                %================for Each Block===============%
                if(k1==true)
                    q2(3,4) = abs(q2(3,4))+mu;
                else
                    q2(3,4) = abs(q2(3,4))-mu;
                end
                if(k2==true)
                    q3(3,4) = abs(q3(3,4))+mu;
                else
                    q3(3,4) = abs(q3(3,4))-mu;
                end
                if(k3==true)
                    q4(3,4) = abs(q4(3,4))+mu;
                else
                    q4(3,4) = abs(q4(3,4))-mu;
                end
                q2(1,4)=mu;
                qb=[q1,q3;q2,q4];
                idct_val_2(m1-7:m1,n1-7:n1)=idct2(qb);
            end
        end
        figure;imshow(idct_val_2);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        cnt=0;
        for m1=8:8:768
            for n1=8:8:1024
                b=idct_val_1(m1-7:m1,n1-7:n1);
                dct_out=dct2(b);
                q1 = dct_out(1:4,1:4);
                q2 = dct_out(5:8,1:4);
                q3 = dct_out(1:4,5:8);
                q4 = dct_out(5:8,5:8);
                p1 = q2(3,4)-mu;
                p2 = q3(3,4)-mu;
                p3 = q4(3,4)-mu;
                mu = q4(4,4)-mu;
                if(p1>=mu)
                    b_out1(cnt+1) = true;
                else
                    b_out1(cnt+1) = false;
                end
                if(p2>=mu)
                    b_out1(cnt+2) = true;
                else
                    b_out1(cnt+2) = false;
                end
                if(p3>=mu)
                    b_out1(cnt+3) = true;
                else
                    b_out1(cnt+3) = false;
                end
                if ((cnt+1)>=length(s1_array))
                    break
                end
                if ((cnt+2)>=length(s1_array))
                    break
                end
                if ((cnt+3)>=length(s1_array))
                    break
                end
                cnt = cnt + 3;
            end
        end
        b_out1(end)=[];
        s1_out=reshape(b_out1,[74,100]);
        figure;imshow(s1_out);
    end

    function decryptImg1SelectCallback(~, ~)
        [filename, pathname] = uigetfile('*.jpg', 'Select an image file');
        if isequal(filename, 0) || isequal(pathname, 0)
            disp('No file selected.');
        else
            fullFilePath2 = fullfile(pathname, filename);
            set(decryptImg1DisplayBox, 'String', filename);
            disp(['Selected file for Image 1: ', fullFilePath2]);
        end
    end

    function decryptImg2SelectCallback(~, ~)
        [filename, pathname] = uigetfile('*.jpg', 'Select an image file');
        if isequal(filename, 0) || isequal(pathname, 0)
            disp('No file selected.');
        else
            fullFilePath3 = fullfile(pathname, filename);
            set(decryptImg2DisplayBox, 'String', filename);
            disp(['Selected file for Image 2: ', fullFilePath3]);
        end
    end

    function decryptSendCallback(~, ~)
        disp('Decrypt button clicked');
    end

    % Show the main window
    set(mainFig, 'Visible', 'on');
    end
end
% Call the main GUI function
