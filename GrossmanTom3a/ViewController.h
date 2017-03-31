//
//  ViewController.h
//  GrossmanTom3a
//
//  Created by Tom Grossman on 7/26/16.
//  Copyright © 2016 Tom Grossman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *ageField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;
- (IBAction)addButton:(id)sender;
- (IBAction)startButton:(id)sender;
- (IBAction)nextButton:(id)sender;
- (IBAction)printButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *addButton;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UIButton *printButton;
- (IBAction)nameFieldModify:(id)sender;
- (IBAction)ageFieldModify:(id)sender;
- (IBAction)emailFieldModify:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
- (IBAction)clearButton:(id)sender;



@end

