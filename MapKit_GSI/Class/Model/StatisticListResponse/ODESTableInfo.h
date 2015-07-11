//
//  ODESTABLEINF.h
//
//  Created by 暁 松田 on 6/29/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ODESTitle.h"
#import "ODESSubCategory.h"
#import "ODESGovOrgData.h"
#import "ODESMainCategory.h"
#import "ODESStatName.h"

@interface ODESTableInfo : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double surveyDate;
@property (nonatomic, strong) ODESTitle *title;
@property (nonatomic, assign) double overAllTotalNumber;
@property (nonatomic, strong) NSString *statisticsName;
@property (nonatomic, strong) NSString *tableInfoIdentifier;
@property (nonatomic, strong) ODESSubCategory *subCategory;
@property (nonatomic, strong) ODESGovOrgData *govOrg;
@property (nonatomic, strong) ODESMainCategory *mainCategory;
@property (nonatomic, strong) NSString *openDate;
@property (nonatomic, strong) ODESStatName *statName;
@property (nonatomic, strong) NSString *updateDate;
@property (nonatomic, assign) double smallArea;
@property (nonatomic, strong) NSString *cycle;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
