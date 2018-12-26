function [num,x,y]=mycontour(A)
%%%% 找二值连通图的外轮廓，二值图以1表示前景，0表示背景
%%%% A:  图像矩阵； num: 轮廓点数；x,y:轮廓点列的横纵坐标向量

%%%%%下面的程序对图像横向扫描，找第一个前景点
finded=0;     %  设置一个标志量，用于标记是否找到第一个前景点
i=1;      %  搜索的起始行
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
    error('图像为空白图像')
end

%%%%%%%%%%%%  下面的程序找第2个轮廓点
direction=0;
go=1;   % 设置标志：是否继续搜索下一轮廓点
[exit,direct,vert,horiz ]=findnextpixel(A, direction,i, j);        %寻找邻接点
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
%%%%%%%%%%%%  下面的程序绕图像外围按顺时针进行轮廓跟踪

while go==1
    [exit,direct,vert,horiz ]=findnextpixel(A, direction,i, j);        %寻找邻接点
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
function     [exit,direct,vert, horiz]=findnextpixel(A, direction,i, j);        %寻找下一轮廓点
%%%%%%%%%   direction:当前方向； i,j：当前轮廓点坐标； direct: 新方向； vert,horiz: 新轮廓点坐标
%%%%%%%%%   exit:   标记下一轮廓点是否存在
direct=-1; vert=-1; horiz=-1;
switch direction
    case {0, 2, 4, 6}   %  0,1,2,3,4,5,6,7分别代表8个不同的方向（逆时针变化），0表示水平向右
        exit=0;
        path=mod([direction+1:-1:direction-3]+8,8);    %  接下来的可能搜索方向
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
                
                
                
%%%%%%  下面的程序设定不同方向的位移量                
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
