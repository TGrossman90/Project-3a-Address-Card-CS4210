//
//  AddressCard.h
//  GrossmanTom3a
//
//  Created by Tom Grossman on 7/26/16.
//  Copyright © 2016 Tom Grossman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddressCard : NSObject

- (void) setName: (NSString *) theName;
- (void) setEmail: (NSString *) theEmail;
- (void) setAge: (NSString *) theAge;
- (NSString *) name;
- (NSString *) email;
- (NSString *) age;
- (void) print;

-(AddressCard *) initWithName: (NSString *) theName andWithEmail: (NSString *) theEmail andWithAge: (NSString *) theAge;

@end
