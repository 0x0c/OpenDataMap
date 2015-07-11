//
//  ViewController.m
//  MapKit_GSI
//
//  Created by Akira Matsuda on 6/29/15.
//  Copyright (c) 2015 Akira Matsuda. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import "API.h"
#import "Constant.h"
#import "M2DAPIGatekeeper.h"
#import "ODESStatisticListResponse.h"
#import "MKGSIAnnotation.h"
#import "TableInfoViewController.h"
#import "SearchViewController.h"

@interface ViewController () <MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) ODESStatisticListResponse *response;

@end

@implementation ViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	self.title = @"Map";
	
//	NSString *template = @"http://cyberjapandata.gsi.go.jp/xyz/std/{z}/{x}/{y}.png";
	NSString *template = @"http://tile.openstreetmap.org/{z}/{x}/{y}.png";
	MKTileOverlay *overlay = [[MKTileOverlay alloc] initWithURLTemplate:template];
	overlay.canReplaceMapContent = YES;
	[self.mapView addOverlay:overlay level:MKOverlayLevelAboveLabels];
	self.mapView.delegate = self;

	__weak typeof(self) bself = self;
	M2DAPIRequest *request = [[[[[[[M2DAPIRequest GETRequest:[NSURL URLWithString:GetStatsListAPI]] parametors:@{ @"searchKind" : @(3) }] whenSucceeded:^(M2DAPIRequest *request, NSDictionary *httpHeaderFields, ODESStatisticListResponse *parsedObject) {
		bself.response = parsedObject;
	}] whenFailed:^(M2DAPIRequest *request, NSDictionary *httpHeaderFields, ODESStatisticListResponse *parsedObject, NSError *error) {
		NSLog(@"%@", parsedObject.statsList.result.errorMessage);
	}] parseAlgorithm:^id(NSData *data, NSError *__autoreleasing *error) {
		NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:error];
		ODESStatisticListResponse *response = [ODESStatisticListResponse modelObjectWithDictionary:result];
		return response;
	}] resultCondition:^BOOL(M2DAPIRequest *request, NSURLResponse *response, ODESStatisticListResponse *parsedObject, NSError *__autoreleasing *error) {
		return parsedObject.statsList.result.status == 0;
	}] asynchronousRequest];
	[[M2DAPIGatekeeper sharedInstance] sendRequest:request];
	UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"Data" style:UIBarButtonItemStylePlain target:self action:@selector(showData)];
	self.navigationItem.rightBarButtonItem = button;
	
	UIBarButtonItem *removeButton = [[UIBarButtonItem alloc] initWithTitle:@"Remove" style:UIBarButtonItemStylePlain target:self action:@selector(remove)];
	UIBarButtonItem *showSearchViewControllerButton = [[UIBarButtonItem alloc] initWithTitle:@"Search" style:UIBarButtonItemStylePlain target:self action:@selector(showSearchViewController)];
	self.navigationItem.leftBarButtonItems = @[showSearchViewControllerButton, removeButton];

	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addAnnotation:) name:MKGSIAddAnnotationNotification object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(addAnnotations:) name:MKGSIAddManyAnnotationNotification object:nil];
}

- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (MKTileOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay
{
	return [[MKTileOverlayRenderer alloc] initWithOverlay:overlay];
}

-(MKAnnotationView*)mapView:(MKMapView*)mapView viewForAnnotation:(id)annotation
{
	static NSString *PinIdentifier = @"Pin";
	MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:PinIdentifier];
	if (annotationView == nil) {
		annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:PinIdentifier];
		annotationView.animatesDrop = YES;
		annotationView.pinColor = MKPinAnnotationColorRed;
		annotationView.canShowCallout = YES;
	}
	
	return annotationView;
}

#pragma mark -

- (void)showData
{
	TableInfoViewController *viewController = [[TableInfoViewController alloc] initWithStyle:UITableViewStylePlain];
	viewController.tableList = self.response.statsList.dataListInfo.tableInfo;
	[self.navigationController pushViewController:viewController animated:YES];
}

- (void)remove
{
	[self.mapView removeAnnotations:self.mapView.annotations];
}

- (void)showSearchViewController
{
	SearchViewController *viewController = [[SearchViewController alloc] initWithStyle:UITableViewStylePlain];
	UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
	[self.navigationController presentViewController:navigationController animated:YES completion:^{
	}];
}

- (void)addAnnotation:(NSNotification *)notification
{
	MKGSIAnnotation *annotation = notification.userInfo[@"data"];
	[self.mapView addAnnotation:annotation];
}

- (void)addAnnotations:(NSNotification *)notification
{
	[self.mapView addAnnotations:(NSArray *)notification.userInfo[@"data"]];
}

@end
