//
//  AddressCard.m
//  GrossmanTom3a
//
//  Created by Tom Grossman on 7/26/16.
//  Copyright © 2016 Tom Grossman. All rights reserved.
//

#import "AddressCard.h"

@implementation AddressCard {
    NSString *name;
    NSString *email;
    NSString *age;
}

- (void) setName: (NSString *) theName {
    name = [NSString stringWithString: theName];
}

- (void) setEmail: (NSString *) theEmail {
    email = [NSString stringWithString: theEmail];
}

- (void) setAge: (NSString *) theAge {
    age = [NSString stringWithString: theAge];
}

- (NSString *) name {
    return name;
}

- (NSString *) email {
    return email;
}

- (NSString *) age {
    return age;
}

-(AddressCard *) initWithName: (NSString *) theName andWithEmail: (NSString *) theEmail andWithAge: (NSString *) theAge {
    self = [super init];
    if (self) {
        name = [NSString stringWithString: theName];
        email = [NSString stringWithString: theEmail];
        age = [NSString stringWithString: theAge];
    }
    return self;
}

- (void) print {
    NSLog(@"++===================================++");
    NSLog(@"|  Name: %-31s", [name UTF8String]);
    NSLog(@"|  Email: %-31s", [email UTF8String]);
    NSLog(@"|  Age: %-31s", [age UTF8String]);
    NSLog(@"++===================================++");
}

@end
