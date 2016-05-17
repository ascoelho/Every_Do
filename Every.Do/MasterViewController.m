//
//  MasterViewController.m
//  Every.Do
//
//  Created by Anthony Coelho on 2016-05-17.
//  Copyright © 2016 Anthony Coelho. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "CustomTableViewCell.h"
#import "ToDo.h"
#import "ModalViewController.h"


@interface MasterViewController () <ModalViewControllerDelegate>

//@property NSMutableArray *objects;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(showModalVC:)];
    
    self.navigationItem.rightBarButtonItem = addButton;
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    self.database = [[ItemDatabase alloc] init];
    
    self.tableView.rowHeight = 80.0;
    
//    Add a swipe gesture recognizer to your table view
//    When the gesture fires, update your data model objects and rearrange your list
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(markComplete:)];
    swipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self.tableView addGestureRecognizer:swipe];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(ToDo *)item {
    if (!self.database.itemsArray) {
        self.database.itemsArray = [[NSMutableArray alloc] init];
    }

    [self.database.itemsArray addObject:item];
    [self.tableView reloadData];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        ToDo *item = self.database.itemsArray[indexPath.row];
        
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        
        [controller setDetailItem:item];
        
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
    if ([[segue identifier] isEqualToString:@"showModalVC"]) {
        
        ModalViewController *modalVC = (ModalViewController *)[segue destinationViewController];
        modalVC.delegate = self;

    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.database.itemsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell" forIndexPath:indexPath];
    
    
    
    ToDo *item = self.database.itemsArray[indexPath.row];
    
    if (item.isCompleted == YES) {
        
        cell.itemTitleLabel.attributedText = [[NSAttributedString alloc] initWithString:item.itemTitle
                                                              attributes:@{NSStrikethroughStyleAttributeName:
                                                                               [NSNumber numberWithInteger:NSUnderlineStyleSingle]}];
      
        cell.itemDescriptionLabel.attributedText = [[NSAttributedString alloc] initWithString:item.itemDescription
                                                              attributes:@{NSStrikethroughStyleAttributeName:
                                                                               [NSNumber numberWithInteger:NSUnderlineStyleSingle]}];
    }
    else {
    cell.itemTitleLabel.text = item.itemTitle;
    cell.itemDescriptionLabel.text = item.itemDescription;
       
    }
    cell.itemPriorityNumber.text = [NSString stringWithFormat:@"%d",item.priorityNumber];
    cell.itemStatus.text = [NSString stringWithFormat:@"%@", item.isCompleted ? @"Completed" : @"Not Completed"];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.database.itemsArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}


- (void)showModalVC:(id)sender {

    
    [self performSegueWithIdentifier:@"showModalVC" sender:self];
    
}

- (void)returnToDoItem:(ToDo *)item{
    
    [self insertNewObject:item];
    
}

- (void)markComplete:(id)sender {
    
    if ([sender isKindOfClass:[UISwipeGestureRecognizer class]]) {
  
        CGPoint swipePoint = [sender locationInView:self.tableView];
        NSIndexPath *indexPathOfSwipedCell = [self.tableView indexPathForRowAtPoint:swipePoint];
        
        ToDo *item = self.database.itemsArray[indexPathOfSwipedCell.row];
        item.isCompleted = YES;
        
        self.database.itemsArray[indexPathOfSwipedCell.row] = item;
        [self.tableView reloadData];
    }

    
}


@end
