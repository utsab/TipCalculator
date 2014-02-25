//
//  SettingsVC.m
//  TipCalculator
//
//  Created by Utsab Saha on 2/25/14.
//  Copyright (c) 2014 uks. All rights reserved.
//

#import "SettingsVC.h"

@interface SettingsVC ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

- (IBAction)onTipSelected:(id)sender;

@end

@implementation SettingsVC

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
	// Do any additional setup after loading the view.
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

- (IBAction)onTipSelected:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.tipControl.selectedSegmentIndex forKey:@"defaultTipControlIndex"];
    [defaults synchronize];
}

@end
