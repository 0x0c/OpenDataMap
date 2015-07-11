//
//  DataViewController.m
//  MapKit_GSI
//
//  Created by Akira Matsuda on 6/29/15.
//  Copyright (c) 2015 Akira Matsuda. All rights reserved.
//

#import "DataViewController.h"
#import <CoreLocation/CoreLocation.h>
#import "API.h"
#import "Constant.h"
#import "M2DAPIGatekeeper.h"
#import "ODESDataRequestResponse.h"
#import "GGCRGeocodingResponse.h"
#import "MKGSIAnnotation.h"
#import "AppDelegate.h"
//#import "MKGSICityEntry.h"

@interface DataViewController ()

@property (nonatomic, strong) ODESDataRequestResponse *response;

@end

@implementation DataViewController

- (void)viewDidLoad
{
	[super viewDidLoad];

	// Uncomment the following line to preserve selection between presentations.
	// self.clearsSelectionOnViewWillAppear = NO;

	// Uncomment the following line to display an Edit button in the navigation bar for this view controller.
	// self.navigationItem.rightBarButtonItem = self.editButtonItem;
	__weak typeof(self) bself = self;
	M2DAPIRequest *requset = [[[[[[[M2DAPIRequest GETRequest:[NSURL URLWithString:GetStatsDataAPI]] parametors:@{
		@"statsDataId" : self.tableInfo.tableInfoIdentifier,
		@"metaGetFlg" : @"Y",
		@"cntGetFlg" : @"N",
		@"cdTimeFrom" : @"2013"
	}] whenSucceeded:^(M2DAPIRequest *request, NSDictionary *httpHeaderFields, ODESDataRequestResponse *parsedObject) {
		bself.response = parsedObject;
		dispatch_async(dispatch_get_main_queue(), ^{
		    [bself.tableView reloadData];
		});
	}] whenFailed:^(M2DAPIRequest *request, NSDictionary *httpHeaderFields, ODESDataRequestResponse *parsedObject, NSError *error) {
		NSLog(@"%@", parsedObject.statsData.result.errorMessage);
	}] parseAlgorithm:^id(NSData *data, NSError *__autoreleasing *error) {
		NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:error];
		ODESDataRequestResponse *response = [ODESDataRequestResponse modelObjectWithDictionary:result];
		return response;
	}] resultCondition:^BOOL(M2DAPIRequest *request, NSURLResponse *response, ODESDataRequestResponse *parsedObject, NSError *__autoreleasing *error) {
		return parsedObject.statsData;
	}] asynchronousRequest];
	[[M2DAPIGatekeeper sharedInstance] sendRequest:requset];

	UIBarButtonItem *addAnnotationButton = [[UIBarButtonItem alloc] initWithTitle:@"Annotate" style:UIBarButtonItemStyleDone target:self action:@selector(annotateData)];
	self.navigationItem.rightBarButtonItem = addAnnotationButton;
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	self.title = self.tableInfo.title.name;
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
	return self.response.statsData.statisticalData.dataInfo.value.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
	}
	// Configure the cell...
	ODESValue *value = self.response.statsData.statisticalData.dataInfo.value[indexPath.row];
	ODESDataClassClass *dataClass = nil;
	ODESDataClassObject *classObject = [self.response.statsData.statisticalData classObjectForClassObjectIdentifier:@"cat01"];
	for (ODESDataClassClass *c in classObject.classProperty) {
		if ([c.code isEqualToString:value.cat01]) {
			dataClass = c;
			break;
		}
	}

	cell.textLabel.text = dataClass.name;
	cell.detailTextLabel.text = [NSString stringWithFormat:@"%@%@\t(%@)", value.value, value.unit, value.cat01];

	return cell;
}

#pragma mark -

- (NSManagedObjectContext *)managedObjectContext
{
	AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
	return delegate.managedObjectContext;
}

- (void)annotateData
{

}

@end
