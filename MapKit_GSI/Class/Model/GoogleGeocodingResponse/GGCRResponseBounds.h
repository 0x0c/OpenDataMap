//
//  GGCRResponseBounds.h
//
//  Created by 暁 松田 on 6/29/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GGCRResponseNortheast.h"
#import "GGCRResponseSouthwest.h"

@interface GGCRResponseBounds : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) GGCRResponseNortheast *northeast;
@property (nonatomic, strong) GGCRResponseSouthwest *southwest;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
