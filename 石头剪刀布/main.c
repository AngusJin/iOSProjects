//
//  main.c
//  石头剪刀布
//
//  Created by 金汉东 on 2018/4/16.
//  Copyright © 2018年 金汉东. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <time.h>
int main()
{
    int computer;
    int result;
    char player;
    while (1){
        printf("请选择你要出的选项：\n");
        printf("A:剪刀\nB:石头\nC:布\n");
        scanf("%c%*c",&player);
        switch (player ){
            case 65:  //A
            case 97:  //a
                player=4;
                break;
            case 66:  //B
            case 98:  //b
                player=7;
                break;
            case 67:  //C
            case 99:  //c
                player=10;
                break;
                return 0;
        }
        
        
        srand((unsigned)time(NULL));  // 随机数种子
        computer=rand()%3;  // 产生随机数 取余
        result=(int)player +computer;
        printf("电脑出了");
        switch (computer)
        {
            case 0:printf("剪刀\n");break; //4  1
            case 1:printf("石头\n");break; //7  2
            case 2:printf("布\n");break;   //10 3
        }
        printf("你出了");
        switch (player )
        {
            case 4:printf("剪刀\n");break;
            case 7:printf("石头\n");break;
            case 10:printf("布\n");break;
        }
        if (result==6||result==7||result==11)
            printf("You Win!\n");
        else if (result==5||result==9||result==10)
            printf("Computer Win!\n");
        else
            printf("平手\n");
      
    }
    return 0;
}

