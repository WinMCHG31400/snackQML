#include "Base.h"

Base::Base()
{
    srand(time(0));
    switch(int(rand()*3))
    {
    case 0:
        m[int(rand()*3)][0]=1;
        break;
    case 1:
        m[int(rand()*3)][3]=1;
        break;
    case 2:
        m[0][int(rand()*3)]=1;
        break;
    case 3:
        m[3][int(rand()*3)]=1;
        break;
    default:exit(1);
    }
}

bool Base::move(int type)
{
    int x,y,i;
    switch(type)
    {
    case 0:
        for(y=0;y<=3;y++)
            for(x=1;x<=3;x++)
                if(m[x][y]>0)
                    for(i=x;i>=1;i--)
                    {
                        if(m[i-1][y]==0)
                        {
                            m[i-1][y]=m[i][y];
                            m[i][y]=0;
                        }
                        else if(m[i-1][y]==m[1][y])
                        {
                            m[i-1][y]*=2;
                            m[i][y]=0;
                            setgold(i-1,y);
                        }
                    }
        break;
    case 1:
        for(y=0;y<=3;y++)
            for(x=2;x>=0;x--)
                if(m[x][y]>0)
                    for(i=x;i<=2;i++)
                    {
                        if(m[i+1][y]==0)
                        {
                            m[i+1][y]=m[i][y];
                            m[i][y]=0;
                        }
                        else if(m[i+1][y]==m[1][y])
                        {
                            m[i+1][y]*=2;
                            m[i][y]=0;
                            setgold(i-1,y);
                        }
                    }
        break;
    case 2:
        for(x=0;x<=3;x++)
            for(y=1;y<=3;y++)
                if(m[x][y]>0)
                    for(i=y;i>=1;i--)
                    {
                        if(m[x][i-1]==0)
                        {
                            m[x][i-1]=m[x][i];
                            m[x][y]=0;
                        }
                        else if(m[x][i-1]==m[x][i])
                        {
                            m[x][i-1]*=2;
                            m[x][i]=0;
                            setgold(x,i-1);
                        }
                    }
        break;
    case 3:
        for(x=0;x<=3;x++)
            for(y=2;y>=0;y--)
                if(m[x][y]>0)
                    for(i=y;i<=2;i++)
                    {
                        if(m[x][i+1]==0)
                        {
                            m[x][i+1]=m[x][i];
                            m[x][y]=0;
                        }
                        else if(m[x][i+1]==m[x][i])
                        {
                            m[x][i+1]*=2;
                            m[x][i]=0;
                            setgold(x,i+1);
                        }
                    }
        break;
    default:exit(1);
    }
    return create();
}

bool Base::create()
{
    int x[12],y[12],a,b,i=0;
    for(b=0;b<=3;b++)
        for(a=0;a<=3;a++)
            if(m[a][b]==0)
            {
                x[i]=a;
                y[i]=b;
                i++;
            }
    for(b=1;b<=2;b=2)
        for(a=0;a<=3;a=3)
            if(m[a][b]==0)
            {
                x[i]=a;
                y[i]=b;
                i++;
            }
    if(i==0) return false;
    i*=rand();
    m[x[i]][y[i]]=rand()>0.8 ? 2:1;
    return true;
}
