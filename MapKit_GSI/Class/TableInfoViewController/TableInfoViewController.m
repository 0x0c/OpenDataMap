//
//  TableInfoViewController.m
//  MapKit_GSI
//
//  Created by Akira Matsuda on 6/29/15.
//  Copyright (c) 2015 Akira Matsuda. All rights reserved.
//

#import "TableInfoViewController.h"
#import "API.h"
#import "Constant.h"
#import "M2DAPIGatekeeper.h"
#import "ODESDataRequestResponse.h"
#import "GGCRGeocodingResponse.h"
#import "MKGSIAnnotation.h"
#import "MKGSICityEntry.h"
#import "AppDelegate.h"
#import "ODESTableInfo.h"
#import "DataViewController.h"

@interface TableInfoViewController ()

@end

@implementation TableInfoViewController

- (void)viewDidLoad
{
	[super viewDidLoad];

	// Uncomment the following line to preserve selection between presentations.
	// self.clearsSelectionOnViewWillAppear = NO;

	// Uncomment the following line to display an Edit button in the navigation bar for this view controller.
	// self.navigationItem.rightBarButtonItem = self.editButtonItem;
	self.title = @"テーブル一覧";
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	// Return the number of sections.
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	// Return the number of rows in the section.
	return self.tableList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	}

	// Configure the cell...
	ODESTableInfo *info = self.tableList[indexPath.row];
	cell.textLabel.text = info.title.name;
	cell.detailTextLabel.text = info.tableInfoIdentifier;

	return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	DataViewController *viewController = [[DataViewController alloc] initWithStyle:UITableViewStylePlain];
	viewController.tableInfo = self.tableList[indexPath.row];
	[self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark -

- (NSManagedObjectContext *)managedObjectContext
{
	AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
	return delegate.managedObjectContext;
}

- (void)annotateAll
{
	NSFetchRequest *fetchRequest = [NSFetchRequest new];
	NSEntityDescription *entityDescription = [NSEntityDescription entityForName:NSStringFromClass([MKGSICityEntry class]) inManagedObjectContext:self.managedObjectContext];
	[fetchRequest setEntity:entityDescription];
	NSPredicate * predicate = [NSPredicate predicateWithFormat:@"(a210101 > a210102)"];
	[fetchRequest setPredicate:predicate];
	NSError *error2;
	NSArray *objects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error2];
	NSLog(@"objects : %@",objects);
	[[NSNotificationCenter defaultCenter] postNotificationName:MKGSIAddManyAnnotationNotification object:nil userInfo:@{@"data":objects}];
}

@end
