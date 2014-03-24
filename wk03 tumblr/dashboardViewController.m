//
//  dashboardViewController.m
//  wk03 tumblr
//
//  Created by Jorge Angarita on 3/21/14.
//  Copyright (c) 2014 jorge. All rights reserved.
//

#import "dashboardViewController.h"
#import "composeViewController.h"
#import "homeViewController.h"
#import "searchViewController.h"
#import "profileViewController.h"
#import "trendingViewController.h"

@interface dashboardViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *dashboardImage;
@property (weak, nonatomic) IBOutlet UIView *loginView;
@property (weak, nonatomic) IBOutlet UIView *logInBox;
@property (weak, nonatomic) IBOutlet UIButton *logInButton2;

@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;



- (IBAction)onLogInButton:(id)sender;
- (IBAction)onCancelButton:(id)sender;
- (IBAction)onLogInButton2:(id)sender;


@end

@implementation dashboardViewController

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
    self.emailField.delegate = self;
    self.passwordField.delegate = self;
    
    self.loginView.alpha = 0;
    self.logInBox.layer.cornerRadius = 7;
    self.scrollView.contentSize = CGSizeMake(self.dashboardImage.frame.size.width, self.dashboardImage.frame.size.height);
    
    self.logInButton2.enabled = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onLogInButton:(id)sender {
    self.loginView.alpha = 1;
    self.logInBox.alpha = 0;
    [self.emailField becomeFirstResponder];
    self.logInBox.frame = CGRectMake(10, 300, self.logInBox.frame.size.width, self.logInBox.frame.size.height);
    
    [UIView animateWithDuration:0.5
                          delay:0
         usingSpringWithDamping:0.8
          initialSpringVelocity:0.5
                        options:UIViewAnimationOptionAllowAnimatedContent | 1 << 16
                     animations:^{
                         self.logInBox.frame = CGRectMake(self.logInBox.frame.origin.x, 100, self.logInBox.frame.size.width, self.logInBox.frame.size.height);
                         self.logInBox.alpha = 1;
                     } completion:nil];
}

- (IBAction)onCancelButton:(id)sender {
    
    [self.view endEditing:YES];
    
    [UIView animateWithDuration:0.35
                          delay:0
         usingSpringWithDamping:0.8
          initialSpringVelocity:0.5
                        options:UIViewAnimationOptionAllowAnimatedContent | 1 << 16
                     animations:^{
                         self.logInBox.frame = CGRectMake(self.logInBox.frame.origin.x, 300, self.logInBox.frame.size.width, self.logInBox.frame.size.height);
                         self.loginView.alpha = 0;
                     } completion:nil];
    
}

- (IBAction)onLogInButton2:(id)sender {
    
    [self.activityView startAnimating];
    [self performSelector:@selector(logInMethod) withObject:nil afterDelay:2];
    //self.view.userInteractionEnabled = NO;
    self.logInButton2.enabled = NO;

}

- (void) logInMethod {
    NSString *email = self.emailField.text;
    NSString *password = self.passwordField.text;
    
    if ([email isEqualToString:@"jorge@yahoo.com"] && [password isEqualToString:@"password"]) {
        
//        UIViewController *vc1 = [[composeViewController alloc] init];
//        UINavigationController *nvc1 = [[UINavigationController alloc] initWithRootViewController:vc1];
//        nvc1.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//        [self presentViewController:nvc1 animated:YES completion:nil];
        
        
        [self.view endEditing:YES];
        
        [UIView animateWithDuration:0.4
                              delay:0
                            options:UIViewAnimationOptionAllowAnimatedContent | 2 << 16
                         animations:^{
                             //self.logInBox.frame = CGRectMake(self.logInBox.frame.origin.x+310, self.logInBox.frame.origin.y, self.logInBox.frame.size.width, self.logInBox.frame.size.height);
                             self.loginView.alpha = 0;
                         } completion:nil];
        
        //[self performSelector:@selector(logInSuccessMethod) withObject:nil afterDelay:1];
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Logged In" message:@"Start following blogs to see your dashboard come to live!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alertView show];
        
        [self.activityView stopAnimating];
        self.logInButton2.enabled = YES;

        
    }else {
        
    [self.activityView stopAnimating];
    self.logInButton2.enabled = YES;
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Incorrect Password" message:@"The password you entered is incorrect. Please try again." delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil];
    [alertView show];
    
}

//- (void) logInSuccessMethod {
//    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Logged In" message:@"Start following blogs to see your dashboard come to live!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
//    [alertView show];
//}
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *text = [textField.text stringByReplacingCharactersInRange:range withString:string];
    NSString *otherText;
    if (textField == self.emailField) {
        otherText = self.passwordField.text;
    } else {
        otherText = self.emailField.text;
    }
    
    if (![text isEqual:@""] && ![otherText isEqual:@""]) {
        self.logInButton2.enabled = YES;
        NSLog(@"enable button");
    } else {
        self.logInButton2.enabled = NO;
        NSLog(@"disable button");
    }
    
    
    
    
    return YES;
}

@end
