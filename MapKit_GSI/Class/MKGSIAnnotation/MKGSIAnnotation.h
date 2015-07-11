//
//  MKGSIAnnotation.h
//  MapKit_GSI
//
//  Created by Akira Matsuda on 6/29/15.
//  Copyright (c) 2015 Akira Matsuda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MKGSIAnnotation : NSObject <MKAnnotation>

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, strong) NSString *annotationTitle;
@property (nonatomic, strong) NSString *annotationSubtitle;

- (id)initWithLocationCoordinate:(CLLocationCoordinate2D)coordinate;
- (NSString *)title;
- (NSString *)subtitle;

@end
