//
//  TipVC.m
//  TipCalculator
//
//  Created by Utsab Saha on 2/24/14.
//  Copyright (c) 2014 uks. All rights reserved.
//

#import "TipVC.h"

@interface TipVC ()
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

- (IBAction)onTap:(id)sender;

@end

@implementation TipVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self updateValues]; 
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int defaultTipIndex = [defaults integerForKey:@"defaultTipControlIndex"];
    [self.tipControl setSelectedSegmentIndex:defaultTipIndex];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
}


- (void)updateValues {
    float billAmt = [self.billTextField.text floatValue];
    NSArray *tipValues = @[@(.1), @(0.15), @(.2)];
    float tipAmount = billAmt * [tipValues[self.tipControl.selectedSegmentIndex] floatValue];
    
    float totalAmt = billAmt + tipAmount;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f", totalAmt];
    
}
@end
