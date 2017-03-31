//
//  ViewController.m
//  GrossmanTom3a
//
//  Created by Tom Grossman on 7/26/16.
//  Copyright © 2016 Tom Grossman. All rights reserved.
//

#import "ViewController.h"
#import "AddressCard.h"

@interface ViewController ()

@property NSMutableDictionary *addressBook;
@property NSMutableArray *addressBookKeys;
@property AddressCard *displayCard;

@end

@implementation ViewController

- (void) checkForButtonStatus {
    if([_addressBook count] > 0) {
        [_startButton setEnabled: YES];
        [_printButton setEnabled: YES];
        if([_addressBook count] > 1)
            [_nextButton setEnabled: YES];
    }
}

- (bool) textFieldShouldReturn: (UITextField *) textField {
    [textField resignFirstResponder];
    [_addButton sendActionsForControlEvents: UIControlEventTouchUpInside];
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _addressBook = [[NSMutableDictionary alloc] init];
    _addressBookKeys = [[NSMutableArray alloc] init];
    [_addButton setEnabled: NO];
    [_startButton setEnabled: NO];
    [_nextButton setEnabled: NO];
    [_printButton setEnabled: NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addButton:(id)sender {
    _displayLabel.text = @"";
    
    if([_addressBook count] == 0) {
        if([_emailField.text isEqual: @""]) {
            _displayLabel.text = @"You must enter an email address!";
            [_addButton setEnabled: NO];
            return;
        }
        
        AddressCard *newCard = [[AddressCard alloc] initWithName:_nameField.text andWithEmail: _emailField.text andWithAge: _ageField.text];
        [_addressBook setObject: newCard forKey: _emailField.text];
        [_addressBookKeys addObject: _emailField.text];
        _displayCard = newCard;
        _displayLabel.text = @"Address Card Created";
        
    } else if([_addressBook count] > 0) {
        if([_emailField.text isEqual: @""]) {
            _displayLabel.text = @"You must enter an email address!";
            [_addButton setEnabled: NO];
            return;
        }
        
        if([_addressBook objectForKey: _emailField.text]) {
            AddressCard *editCard = [_addressBook objectForKey:_emailField.text];
            [editCard setName: _nameField.text];
            [editCard setAge: _ageField.text];
            [_addressBook setObject: editCard forKey:_emailField.text];
            [_addressBookKeys addObject: _emailField.text];
            _displayLabel.text = @"Address Card Modified";
            
        } else if(!([_addressBook objectForKey: _emailField.text])) {
            if([_emailField.text isEqual: @""]) {
                _displayLabel.text = @"You must enter an email address!";
                [_addButton setEnabled: NO];
                return;
            }
            
            AddressCard *newCard = [[AddressCard alloc] initWithName:_nameField.text andWithEmail: _emailField.text andWithAge: _ageField.text];
            [_addressBook setObject: newCard forKey: _emailField.text];
            [_addressBookKeys addObject: _emailField.text];
            _displayLabel.text = @"Address Card Created";
        }
    }
    
    _nameField.text = [_displayCard name];
    _emailField.text = [_displayCard email];
    _ageField.text = [_displayCard age];
    [_addButton setEnabled: NO];
    self.checkForButtonStatus;
}

- (IBAction)startButton:(id)sender {
    AddressCard *firstCard = [_addressBook objectForKey: [_addressBookKeys objectAtIndex: 0]];
    _nameField.text = [firstCard name];
    _emailField.text = [firstCard email];
    _ageField.text = [firstCard age];
    _displayCard = firstCard;
    
    _displayLabel.text = @"";
}

- (IBAction)nextButton:(id)sender {
    int index = (int)[_addressBookKeys indexOfObject: [_displayCard email]];
    index++;
    
    if([_addressBookKeys count] > index) {
        AddressCard *nextCard = [_addressBook objectForKey: [_addressBookKeys objectAtIndex: index]];
        _nameField.text = [nextCard name];
        _emailField.text = [nextCard email];
        _ageField.text = [nextCard age];
        _displayCard = nextCard;
    } else {
        AddressCard *firstCard = [_addressBook objectForKey: [_addressBookKeys objectAtIndex: 0]];
        _nameField.text = [firstCard name];
        _emailField.text = [firstCard email];
        _ageField.text = [firstCard age];
        _displayCard = firstCard;
    }
    
    _displayLabel.text = @"";
}

- (IBAction)printButton:(id)sender {
    AddressCard *cardToPrint;
    for(int x = 0; x < [_addressBookKeys count]; x++) {
        cardToPrint = [_addressBook objectForKey: [_addressBookKeys objectAtIndex: x]];
        [cardToPrint print];
    }
}

- (IBAction)nameFieldModify:(id)sender {
    [_addButton setEnabled: YES];
    self.checkForButtonStatus;
}

- (IBAction)ageFieldModify:(id)sender {
    [_addButton setEnabled: YES];
    self.checkForButtonStatus;
}

- (IBAction)emailFieldModify:(id)sender {
    [_addButton setEnabled: YES];
    self.checkForButtonStatus;
}

- (IBAction)clearButton:(id)sender {
    _displayLabel.text = @"";
    _nameField.text = @"";
    _emailField.text = @"";
    _ageField.text = @"";
}

@end
