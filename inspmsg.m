% inspmsg.m

randomNum = round(rand(1)*10);

switch randomNum
    
    case 0
        load ic0file
        datamsg = msgbox('Wow! You''ve been very productive today!','Success','custom',ic0);
    case 1
        load ic1file
        datamsg = msgbox('100 shots? That''s a lot!','Success','custom',ic1);
    case 2
        load ic2file
        datamsg = msgbox('Woohoo! You''re amazing!','Success','custom',ic2);
    case 3
        load ic3file
        datamsg = msgbox('Great, kid. Don''t get cocky.','Success','custom',ic3);
    case 4
        load ic4file
        datamsg = msgbox('Do or do not. There is no try.','Success','custom',ic4);
    case 5        
        load ic5file
        datamsg = msgbox('Follow your dreams!','Success','custom',ic5);
    case 6
        load ic6file
        datamsg = msgbox('A day may come when the courage of men fails, BUT IT IS NOT THIS DAY!”','Success','custom',ic6);
    case 7
        load ic7file
        datamsg = msgbox('You are a leaf in the wind.','Success','custom',ic7);
    case 8
        load ic8file
        datamsg = msgbox('Unbelievable. You, [subject name here], must be the pride of [subject hometown here].','Success','custom',ic8);
    case 9
        load ic9file
        datamsg = msgbox('Don''t forget the five steps!','Success','custom',ic9);
        
end