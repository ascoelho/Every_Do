//
//  ToDo.h
//  Every.Do
//
//  Created by Anthony Coelho on 2016-05-17.
//  Copyright © 2016 Anthony Coelho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDo : NSObject

@property (copy, nonatomic) NSString *itemTitle;
@property (copy, nonatomic) NSString *itemDescription;
@property int priorityNumber;
@property BOOL isCompleted;

- (instancetype)initWithTitle:(NSString *)itemTitle itemDescription:(NSString *)itemDescription priorityNumber:(int)priorityNumber;


@end
