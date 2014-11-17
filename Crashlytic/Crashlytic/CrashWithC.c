//
//  CrashWithC.c
//  Crashtest
//
//  Created by broy denty on 14-10-31.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#include "CrashWithC.h"
void crashWithNull()
{
    int* p = malloc(sizeof(int)*10);
    for (int i =0; i<10; i++) {
        p[i] = i;
    }
    free(p);
    free(p);
}