//
//  GGCRResponseGeometry.h
//
//  Created by 暁 松田 on 6/29/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GGCRResponseViewport.h"
#import "GGCRResponseBounds.h"
#import "GGCRResponseLocation.h"

@interface GGCRResponseGeometry : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *locationType;
@property (nonatomic, strong) GGCRResponseViewport *viewport;
@property (nonatomic, strong) GGCRResponseBounds *bounds;
@property (nonatomic, strong) GGCRResponseLocation *location;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
