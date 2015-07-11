//
//  ODESRESULTINF.h
//
//  Created by 暁 松田 on 6/29/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ODESResultInfo : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double totalNumber;
@property (nonatomic, assign) double fromNumber;
@property (nonatomic, assign) double toNumber;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
