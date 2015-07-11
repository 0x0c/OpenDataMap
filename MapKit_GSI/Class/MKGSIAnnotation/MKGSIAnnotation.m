//
//  MKGSIAnnotation.m
//  MapKit_GSI
//
//  Created by Akira Matsuda on 6/29/15.
//  Copyright (c) 2015 Akira Matsuda. All rights reserved.
//

#import "MKGSIAnnotation.h"

@implementation MKGSIAnnotation

- (id)initWithLocationCoordinate:(CLLocationCoordinate2D)coordinate
{
	self = [super init];
	if (self) {
		_coordinate = coordinate;
	}
	
	return self;
}

- (NSString *)title
{
	return self.annotationTitle;
}

- (NSString *)subtitle
{
	return self.annotationSubtitle;
}

@end
