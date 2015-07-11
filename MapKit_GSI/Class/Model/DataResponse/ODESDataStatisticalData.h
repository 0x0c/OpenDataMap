//
//  ODESSTATISTICALDATA.h
//
//  Created by 暁 松田 on 6/29/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ODESTableInfo.h"
#import "ODESDataClassInfo.h"
#import "ODESDataInfo.h"
#import "ODESResultInfo.h"

@interface ODESDataStatisticalData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) ODESTableInfo *tableInfo;
@property (nonatomic, strong) ODESDataClassInfo *classInfo;
@property (nonatomic, strong) ODESDataInfo *dataInfo;
@property (nonatomic, strong) ODESResultInfo *resultInfo;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

- (ODESDataClassObject *)classObjectForClassObjectIdentifier:(NSString *)classObjectIdentifier;
- (ODESValue *)valueForCategory:(NSString *)category;

@end
