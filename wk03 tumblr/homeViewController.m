//
//  homeViewController.m
//  wk03 tumblr
//
//  Created by Jorge Angarita on 3/20/14.
//  Copyright (c) 2014 jorge. All rights reserved.
//

#import "homeViewController.h"
#import "dashboardViewController.h"
#import "searchViewController.h"
#import "composeViewController.h"
#import "profileViewController.h"
#import "trendingViewController.h"

@interface homeViewController ()

//@property (weak, nonatomic) IBOutlet UIView *tabView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIView *composeView;

@property (weak, nonatomic) IBOutlet UIImageView *textIcon;
@property (weak, nonatomic) IBOutlet UIImageView *photoIcon;
@property (weak, nonatomic) IBOutlet UIImageView *quoteIcon;
@property (weak, nonatomic) IBOutlet UIImageView *linkIcon;
@property (weak, nonatomic) IBOutlet UIImageView *chatIcon;
@property (weak, nonatomic) IBOutlet UIImageView *videoIcon;
@property (weak, nonatomic) IBOutlet UILabel *dismissLabel;

@property (nonatomic, strong) dashboardViewController *dashboardvc;
@property (nonatomic, strong) searchViewController *searchvc;
@property (nonatomic, strong) composeViewController *composevc;
@property (nonatomic, strong) profileViewController *profilevc;
@property (nonatomic, strong) trendingViewController *trendingvc;
@property (weak, nonatomic) IBOutlet UIImageView *exploreDialogue;

@property (weak, nonatomic) IBOutlet UIButton *homeButton;
@property (weak, nonatomic) IBOutlet UIButton *searchButton;
@property (weak, nonatomic) IBOutlet UIButton *profileButton;
@property (weak, nonatomic) IBOutlet UIButton *trendingButton;

- (IBAction)onHomeButton:(id)sender;
- (IBAction)onSearchButton:(id)sender;
- (IBAction)onComposeButton:(id)sender;
- (IBAction)onProfileButton:(id)sender;
- (IBAction)onTrendingButton:(id)sender;


- (IBAction)onComposeTap:(id)sender;


@end

@implementation homeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.dashboardvc = [[dashboardViewController alloc] init];
        self.searchvc = [[searchViewController alloc] init];
        self.composevc = [[composeViewController alloc] init];
        self.profilevc = [[profileViewController alloc] init];
        self.trendingvc = [[trendingViewController alloc] init];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.dashboardvc.view.frame = self.contentView.frame;
    [self.contentView addSubview:self.dashboardvc.view];
    
    self.searchvc.view.frame = self.contentView.frame;
    [self.contentView addSubview:self.searchvc.view];

    self.composevc.view.frame = self.contentView.frame;
    [self.contentView addSubview:self.composevc.view];

    self.profilevc.view.frame = self.contentView.frame;
    [self.contentView addSubview:self.profilevc.view];

    self.trendingvc.view.frame = self.contentView.frame;
    [self.contentView addSubview:self.trendingvc.view];

    [self.contentView bringSubviewToFront:self.dashboardvc.view];
    self.homeButton.selected = YES;
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tumblr_logo"]];
    self.navigationItem.title = @"Tumblr";
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Log in" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.rightBarButtonItem = rightButton;


    NSLog(@"self.view.frame: %@", NSStringFromCGRect(self.view.frame));
    //NSLog(@"self.tabView.frame: %@", NSStringFromCGRect(self.tabView.frame));
    
    
//    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0.5 options:UIViewAnimationOptionAllowAnimatedContent animations:^{
//        self.exploreDialogue.frame = CGRectMake(10, 475, self.exploreDialogue.frame.size.width, self.exploreDialogue.frame.size.height);
//    } completion:nil];
    
    
    [UIView animateWithDuration:1.5
                          delay:0
         //usingSpringWithDamping:1.0
          //initialSpringVelocity:0.1
                        options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat | 0 << 16
                     animations:^{
        self.exploreDialogue.frame = CGRectMake(10, 470, self.exploreDialogue.frame.size.width, self.exploreDialogue.frame.size.height);
        self.exploreDialogue.frame = CGRectMake(10, 475, self.exploreDialogue.frame.size.width, self.exploreDialogue.frame.size.height);
    } completion:nil];
    
    self.composeView.alpha = 0;
    
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"self.view.frame: %@", NSStringFromCGRect(self.view.frame));
    //NSLog(@"self.tabView.frame: %@", NSStringFromCGRect(self.tabView.frame));
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


- (IBAction)onHomeButton:(id)sender {
    [self.contentView bringSubviewToFront:self.dashboardvc.view];
    self.homeButton.selected = YES;
    self.searchButton.selected = NO;
    self.profileButton.selected = NO;
    self.trendingButton.selected = NO;
    
    //self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tumblr_logo"]];
    //self.navigationItem.title = @"Tumblr";
    //UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Log in" style:UIBarButtonItemStylePlain target:nil action:nil];
    //self.navigationItem.rightBarButtonItem = rightButton;
    //[[self navigationController] setNavigationBarHidden:NO animated:NO];
    
    self.exploreDialogue.alpha = 1;
}

- (IBAction)onSearchButton:(id)sender {
    //[[self navigationController] setNavigationBarHidden:YES animated:NO];
    [self.contentView bringSubviewToFront:self.searchvc.view];
    self.homeButton.selected = NO;
    self.searchButton.selected = YES;
    self.profileButton.selected = NO;
    self.trendingButton.selected = NO;
    
    self.exploreDialogue.alpha = 0;
    
}

- (IBAction)onComposeButton:(id)sender {
    
    self.textIcon.frame = CGRectMake(self.textIcon.frame.origin.x, 700, self.textIcon.frame.size.width, self.textIcon.frame.size.height);
    self.photoIcon.frame = CGRectMake(self.photoIcon.frame.origin.x, 700, self.photoIcon.frame.size.width, self.photoIcon.frame.size.height);
    self.quoteIcon.frame = CGRectMake(self.quoteIcon.frame.origin.x, 700, self.quoteIcon.frame.size.width, self.quoteIcon.frame.size.height);
    
    self.linkIcon.frame = CGRectMake(self.linkIcon.frame.origin.x, 800, self.linkIcon.frame.size.width, self.linkIcon.frame.size.height);
    self.chatIcon.frame = CGRectMake(self.chatIcon.frame.origin.x, 800, self.chatIcon.frame.size.width, self.chatIcon.frame.size.height);
    self.videoIcon.frame = CGRectMake(self.videoIcon.frame.origin.x, 800, self.videoIcon.frame.size.width, self.videoIcon.frame.size.height);
    
    self.dismissLabel.frame = CGRectMake(self.dismissLabel.frame.origin.x, 600, self.dismissLabel.frame.size.width, self.dismissLabel.frame.size.height);
    
    self.composeView.alpha = 1;
    
    [UIView animateWithDuration:0.35
                          delay:0
         usingSpringWithDamping:0.8
          initialSpringVelocity:0.5
                        options:UIViewAnimationOptionAllowAnimatedContent | 1 << 16
                     animations:^{
                self.textIcon.frame = CGRectMake(self.textIcon.frame.origin.x, 170, self.textIcon.frame.size.width, self.textIcon.frame.size.height);
            } completion:nil];
    
    [UIView animateWithDuration:0.45
                          delay:0
         usingSpringWithDamping:0.9
          initialSpringVelocity:0.5
                        options:UIViewAnimationOptionAllowAnimatedContent | 1 << 16
                     animations:^{
        self.photoIcon.frame = CGRectMake(self.photoIcon.frame.origin.x, 170, self.photoIcon.frame.size.width, self.photoIcon.frame.size.height);
    } completion:nil];
    
    [UIView animateWithDuration:0.35
                          delay:0
         usingSpringWithDamping:0.8
          initialSpringVelocity:0.5
                        options:UIViewAnimationOptionAllowAnimatedContent | 1 << 16
                     animations:^{
        self.quoteIcon.frame = CGRectMake(self.quoteIcon.frame.origin.x, 170, self.quoteIcon.frame.size.width, self.quoteIcon.frame.size.height);
    } completion:nil];
    
    
    [UIView animateWithDuration:0.35
                          delay:0.2
         usingSpringWithDamping:0.8
          initialSpringVelocity:0.5
                        options:UIViewAnimationOptionAllowAnimatedContent | 1 << 16
                     animations:^{
        self.linkIcon.frame = CGRectMake(self.linkIcon.frame.origin.x, 290, self.linkIcon.frame.size.width, self.linkIcon.frame.size.height);
    } completion:nil];
    
    [UIView animateWithDuration:0.45
                          delay:0.2
         usingSpringWithDamping:0.9
          initialSpringVelocity:0.5
                        options:UIViewAnimationOptionAllowAnimatedContent | 1 << 16
                     animations:^{
        self.chatIcon.frame = CGRectMake(self.chatIcon.frame.origin.x, 290, self.chatIcon.frame.size.width, self.chatIcon.frame.size.height);
    } completion:nil];
    
    [UIView animateWithDuration:0.35
                          delay:0.2
         usingSpringWithDamping:0.8
          initialSpringVelocity:0.5
                        options:UIViewAnimationOptionAllowAnimatedContent | 1 << 16
                     animations:^{
        self.videoIcon.frame = CGRectMake(self.videoIcon.frame.origin.x, 290, self.videoIcon.frame.size.width, self.videoIcon.frame.size.height);
    } completion:nil];
    
    [UIView animateWithDuration:0.35
                          delay:0.2
                        options:UIViewAnimationOptionAllowAnimatedContent | 0 << 16
                     animations:^{
        self.dismissLabel.frame = CGRectMake(self.dismissLabel.frame.origin.x, 512, self.dismissLabel.frame.size.width, self.dismissLabel.frame.size.height);
                     } completion:nil];
    
}

- (IBAction)onProfileButton:(id)sender {
    [self.contentView bringSubviewToFront:self.profilevc.view];
    self.homeButton.selected = NO;
    self.searchButton.selected = NO;
    self.profileButton.selected = YES;
    self.trendingButton.selected = NO;
    
    self.exploreDialogue.alpha = 1;
    //[[UIApplication sharedApplication] setStatusBarHidden:YES];
    }

- (IBAction)onTrendingButton:(id)sender {
    [self.contentView bringSubviewToFront:self.trendingvc.view];
    self.homeButton.selected = NO;
    self.searchButton.selected = NO;
    self.profileButton.selected = NO;
    self.trendingButton.selected = YES;
    
    self.exploreDialogue.alpha = 1;
    
//    self.navigationItem.titleView = [[UIView alloc] init];
//    self.navigationItem.title = @"Activity";
//    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Log in" style:UIBarButtonItemStylePlain target:nil action:nil];
//    self.navigationItem.rightBarButtonItem = rightButton;
    }

- (IBAction)onComposeTap:(id)sender {
    [UIView animateWithDuration:0.25
                          delay:0
                        options:UIViewAnimationOptionAllowAnimatedContent | 1 << 16
                     animations:^{
                         self.textIcon.frame = CGRectMake(self.textIcon.frame.origin.x, -80, self.textIcon.frame.size.width, self.textIcon.frame.size.height);
                     } completion:nil];
    
    [UIView animateWithDuration:0.35
                          delay:0
                         options:UIViewAnimationOptionAllowAnimatedContent | 1 << 16
                     animations:^{
                         self.photoIcon.frame = CGRectMake(self.photoIcon.frame.origin.x, -80, self.photoIcon.frame.size.width, self.photoIcon.frame.size.height);
                     } completion:nil];
    
    [UIView animateWithDuration:0.25
                          delay:0
                        options:UIViewAnimationOptionAllowAnimatedContent | 1 << 16
                     animations:^{
                         self.quoteIcon.frame = CGRectMake(self.quoteIcon.frame.origin.x, -80, self.quoteIcon.frame.size.width, self.quoteIcon.frame.size.height);
                     } completion:nil];
    
    
    [UIView animateWithDuration:0.25
                          delay:0.2
                        options:UIViewAnimationOptionAllowAnimatedContent | 1 << 16
                     animations:^{
                         self.linkIcon.frame = CGRectMake(self.linkIcon.frame.origin.x, -80, self.linkIcon.frame.size.width, self.linkIcon.frame.size.height);
                     } completion:nil];
    
    [UIView animateWithDuration:0.35
                          delay:0.2
                        options:UIViewAnimationOptionAllowAnimatedContent | 1 << 16
                     animations:^{
                         self.chatIcon.frame = CGRectMake(self.chatIcon.frame.origin.x, -80, self.chatIcon.frame.size.width, self.chatIcon.frame.size.height);
                     } completion:nil];
    
    [UIView animateWithDuration:0.25
                          delay:0.25
                        options:UIViewAnimationOptionAllowAnimatedContent | 1 << 16
                     animations:^{
                         self.videoIcon.frame = CGRectMake(self.videoIcon.frame.origin.x, -80, self.videoIcon.frame.size.width, self.videoIcon.frame.size.height);
                     } completion:nil];
    
    [UIView animateWithDuration:0.35
                          delay:0.1
                        options:UIViewAnimationOptionAllowAnimatedContent | 1 << 16
                     animations:^{
                         self.dismissLabel.frame = CGRectMake(self.dismissLabel.frame.origin.x, 600, self.dismissLabel.frame.size.width, self.dismissLabel.frame.size.height);
                     } completion:nil];
    
    [UIView animateWithDuration:0.1
                          delay:0.4
                        options:UIViewAnimationOptionAllowAnimatedContent | 0 << 16
                     animations:^{
                         self.composeView.alpha = 0;
                     } completion:nil];
    
}

@end
