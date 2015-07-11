//
//  ODESPARAMETER.h
//
//  Created by 暁 松田 on 6/29/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ODESDataRequestResponseParameter : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *lANG;
@property (nonatomic, assign) double sTARTPOSITION;
@property (nonatomic, strong) NSString *dATAFORMAT;
@property (nonatomic, strong) NSString *cNTGETFLG;
@property (nonatomic, strong) NSString *mETAGETFLG;
@property (nonatomic, strong) NSString *sTATSDATAID;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
