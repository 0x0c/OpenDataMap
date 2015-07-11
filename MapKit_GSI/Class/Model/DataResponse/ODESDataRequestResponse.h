//
//  ODESDataRequestResonse.h
//
//  Created by 暁 松田 on 6/29/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ODESDataStatsData.h"

@interface ODESDataRequestResponse : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) ODESDataStatsData *statsData;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
