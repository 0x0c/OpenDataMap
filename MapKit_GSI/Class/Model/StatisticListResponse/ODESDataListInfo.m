//
//  ODESDATALISTINF.m
//
//  Created by 暁 松田 on 6/29/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ODESDataListInfo.h"

NSString *const kODESDATALISTINFNUMBER = @"NUMBER";
NSString *const kODESDATALISTINFTABLEINF = @"TABLE_INF";
NSString *const kODESDATALISTINFRESULTINF = @"RESULT_INF";

@interface ODESDataListInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ODESDataListInfo

@synthesize numberOfList = _numberOfList;
@synthesize tableInfo = _tableInfo;
@synthesize resultInfo = _resultInfo;

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
		self.numberOfList = [[self objectOrNilForKey:kODESDATALISTINFNUMBER fromDictionary:dict] doubleValue];
		NSObject *receivedODESTABLEINF = [dict objectForKey:kODESDATALISTINFTABLEINF];
		NSMutableArray *parsedODESTABLEINF = [NSMutableArray array];
		if ([receivedODESTABLEINF isKindOfClass:[NSArray class]]) {
			for (NSDictionary *item in(NSArray *)receivedODESTABLEINF) {
				if ([item isKindOfClass:[NSDictionary class]]) {
					[parsedODESTABLEINF addObject:[ODESTableInfo modelObjectWithDictionary:item]];
				}
			}
		}
		else if ([receivedODESTABLEINF isKindOfClass:[NSDictionary class]]) {
			[parsedODESTABLEINF addObject:[ODESTableInfo modelObjectWithDictionary:(NSDictionary *)receivedODESTABLEINF]];
		}

		self.tableInfo = [NSArray arrayWithArray:parsedODESTABLEINF];
		self.resultInfo = [ODESResultInfo modelObjectWithDictionary:[dict objectForKey:kODESDATALISTINFRESULTINF]];
	}

	return self;
}

- (NSDictionary *)dictionaryRepresentation
{
	NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
	[mutableDict setValue:[NSNumber numberWithDouble:self.numberOfList] forKey:kODESDATALISTINFNUMBER];
	NSMutableArray *tempArrayForTABLEINF = [NSMutableArray array];
	for (NSObject *subArrayObject in self.tableInfo) {
		if ([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
			// This class is a model object
			[tempArrayForTABLEINF addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
		}
		else {
			// Generic object
			[tempArrayForTABLEINF addObject:subArrayObject];
		}
	}
	[mutableDict setValue:[NSArray arrayWithArray:tempArrayForTABLEINF] forKey:kODESDATALISTINFTABLEINF];
	[mutableDict setValue:[self.resultInfo dictionaryRepresentation] forKey:kODESDATALISTINFRESULTINF];

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

	self.numberOfList = [aDecoder decodeDoubleForKey:kODESDATALISTINFNUMBER];
	self.tableInfo = [aDecoder decodeObjectForKey:kODESDATALISTINFTABLEINF];
	self.resultInfo = [aDecoder decodeObjectForKey:kODESDATALISTINFRESULTINF];
	return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

	[aCoder encodeDouble:_numberOfList forKey:kODESDATALISTINFNUMBER];
	[aCoder encodeObject:_tableInfo forKey:kODESDATALISTINFTABLEINF];
	[aCoder encodeObject:_resultInfo forKey:kODESDATALISTINFRESULTINF];
}

- (id)copyWithZone:(NSZone *)zone
{
	ODESDataListInfo *copy = [[ODESDataListInfo alloc] init];

	if (copy) {

		copy.numberOfList = self.numberOfList;
		copy.tableInfo = [self.tableInfo copyWithZone:zone];
		copy.resultInfo = [self.resultInfo copyWithZone:zone];
	}

	return copy;
}

@end
