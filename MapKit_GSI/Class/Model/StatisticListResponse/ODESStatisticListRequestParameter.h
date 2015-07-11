//
//  ODESPARAMETER.h
//
//  Created by 暁 松田 on 6/29/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ODESStatisticListRequestParameter : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *language;
@property (nonatomic, assign) double searchKind;
@property (nonatomic, strong) NSString *dataFormat;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
