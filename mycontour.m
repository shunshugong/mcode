function [num,x,y]=mycontour(A)
%%%% �Ҷ�ֵ��ͨͼ������������ֵͼ��1��ʾǰ����0��ʾ����
%%%% A:  ͼ����� num: ����������x,y:�������еĺ�����������

%%%%%����ĳ����ͼ�����ɨ�裬�ҵ�һ��ǰ����
finded=0;     %  ����һ����־�������ڱ���Ƿ��ҵ���һ��ǰ����
i=1;      %  ��������ʼ��
[height,width]=size(A);
while finded==0&i<=height
    for j=1:width
        if A(i,j)==1
            x(1)=i;y(1)=j;num=1;finded=1;
            break
        end
    end
    if finded==0
        i=i+1;
    end
end
if finded==0
    error('ͼ��Ϊ�հ�ͼ��')
end

%%%%%%%%%%%%  ����ĳ����ҵ�2��������
direction=0;
go=1;   % ���ñ�־���Ƿ����������һ������
[exit,direct,vert,horiz ]=findnextpixel(A, direction,i, j);        %Ѱ���ڽӵ�
if exit>0
    direction=direct;
    i=vert;
    j=horiz;               
    num=num+1;       
    x(num)=i;
    y(num)=j;
else 
    go=0;
end
%%%%%%%%%%%%  ����ĳ�����ͼ����Χ��˳ʱ�������������

while go==1
    [exit,direct,vert,horiz ]=findnextpixel(A, direction,i, j);        %Ѱ���ڽӵ�
    if exit>0
        direction=direct;
        i=vert;
        j=horiz;               
        num=num+1;       
        x(num)=i;
        y(num)=j;
        if abs(y(1)-y(num))<=1&abs(x(1)-x(num))<=1  
            go=0;  
        end
    else 
        go=0;
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function     [exit,direct,vert, horiz]=findnextpixel(A, direction,i, j);        %Ѱ����һ������
%%%%%%%%%   direction:��ǰ���� i,j����ǰ���������ꣻ direct: �·��� vert,horiz: ������������
%%%%%%%%%   exit:   �����һ�������Ƿ����
direct=-1; vert=-1; horiz=-1;
switch direction
    case {0, 2, 4, 6}   %  0,1,2,3,4,5,6,7�ֱ����8����ͬ�ķ�����ʱ��仯����0��ʾˮƽ����
        exit=0;
        path=mod([direction+1:-1:direction-3]+8,8);    %  �������Ŀ�����������
        for k=path
            [dx,dy]=coordinate(k);
            vert=i+dx;
            horiz=j+dy;
            if A(vert,horiz)==1
                exit=1;
                direct=k;
                exit=1;
                break;
            end
        end
    case {1 3 5 7}
        exit=0;
        path=mod([direction+2:-1:direction-3]+8,8);
        for k=path
            [dx,dy]=coordinate(k);
            vert=i+dx;
            horiz=j+dy;
            if A(vert,horiz)==1
                exit=1;
                direct=k;
                exit=1;
                break;
            end
        end
end
                
                
                
%%%%%%  ����ĳ����趨��ͬ�����λ����                
function [dx,dy]=coordinate(k)  
switch k
    case 0
        dx=0;dy=1;
    case 1
        dx=-1;dy=1;
    case 2
        dx=-1;dy=0;
    case 3
        dx=-1;dy=-1;
    case 4
        dx=0;dy=-1;
    case 5
        dx=1;dy=-1;
    case 6
        dx=1;dy=0;
    case 7
        dx=1;dy=1;
end
