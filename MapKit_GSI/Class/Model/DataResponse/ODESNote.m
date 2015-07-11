//
//  ODESNOTE.m
//
//  Created by 暁 松田 on 6/29/15
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ODESNote.h"


NSString *const kODESNOTEChar = @"@char";
NSString *const kODESNOTE = @"$";


@interface ODESNote ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ODESNote

@synthesize charProperty = _charProperty;
@synthesize myProperty1 = _myProperty1;


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
            self.charProperty = [self objectOrNilForKey:kODESNOTEChar fromDictionary:dict];
            self.myProperty1 = [self objectOrNilForKey:kODESNOTE fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.charProperty forKey:kODESNOTEChar];
    [mutableDict setValue:self.myProperty1 forKey:kODESNOTE];

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

    self.charProperty = [aDecoder decodeObjectForKey:kODESNOTEChar];
    self.myProperty1 = [aDecoder decodeObjectForKey:kODESNOTE];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_charProperty forKey:kODESNOTEChar];
    [aCoder encodeObject:_myProperty1 forKey:kODESNOTE];
}

- (id)copyWithZone:(NSZone *)zone
{
    ODESNote *copy = [[ODESNote alloc] init];
    
    if (copy) {

        copy.charProperty = [self.charProperty copyWithZone:zone];
        copy.myProperty1 = [self.myProperty1 copyWithZone:zone];
    }
    
    return copy;
}


@end
