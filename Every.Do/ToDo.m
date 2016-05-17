//
//  ToDo.m
//  Every.Do
//
//  Created by Anthony Coelho on 2016-05-17.
//  Copyright © 2016 Anthony Coelho. All rights reserved.
//

#import "ToDo.h"

@implementation ToDo

- (instancetype)initWithTitle:(NSString *)itemTitle itemDescription:(NSString *)itemDescription priorityNumber:(int)priorityNumber {
    
    self = [super init];
    if (self) {
        
        _itemTitle = itemTitle;
        _itemDescription = itemDescription;
        _priorityNumber = priorityNumber;
        _isCompleted = NO;
    }
    return self;
    
}

@end
