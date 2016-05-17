//
//  ItemDatabase.h
//  Every.Do
//
//  Created by Anthony Coelho on 2016-05-17.
//  Copyright © 2016 Anthony Coelho. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ItemDatabase : NSObject

@property (copy, nonatomic) NSMutableArray *itemsArray;

-(instancetype) init;

@end
