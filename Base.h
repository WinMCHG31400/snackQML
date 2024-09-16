#ifndef BASE_H
#define BASE_H
#include<math.h>
#include<time.h>
#include<QObject>
#define _LEFT 0
#define _RIGHT 1
#define _UP 2
#define _DOWN 3

class Base:public QObject
{
    Q_OBJECT
private:
    int m[4][4];
    int gold;
    bool create();
    void setgold(int x,int y){if(m[x][y]>gold) gold=m[x][y];}
public:
    Base();
    bool move(int type);
    int show(int x, int y)
    {return m[x][y];}
    int getgold(){return gold;}
};

#endif // BASE_H
