//
//  ItemDatabase.m
//  Every.Do
//
//  Created by Anthony Coelho on 2016-05-17.
//  Copyright © 2016 Anthony Coelho. All rights reserved.
//

#import "ItemDatabase.h"
#import "ToDo.h"

@implementation ItemDatabase

- (instancetype)init{
    self = [super init];
    if (self) {
        
        [self populateItemsArray];
    }
    return self;
}

- (void)populateItemsArray {
    
    
    
    ToDo *item1 = [[ToDo alloc] initWithTitle:@"Paint Bedroom" itemDescription:@"Bedroom must be painted blue" priorityNumber:1];
    ToDo *item2 = [[ToDo alloc] initWithTitle:@"Takeout Garbage" itemDescription:@"Remove all garbage from house" priorityNumber:1];
    ToDo *item3 = [[ToDo alloc] initWithTitle:@"Clean Dished" itemDescription:@"Load dishwasher with dishes" priorityNumber:1];
    
    _itemsArray = [[NSMutableArray alloc] initWithObjects:item1, item2, item3, nil];
    
    
    
}

@end
