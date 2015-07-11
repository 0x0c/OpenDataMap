//
//  ODESTABLEINF.m
//
//  Created by 暁 松田 on 6/29/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ODESTableInfo.h"
#import "ODESTitle.h"
#import "ODESSubCategory.h"
#import "ODESGovOrgData.h"
#import "ODESMainCategory.h"
#import "ODESStatName.h"

NSString *const kODESTABLEINFSURVEYDATE = @"SURVEY_DATE";
NSString *const kODESTABLEINFTITLE = @"TITLE";
NSString *const kODESTABLEINFOVERALLTOTALNUMBER = @"OVERALL_TOTAL_NUMBER";
NSString *const kODESTABLEINFSTATISTICSNAME = @"STATISTICS_NAME";
NSString *const kODESTABLEINFId = @"@id";
NSString *const kODESTABLEINFSUBCATEGORY = @"SUB_CATEGORY";
NSString *const kODESTABLEINFGOVORG = @"GOV_ORG";
NSString *const kODESTABLEINFMAINCATEGORY = @"MAIN_CATEGORY";
NSString *const kODESTABLEINFOPENDATE = @"OPEN_DATE";
NSString *const kODESTABLEINFSTATNAME = @"STAT_NAME";
NSString *const kODESTABLEINFUPDATEDDATE = @"UPDATED_DATE";
NSString *const kODESTABLEINFSMALLAREA = @"SMALL_AREA";
NSString *const kODESTABLEINFCYCLE = @"CYCLE";

@interface ODESTableInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ODESTableInfo

@synthesize surveyDate = _surveyDate;
@synthesize title = _title;
@synthesize overAllTotalNumber = _overAllTotalNumber;
@synthesize statisticsName = _statisticsName;
@synthesize tableInfoIdentifier = _tableInfoIdentifier;
@synthesize subCategory = _subCategory;
@synthesize govOrg = _govOrg;
@synthesize mainCategory = _mainCategory;
@synthesize openDate = _openDate;
@synthesize statName = _statName;
@synthesize updateDate = _updateDate;
@synthesize smallArea = _smallArea;
@synthesize cycle = _cycle;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
	return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
	self = [super init];

	// This check serves to make sure that a non-NSDictionary object
	// passed into the model class doesn't break the parsing.
	if (self && [dict isKindOfClass:[NSDictionary class]]) {
		self.surveyDate = [[self objectOrNilForKey:kODESTABLEINFSURVEYDATE fromDictionary:dict] doubleValue];
		self.title = [ODESTitle modelObjectWithDictionary:[dict objectForKey:kODESTABLEINFTITLE]];
		self.overAllTotalNumber = [[self objectOrNilForKey:kODESTABLEINFOVERALLTOTALNUMBER fromDictionary:dict] doubleValue];
		self.statisticsName = [self objectOrNilForKey:kODESTABLEINFSTATISTICSNAME fromDictionary:dict];
		self.tableInfoIdentifier = [self objectOrNilForKey:kODESTABLEINFId fromDictionary:dict];
		self.subCategory = [ODESSubCategory modelObjectWithDictionary:[dict objectForKey:kODESTABLEINFSUBCATEGORY]];
		self.govOrg = [ODESGovOrgData modelObjectWithDictionary:[dict objectForKey:kODESTABLEINFGOVORG]];
		self.mainCategory = [ODESMainCategory modelObjectWithDictionary:[dict objectForKey:kODESTABLEINFMAINCATEGORY]];
		self.openDate = [self objectOrNilForKey:kODESTABLEINFOPENDATE fromDictionary:dict];
		self.statName = [ODESStatName modelObjectWithDictionary:[dict objectForKey:kODESTABLEINFSTATNAME]];
		self.updateDate = [self objectOrNilForKey:kODESTABLEINFUPDATEDDATE fromDictionary:dict];
		self.smallArea = [[self objectOrNilForKey:kODESTABLEINFSMALLAREA fromDictionary:dict] doubleValue];
		self.cycle = [self objectOrNilForKey:kODESTABLEINFCYCLE fromDictionary:dict];
	}

	return self;
}

- (NSDictionary *)dictionaryRepresentation
{
	NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
	[mutableDict setValue:[NSNumber numberWithDouble:self.surveyDate] forKey:kODESTABLEINFSURVEYDATE];
	[mutableDict setValue:[self.title dictionaryRepresentation] forKey:kODESTABLEINFTITLE];
	[mutableDict setValue:[NSNumber numberWithDouble:self.overAllTotalNumber] forKey:kODESTABLEINFOVERALLTOTALNUMBER];
	[mutableDict setValue:self.statisticsName forKey:kODESTABLEINFSTATISTICSNAME];
	[mutableDict setValue:self.tableInfoIdentifier forKey:kODESTABLEINFId];
	[mutableDict setValue:[self.subCategory dictionaryRepresentation] forKey:kODESTABLEINFSUBCATEGORY];
	[mutableDict setValue:[self.govOrg dictionaryRepresentation] forKey:kODESTABLEINFGOVORG];
	[mutableDict setValue:[self.mainCategory dictionaryRepresentation] forKey:kODESTABLEINFMAINCATEGORY];
	[mutableDict setValue:self.openDate forKey:kODESTABLEINFOPENDATE];
	[mutableDict setValue:[self.statName dictionaryRepresentation] forKey:kODESTABLEINFSTATNAME];
	[mutableDict setValue:self.updateDate forKey:kODESTABLEINFUPDATEDDATE];
	[mutableDict setValue:[NSNumber numberWithDouble:self.smallArea] forKey:kODESTABLEINFSMALLAREA];
	[mutableDict setValue:self.cycle forKey:kODESTABLEINFCYCLE];

	return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description
{
	return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
	id object = [dict objectForKey:aKey];
	return [object isEqual:[NSNull null]] ? nil : object;
}

#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];

	self.surveyDate = [aDecoder decodeDoubleForKey:kODESTABLEINFSURVEYDATE];
	self.title = [aDecoder decodeObjectForKey:kODESTABLEINFTITLE];
	self.overAllTotalNumber = [aDecoder decodeDoubleForKey:kODESTABLEINFOVERALLTOTALNUMBER];
	self.statisticsName = [aDecoder decodeObjectForKey:kODESTABLEINFSTATISTICSNAME];
	self.tableInfoIdentifier = [aDecoder decodeObjectForKey:kODESTABLEINFId];
	self.subCategory = [aDecoder decodeObjectForKey:kODESTABLEINFSUBCATEGORY];
	self.govOrg = [aDecoder decodeObjectForKey:kODESTABLEINFGOVORG];
	self.mainCategory = [aDecoder decodeObjectForKey:kODESTABLEINFMAINCATEGORY];
	self.openDate = [aDecoder decodeObjectForKey:kODESTABLEINFOPENDATE];
	self.statName = [aDecoder decodeObjectForKey:kODESTABLEINFSTATNAME];
	self.updateDate = [aDecoder decodeObjectForKey:kODESTABLEINFUPDATEDDATE];
	self.smallArea = [aDecoder decodeDoubleForKey:kODESTABLEINFSMALLAREA];
	self.cycle = [aDecoder decodeObjectForKey:kODESTABLEINFCYCLE];
	return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

	[aCoder encodeDouble:_surveyDate forKey:kODESTABLEINFSURVEYDATE];
	[aCoder encodeObject:_title forKey:kODESTABLEINFTITLE];
	[aCoder encodeDouble:_overAllTotalNumber forKey:kODESTABLEINFOVERALLTOTALNUMBER];
	[aCoder encodeObject:_statisticsName forKey:kODESTABLEINFSTATISTICSNAME];
	[aCoder encodeObject:_tableInfoIdentifier forKey:kODESTABLEINFId];
	[aCoder encodeObject:_subCategory forKey:kODESTABLEINFSUBCATEGORY];
	[aCoder encodeObject:_govOrg forKey:kODESTABLEINFGOVORG];
	[aCoder encodeObject:_mainCategory forKey:kODESTABLEINFMAINCATEGORY];
	[aCoder encodeObject:_openDate forKey:kODESTABLEINFOPENDATE];
	[aCoder encodeObject:_statName forKey:kODESTABLEINFSTATNAME];
	[aCoder encodeObject:_updateDate forKey:kODESTABLEINFUPDATEDDATE];
	[aCoder encodeDouble:_smallArea forKey:kODESTABLEINFSMALLAREA];
	[aCoder encodeObject:_cycle forKey:kODESTABLEINFCYCLE];
}

- (id)copyWithZone:(NSZone *)zone
{
	ODESTableInfo *copy = [[ODESTableInfo alloc] init];

	if (copy) {

		copy.surveyDate = self.surveyDate;
		copy.title = [self.title copyWithZone:zone];
		copy.overAllTotalNumber = self.overAllTotalNumber;
		copy.statisticsName = [self.statisticsName copyWithZone:zone];
		copy.tableInfoIdentifier = [self.tableInfoIdentifier copyWithZone:zone];
		copy.subCategory = [self.subCategory copyWithZone:zone];
		copy.govOrg = [self.govOrg copyWithZone:zone];
		copy.mainCategory = [self.mainCategory copyWithZone:zone];
		copy.openDate = [self.openDate copyWithZone:zone];
		copy.statName = [self.statName copyWithZone:zone];
		copy.updateDate = [self.updateDate copyWithZone:zone];
		copy.smallArea = self.smallArea;
		copy.cycle = [self.cycle copyWithZone:zone];
	}

	return copy;
}

@end
