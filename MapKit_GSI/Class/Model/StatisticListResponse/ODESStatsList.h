//
//  ODESGETSTATSLIST.h
//
//  Created by 暁 松田 on 6/29/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ODESResult.h"
#import "ODESStatisticListRequestParameter.h"
#import "ODESDataListInfo.h"

@interface ODESStatsList : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) ODESResult *result;
@property (nonatomic, strong) ODESStatisticListRequestParameter *parameter;
@property (nonatomic, strong) ODESDataListInfo *dataListInfo;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
