//
//  GGCRResponseAddressComponents.m
//
//  Created by 暁 松田 on 6/29/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "GGCRResponseAddressComponents.h"


NSString *const kGGCRResponseAddressComponentsShortName = @"short_name";
NSString *const kGGCRResponseAddressComponentsLongName = @"long_name";
NSString *const kGGCRResponseAddressComponentsTypes = @"types";


@interface GGCRResponseAddressComponents ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GGCRResponseAddressComponents

@synthesize shortName = _shortName;
@synthesize longName = _longName;
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
            self.shortName = [self objectOrNilForKey:kGGCRResponseAddressComponentsShortName fromDictionary:dict];
            self.longName = [self objectOrNilForKey:kGGCRResponseAddressComponentsLongName fromDictionary:dict];
            self.types = [self objectOrNilForKey:kGGCRResponseAddressComponentsTypes fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.shortName forKey:kGGCRResponseAddressComponentsShortName];
    [mutableDict setValue:self.longName forKey:kGGCRResponseAddressComponentsLongName];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTypes] forKey:kGGCRResponseAddressComponentsTypes];

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

    self.shortName = [aDecoder decodeObjectForKey:kGGCRResponseAddressComponentsShortName];
    self.longName = [aDecoder decodeObjectForKey:kGGCRResponseAddressComponentsLongName];
    self.types = [aDecoder decodeObjectForKey:kGGCRResponseAddressComponentsTypes];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_shortName forKey:kGGCRResponseAddressComponentsShortName];
    [aCoder encodeObject:_longName forKey:kGGCRResponseAddressComponentsLongName];
    [aCoder encodeObject:_types forKey:kGGCRResponseAddressComponentsTypes];
}

- (id)copyWithZone:(NSZone *)zone
{
    GGCRResponseAddressComponents *copy = [[GGCRResponseAddressComponents alloc] init];
    
    if (copy) {

        copy.shortName = [self.shortName copyWithZone:zone];
        copy.longName = [self.longName copyWithZone:zone];
        copy.types = [self.types copyWithZone:zone];
    }
    
    return copy;
}


@end
