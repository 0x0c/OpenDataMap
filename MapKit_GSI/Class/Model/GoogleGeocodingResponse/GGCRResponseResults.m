//
//  GGCRResponseResults.m
//
//  Created by 暁 松田 on 6/29/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "GGCRResponseResults.h"
#import "GGCRResponseAddressComponents.h"
#import "GGCRResponseGeometry.h"


NSString *const kGGCRResponseResultsFormattedAddress = @"formatted_address";
NSString *const kGGCRResponseResultsAddressComponents = @"address_components";
NSString *const kGGCRResponseResultsGeometry = @"geometry";
NSString *const kGGCRResponseResultsPlaceId = @"place_id";
NSString *const kGGCRResponseResultsTypes = @"types";


@interface GGCRResponseResults ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GGCRResponseResults

@synthesize formattedAddress = _formattedAddress;
@synthesize addressComponents = _addressComponents;
@synthesize geometry = _geometry;
@synthesize placeId = _placeId;
@synthesize types = _types;


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
            self.formattedAddress = [self objectOrNilForKey:kGGCRResponseResultsFormattedAddress fromDictionary:dict];
    NSObject *receivedGGCRResponseAddressComponents = [dict objectForKey:kGGCRResponseResultsAddressComponents];
    NSMutableArray *parsedGGCRResponseAddressComponents = [NSMutableArray array];
    if ([receivedGGCRResponseAddressComponents isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedGGCRResponseAddressComponents) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedGGCRResponseAddressComponents addObject:[GGCRResponseAddressComponents modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedGGCRResponseAddressComponents isKindOfClass:[NSDictionary class]]) {
       [parsedGGCRResponseAddressComponents addObject:[GGCRResponseAddressComponents modelObjectWithDictionary:(NSDictionary *)receivedGGCRResponseAddressComponents]];
    }

    self.addressComponents = [NSArray arrayWithArray:parsedGGCRResponseAddressComponents];
            self.geometry = [GGCRResponseGeometry modelObjectWithDictionary:[dict objectForKey:kGGCRResponseResultsGeometry]];
            self.placeId = [self objectOrNilForKey:kGGCRResponseResultsPlaceId fromDictionary:dict];
            self.types = [self objectOrNilForKey:kGGCRResponseResultsTypes fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.formattedAddress forKey:kGGCRResponseResultsFormattedAddress];
    NSMutableArray *tempArrayForAddressComponents = [NSMutableArray array];
    for (NSObject *subArrayObject in self.addressComponents) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForAddressComponents addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForAddressComponents addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForAddressComponents] forKey:kGGCRResponseResultsAddressComponents];
    [mutableDict setValue:[self.geometry dictionaryRepresentation] forKey:kGGCRResponseResultsGeometry];
    [mutableDict setValue:self.placeId forKey:kGGCRResponseResultsPlaceId];
    NSMutableArray *tempArrayForTypes = [NSMutableArray array];
    for (NSObject *subArrayObject in self.types) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForTypes addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForTypes addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTypes] forKey:kGGCRResponseResultsTypes];

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

    self.formattedAddress = [aDecoder decodeObjectForKey:kGGCRResponseResultsFormattedAddress];
    self.addressComponents = [aDecoder decodeObjectForKey:kGGCRResponseResultsAddressComponents];
    self.geometry = [aDecoder decodeObjectForKey:kGGCRResponseResultsGeometry];
    self.placeId = [aDecoder decodeObjectForKey:kGGCRResponseResultsPlaceId];
    self.types = [aDecoder decodeObjectForKey:kGGCRResponseResultsTypes];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_formattedAddress forKey:kGGCRResponseResultsFormattedAddress];
    [aCoder encodeObject:_addressComponents forKey:kGGCRResponseResultsAddressComponents];
    [aCoder encodeObject:_geometry forKey:kGGCRResponseResultsGeometry];
    [aCoder encodeObject:_placeId forKey:kGGCRResponseResultsPlaceId];
    [aCoder encodeObject:_types forKey:kGGCRResponseResultsTypes];
}

- (id)copyWithZone:(NSZone *)zone
{
    GGCRResponseResults *copy = [[GGCRResponseResults alloc] init];
    
    if (copy) {

        copy.formattedAddress = [self.formattedAddress copyWithZone:zone];
        copy.addressComponents = [self.addressComponents copyWithZone:zone];
        copy.geometry = [self.geometry copyWithZone:zone];
        copy.placeId = [self.placeId copyWithZone:zone];
        copy.types = [self.types copyWithZone:zone];
    }
    
    return copy;
}


@end
