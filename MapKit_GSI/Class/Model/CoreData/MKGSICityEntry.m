//
//  MKGSICityEntry.m
//  
//
//  Created by Akira Matsuda on 6/30/15.
//
//

#import "MKGSICityEntry.h"


@implementation MKGSICityEntry

@dynamic a2101;
@dynamic a210101;
@dynamic a210102;
@dynamic a2201;
@dynamic a2301;
@dynamic a4101;
@dynamic a4200;
@dynamic a5101;
@dynamic a5102;
@dynamic a7103;
@dynamic a9101;
@dynamic a9201;
@dynamic b1102;
@dynamic b1103;
@dynamic b1104;
@dynamic c120110;
@dynamic c120120;
@dynamic c120130;
@dynamic c3107;
@dynamic d1202;
@dynamic e1101;
@dynamic e1501;
@dynamic e2101;
@dynamic e2401;
@dynamic e2501;
@dynamic e3101;
@dynamic e3401;
@dynamic e3501;
@dynamic e4101;
@dynamic e4501;
@dynamic h7207;
@dynamic h7208;
@dynamic h7209;
@dynamic h720901;
@dynamic h720902;
@dynamic h720903;
@dynamic h720904;
@dynamic h7210;
@dynamic h721001;
@dynamic h721002;
@dynamic h7501;
@dynamic h7701;
@dynamic h770101;
@dynamic j250502;
@dynamic sb01101;
@dynamic sb01301;
@dynamic sd02206;
@dynamic se0110201;
@dynamic se0110202;
@dynamic se0110203;
@dynamic lat;
@dynamic lng;
@dynamic b1101;
@dynamic name;

@synthesize coordinate, annotationSubtitle;

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
	
}

- (id)valueForUndefinedKey:(NSString *)key
{
	return nil;
}

- (CLLocationCoordinate2D)coordinate
{
	CLLocationCoordinate2D center = CLLocationCoordinate2DMake([self.lat floatValue], [self.lng floatValue]);
	return center;
}

- (NSString *)title
{
	return self.name;
}

- (NSString *)subtitle
{
	return self.annotationSubtitle;
}

@end
