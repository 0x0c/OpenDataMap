//
//  ODESCLASSClass.m
//
//  Created by 暁 松田 on 6/29/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ODESDataClassClass.h"

NSString *const kODESDataClassClassLevel = @"@level";
NSString *const kODESDataClassClassUnit = @"@unit";
NSString *const kODESDataClassClassCode = @"@code";
NSString *const kODESDataClassClassName = @"@name";


@interface ODESDataClassClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ODESDataClassClass

@synthesize level = _level;
@synthesize unit = _unit;
@synthesize code = _code;
@synthesize name = _name;


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
            self.level = [self objectOrNilForKey:kODESDataClassClassLevel fromDictionary:dict];
            self.unit = [self objectOrNilForKey:kODESDataClassClassUnit fromDictionary:dict];
            self.code = [self objectOrNilForKey:kODESDataClassClassCode fromDictionary:dict];
            self.name = [self objectOrNilForKey:kODESDataClassClassName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.level forKey:kODESDataClassClassLevel];
    [mutableDict setValue:self.unit forKey:kODESDataClassClassUnit];
    [mutableDict setValue:self.code forKey:kODESDataClassClassCode];
    [mutableDict setValue:self.name forKey:kODESDataClassClassName];

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

    self.level = [aDecoder decodeObjectForKey:kODESDataClassClassLevel];
    self.unit = [aDecoder decodeObjectForKey:kODESDataClassClassUnit];
    self.code = [aDecoder decodeObjectForKey:kODESDataClassClassCode];
    self.name = [aDecoder decodeObjectForKey:kODESDataClassClassName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_level forKey:kODESDataClassClassLevel];
    [aCoder encodeObject:_unit forKey:kODESDataClassClassUnit];
    [aCoder encodeObject:_code forKey:kODESDataClassClassCode];
    [aCoder encodeObject:_name forKey:kODESDataClassClassName];
}

- (id)copyWithZone:(NSZone *)zone
{
    ODESDataClassClass *copy = [[ODESDataClassClass alloc] init];
    
    if (copy) {

        copy.level = [self.level copyWithZone:zone];
        copy.unit = [self.unit copyWithZone:zone];
        copy.code = [self.code copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
