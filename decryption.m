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
cnt = 0;
for m1=8:8:768
    for n1=8:8:1024
        b=idct_val_2(m1-7:m1,n1-7:n1);
        dct_out=dct2(b);
        q1 = dct_out(1:4,1:4);
        q2 = dct_out(5:8,1:4);
        q3 = dct_out(1:4,5:8);
        q4 = dct_out(5:8,5:8);
        p1 = q2(3,4)-mu;
        p2 = q3(3,4)-mu;
        p3 = q4(3,4)-mu;
        mu = q4(4,4)-mu;
        if(p1>mu)
            b_out2(cnt+1) = true;
        else
            b_out2(cnt+1) = false;
        end
        if(p2>mu)
            b_out2(cnt+2) = true;
        else
            b_out2(cnt+2) = false;
        end
        if(p3>mu)
            b_out2(cnt+3) = true;
        else
            b_out2(cnt+3) = false;
        end
        if ((cnt+1)>=length(s2_array))
            break
        end
        if ((cnt+2)>=length(s2_array))
            break
        end
        if ((cnt+3)>=length(s2_array))
            break
        end
        cnt = cnt + 3;
    end
end
b_out2(end)=[];
s2_out=reshape(b_out2,[74,100]); 
corr2(s2,s2_out)
corr2(s1,s1_out)
z1=~s2_out;
for m=2:2:74
    for n=2:2:100
        ba=z1(m-1:m,n-1:n);
        bb=xor(ba,s);
        sc(m-1:m,n-1:n)=bb;
    end
end

imtool(sc)