//
//  ODESVALUE.h
//
//  Created by 暁 松田 on 6/29/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ODESValue : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *area;
@property (nonatomic, strong) NSString *time;
@property (nonatomic, strong) NSString *cat01;
@property (nonatomic, strong) NSString *unit;
@property (nonatomic, strong) NSString *value;
@property (nonatomic, strong) NSString *tab;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
