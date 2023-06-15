clc;
close all;
clear all;
i=imread('i3.png');
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
c11=rgb2gray(imread('Desert.jpg'));
c12=rgb2gray(imread('Hydrangeas.jpg'));
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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