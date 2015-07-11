//
//  GGCRResponseSouthwest.m
//
//  Created by 暁 松田 on 6/29/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "GGCRResponseSouthwest.h"


NSString *const kGGCRResponseSouthwestLat = @"lat";
NSString *const kGGCRResponseSouthwestLng = @"lng";


@interface GGCRResponseSouthwest ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation GGCRResponseSouthwest

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
            self.lat = [[self objectOrNilForKey:kGGCRResponseSouthwestLat fromDictionary:dict] doubleValue];
            self.lng = [[self objectOrNilForKey:kGGCRResponseSouthwestLng fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lat] forKey:kGGCRResponseSouthwestLat];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lng] forKey:kGGCRResponseSouthwestLng];

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

    self.lat = [aDecoder decodeDoubleForKey:kGGCRResponseSouthwestLat];
    self.lng = [aDecoder decodeDoubleForKey:kGGCRResponseSouthwestLng];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_lat forKey:kGGCRResponseSouthwestLat];
    [aCoder encodeDouble:_lng forKey:kGGCRResponseSouthwestLng];
}

- (id)copyWithZone:(NSZone *)zone
{
    GGCRResponseSouthwest *copy = [[GGCRResponseSouthwest alloc] init];
    
    if (copy) {

        copy.lat = self.lat;
        copy.lng = self.lng;
    }
    
    return copy;
}


@end
