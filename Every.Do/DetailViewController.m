//
//  DetailViewController.m
//  Every.Do
//
//  Created by Anthony Coelho on 2016-05-17.
//  Copyright © 2016 Anthony Coelho. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.itemTitleLabel.text = self.detailItem.itemTitle;
        self.itemDescriptionLabel.text = self.detailItem.itemDescription;
        self.itemPriorityLabel.text = [NSString stringWithFormat:@"%d",self.detailItem.priorityNumber];
        self.itemStatusLabel.text = [NSString stringWithFormat:@"%@", self.detailItem.isCompleted ? @"Completed" : @"Not Completed"];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
