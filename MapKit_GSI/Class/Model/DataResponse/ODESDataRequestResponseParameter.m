//
//  ODESPARAMETER.m
//
//  Created by 暁 松田 on 6/29/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ODESDataRequestResponseParameter.h"


NSString *const kODESDATAREQUESTRESPONSEPARAMETERLANG = @"LANG";
NSString *const kODESDATAREQUESTRESPONSEPARAMETERSTARTPOSITION = @"START_POSITION";
NSString *const kODESDATAREQUESTRESPONSEPARAMETERDATAFORMAT = @"DATA_FORMAT";
NSString *const kODESDATAREQUESTRESPONSEPARAMETERCNTGETFLG = @"CNT_GET_FLG";
NSString *const kODESDATAREQUESTRESPONSEPARAMETERMETAGETFLG = @"METAGET_FLG";
NSString *const kODESDATAREQUESTRESPONSEPARAMETERSTATSDATAID = @"STATS_DATA_ID";


@interface ODESDataRequestResponseParameter ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ODESDataRequestResponseParameter

@synthesize lANG = _lANG;
@synthesize sTARTPOSITION = _sTARTPOSITION;
@synthesize dATAFORMAT = _dATAFORMAT;
@synthesize cNTGETFLG = _cNTGETFLG;
@synthesize mETAGETFLG = _mETAGETFLG;
@synthesize sTATSDATAID = _sTATSDATAID;


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
            self.lANG = [self objectOrNilForKey:kODESDATAREQUESTRESPONSEPARAMETERLANG fromDictionary:dict];
            self.sTARTPOSITION = [[self objectOrNilForKey:kODESDATAREQUESTRESPONSEPARAMETERSTARTPOSITION fromDictionary:dict] doubleValue];
            self.dATAFORMAT = [self objectOrNilForKey:kODESDATAREQUESTRESPONSEPARAMETERDATAFORMAT fromDictionary:dict];
            self.cNTGETFLG = [self objectOrNilForKey:kODESDATAREQUESTRESPONSEPARAMETERCNTGETFLG fromDictionary:dict];
            self.mETAGETFLG = [self objectOrNilForKey:kODESDATAREQUESTRESPONSEPARAMETERMETAGETFLG fromDictionary:dict];
            self.sTATSDATAID = [self objectOrNilForKey:kODESDATAREQUESTRESPONSEPARAMETERSTATSDATAID fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.lANG forKey:kODESDATAREQUESTRESPONSEPARAMETERLANG];
    [mutableDict setValue:[NSNumber numberWithDouble:self.sTARTPOSITION] forKey:kODESDATAREQUESTRESPONSEPARAMETERSTARTPOSITION];
    [mutableDict setValue:self.dATAFORMAT forKey:kODESDATAREQUESTRESPONSEPARAMETERDATAFORMAT];
    [mutableDict setValue:self.cNTGETFLG forKey:kODESDATAREQUESTRESPONSEPARAMETERCNTGETFLG];
    [mutableDict setValue:self.mETAGETFLG forKey:kODESDATAREQUESTRESPONSEPARAMETERMETAGETFLG];
    [mutableDict setValue:self.sTATSDATAID forKey:kODESDATAREQUESTRESPONSEPARAMETERSTATSDATAID];

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

    self.lANG = [aDecoder decodeObjectForKey:kODESDATAREQUESTRESPONSEPARAMETERLANG];
    self.sTARTPOSITION = [aDecoder decodeDoubleForKey:kODESDATAREQUESTRESPONSEPARAMETERSTARTPOSITION];
    self.dATAFORMAT = [aDecoder decodeObjectForKey:kODESDATAREQUESTRESPONSEPARAMETERDATAFORMAT];
    self.cNTGETFLG = [aDecoder decodeObjectForKey:kODESDATAREQUESTRESPONSEPARAMETERCNTGETFLG];
    self.mETAGETFLG = [aDecoder decodeObjectForKey:kODESDATAREQUESTRESPONSEPARAMETERMETAGETFLG];
    self.sTATSDATAID = [aDecoder decodeObjectForKey:kODESDATAREQUESTRESPONSEPARAMETERSTATSDATAID];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_lANG forKey:kODESDATAREQUESTRESPONSEPARAMETERLANG];
    [aCoder encodeDouble:_sTARTPOSITION forKey:kODESDATAREQUESTRESPONSEPARAMETERSTARTPOSITION];
    [aCoder encodeObject:_dATAFORMAT forKey:kODESDATAREQUESTRESPONSEPARAMETERDATAFORMAT];
    [aCoder encodeObject:_cNTGETFLG forKey:kODESDATAREQUESTRESPONSEPARAMETERCNTGETFLG];
    [aCoder encodeObject:_mETAGETFLG forKey:kODESDATAREQUESTRESPONSEPARAMETERMETAGETFLG];
    [aCoder encodeObject:_sTATSDATAID forKey:kODESDATAREQUESTRESPONSEPARAMETERSTATSDATAID];
}

- (id)copyWithZone:(NSZone *)zone
{
    ODESDataRequestResponseParameter *copy = [[ODESDataRequestResponseParameter alloc] init];
    
    if (copy) {

        copy.lANG = [self.lANG copyWithZone:zone];
        copy.sTARTPOSITION = self.sTARTPOSITION;
        copy.dATAFORMAT = [self.dATAFORMAT copyWithZone:zone];
        copy.cNTGETFLG = [self.cNTGETFLG copyWithZone:zone];
        copy.mETAGETFLG = [self.mETAGETFLG copyWithZone:zone];
        copy.sTATSDATAID = [self.sTATSDATAID copyWithZone:zone];
    }
    
    return copy;
}


@end
