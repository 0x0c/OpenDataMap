//
//  ODESDATAINF.h
//
//  Created by 暁 松田 on 6/29/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ODESValue.h"
#import "ODESNote.h"

@interface ODESDataInfo : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *value;
@property (nonatomic, strong) NSArray *note;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
