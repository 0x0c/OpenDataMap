//
//  GGCRResponseLocation.m
//
//  Created by 暁 松田 on 6/29/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "GGCRResponseLocation.h"


NSString *const kGGCRResponseLocationLat = @"lat";
NSString *const kGGCRResponseLocationLng = @"lng";


@interface GGCRResponseLocation ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GGCRResponseLocation

@synthesize lat = _lat;
@synthesize lng = _lng;


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
            self.lat = [[self objectOrNilForKey:kGGCRResponseLocationLat fromDictionary:dict] doubleValue];
            self.lng = [[self objectOrNilForKey:kGGCRResponseLocationLng fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lat] forKey:kGGCRResponseLocationLat];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lng] forKey:kGGCRResponseLocationLng];

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

    self.lat = [aDecoder decodeDoubleForKey:kGGCRResponseLocationLat];
    self.lng = [aDecoder decodeDoubleForKey:kGGCRResponseLocationLng];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_lat forKey:kGGCRResponseLocationLat];
    [aCoder encodeDouble:_lng forKey:kGGCRResponseLocationLng];
}

- (id)copyWithZone:(NSZone *)zone
{
    GGCRResponseLocation *copy = [[GGCRResponseLocation alloc] init];
    
    if (copy) {

        copy.lat = self.lat;
        copy.lng = self.lng;
    }
    
    return copy;
}


@end
