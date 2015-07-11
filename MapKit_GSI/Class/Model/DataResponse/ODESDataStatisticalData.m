//
//  ODESSTATISTICALDATA.m
//
//  Created by 暁 松田 on 6/29/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ODESDataStatisticalData.h"

NSString *const kODESSTATISTICALDATATABLEINF = @"TABLE_INF";
NSString *const kODESSTATISTICALDATACLASSINF = @"CLASS_INF";
NSString *const kODESSTATISTICALDATADATAINF = @"DATA_INF";
NSString *const kODESSTATISTICALDATARESULTINF = @"RESULT_INF";


@interface ODESDataStatisticalData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ODESDataStatisticalData

@synthesize tableInfo = _tableInfo;
@synthesize classInfo = _classInfo;
@synthesize dataInfo = _dataInfo;
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
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.tableInfo = [ODESTableInfo modelObjectWithDictionary:[dict objectForKey:kODESSTATISTICALDATATABLEINF]];
            self.classInfo = [ODESDataClassInfo modelObjectWithDictionary:[dict objectForKey:kODESSTATISTICALDATACLASSINF]];
            self.dataInfo = [ODESDataInfo modelObjectWithDictionary:[dict objectForKey:kODESSTATISTICALDATADATAINF]];
            self.resultInfo = [ODESResultInfo modelObjectWithDictionary:[dict objectForKey:kODESSTATISTICALDATARESULTINF]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.tableInfo dictionaryRepresentation] forKey:kODESSTATISTICALDATATABLEINF];
    [mutableDict setValue:[self.classInfo dictionaryRepresentation] forKey:kODESSTATISTICALDATACLASSINF];
    [mutableDict setValue:[self.dataInfo dictionaryRepresentation] forKey:kODESSTATISTICALDATADATAINF];
    [mutableDict setValue:[self.resultInfo dictionaryRepresentation] forKey:kODESSTATISTICALDATARESULTINF];

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

    self.tableInfo = [aDecoder decodeObjectForKey:kODESSTATISTICALDATATABLEINF];
    self.classInfo = [aDecoder decodeObjectForKey:kODESSTATISTICALDATACLASSINF];
    self.dataInfo = [aDecoder decodeObjectForKey:kODESSTATISTICALDATADATAINF];
    self.resultInfo = [aDecoder decodeObjectForKey:kODESSTATISTICALDATARESULTINF];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tableInfo forKey:kODESSTATISTICALDATATABLEINF];
    [aCoder encodeObject:_classInfo forKey:kODESSTATISTICALDATACLASSINF];
    [aCoder encodeObject:_dataInfo forKey:kODESSTATISTICALDATADATAINF];
    [aCoder encodeObject:_resultInfo forKey:kODESSTATISTICALDATARESULTINF];
}

- (id)copyWithZone:(NSZone *)zone
{
    ODESDataStatisticalData *copy = [[ODESDataStatisticalData alloc] init];
    
    if (copy) {

        copy.tableInfo = [self.tableInfo copyWithZone:zone];
        copy.classInfo = [self.classInfo copyWithZone:zone];
        copy.dataInfo = [self.dataInfo copyWithZone:zone];
        copy.resultInfo = [self.resultInfo copyWithZone:zone];
    }
    
    return copy;
}


#pragma mark - 

- (ODESDataClassObject *)classObjectForClassObjectIdentifier:(NSString *)classObjectIdentifier
{
	ODESDataClassObject *result = nil;
	for (ODESDataClassObject *classObject in self.classInfo.classObjects) {
		if ([classObject.classObjectIdentifier isEqualToString:classObjectIdentifier]) {
			result = classObject;
			break;
		}
	}
	
	return result;
}

- (ODESValue *)valueForCategory:(NSString *)category
{
	ODESValue *result = nil;
	for (ODESValue *value in self.dataInfo.value) {
		if ([value.cat01 isEqualToString:category]) {
			result = value;
		}
	}
	
	return result;
}

@end
