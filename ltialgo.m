import test.*
fileID = fopen('F:\Major Project\project\stock_market_test_final.csv');
fgetl(fileID);
C_t = textscan(fileID,'%s %f %f %f %f','delimiter',',');
fclose(fileID);
ath = cell2mat(C_t(1, 5));
Close_t = cell2mat(C_t(1, 5));
Close_t = Close_t.';
%%User enters parameters for RoE
equity = input('Enter Equity holded');
li=1;
len = size( Close_t,2)
ns= input('number of stocks');
%%Calculating All time High
for i=1:len
    if (floor(ath) <= floor(Close_t(i)))
       ath=floor(Close_t(i));
    end
end
ma_10 = tsmovavg(Close_t,'e',10);
ma_20 = tsmovavg(Close_t,'e',20);
pp
ath
if ( pp>= 1.15*ath)
    disp( "start buying stocks now")                                                                                                                                                                                                         
    inip= pp;
    flag = 1;
else 
    disp( "do not invest and wait for tommorow") 

if (flag == 1)
    for i=1:len
        if ( pp < ma_10) 
            disp("start selling partial stocks")
            if ( pp < ma_20)
                flag=0;
                exip= pp;
                disp( "sell stocks for best ROE factor")
            end
            continue;
        end
    end
end

%%Calculation of return of Equity
if ( flag == 0 )
  profit = ( exip - inip ) * ns;
  roe = (profit)/equity;
  disp ( "hence the maximum RoE for the stock is %f", roe)
end
if ( flag ==1)
  decide(Close_t(1i+1))
end
        
       
end
        
        