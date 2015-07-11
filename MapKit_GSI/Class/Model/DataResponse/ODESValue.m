//
//  ODESVALUE.m
//
//  Created by 暁 松田 on 6/29/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ODESValue.h"


NSString *const kODESVALUEArea = @"@area";
NSString *const kODESVALUETime = @"@time";
NSString *const kODESVALUECat01 = @"@cat01";
NSString *const kODESVALUEUnit = @"@unit";
NSString *const kODESVALUE = @"$";
NSString *const kODESVALUETab = @"@tab";


@interface ODESValue ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ODESValue

@synthesize area = _area;
@synthesize time = _time;
@synthesize cat01 = _cat01;
@synthesize unit = _unit;
@synthesize value = _value;
@synthesize tab = _tab;


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
            self.area = [self objectOrNilForKey:kODESVALUEArea fromDictionary:dict];
            self.time = [self objectOrNilForKey:kODESVALUETime fromDictionary:dict];
            self.cat01 = [self objectOrNilForKey:kODESVALUECat01 fromDictionary:dict];
            self.unit = [self objectOrNilForKey:kODESVALUEUnit fromDictionary:dict];
            self.value = [self objectOrNilForKey:kODESVALUE fromDictionary:dict];
            self.tab = [self objectOrNilForKey:kODESVALUETab fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.area forKey:kODESVALUEArea];
    [mutableDict setValue:self.time forKey:kODESVALUETime];
    [mutableDict setValue:self.cat01 forKey:kODESVALUECat01];
    [mutableDict setValue:self.unit forKey:kODESVALUEUnit];
    [mutableDict setValue:self.value forKey:kODESVALUE];
    [mutableDict setValue:self.tab forKey:kODESVALUETab];

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

    self.area = [aDecoder decodeObjectForKey:kODESVALUEArea];
    self.time = [aDecoder decodeObjectForKey:kODESVALUETime];
    self.cat01 = [aDecoder decodeObjectForKey:kODESVALUECat01];
    self.unit = [aDecoder decodeObjectForKey:kODESVALUEUnit];
    self.value = [aDecoder decodeObjectForKey:kODESVALUE];
    self.tab = [aDecoder decodeObjectForKey:kODESVALUETab];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_area forKey:kODESVALUEArea];
    [aCoder encodeObject:_time forKey:kODESVALUETime];
    [aCoder encodeObject:_cat01 forKey:kODESVALUECat01];
    [aCoder encodeObject:_unit forKey:kODESVALUEUnit];
    [aCoder encodeObject:_value forKey:kODESVALUE];
    [aCoder encodeObject:_tab forKey:kODESVALUETab];
}

- (id)copyWithZone:(NSZone *)zone
{
    ODESValue *copy = [[ODESValue alloc] init];
    
    if (copy) {

        copy.area = [self.area copyWithZone:zone];
        copy.time = [self.time copyWithZone:zone];
        copy.cat01 = [self.cat01 copyWithZone:zone];
        copy.unit = [self.unit copyWithZone:zone];
        copy.value = [self.value copyWithZone:zone];
        copy.tab = [self.tab copyWithZone:zone];
    }
    
    return copy;
}


@end
