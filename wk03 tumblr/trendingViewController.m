//
//  trendingViewController.m
//  wk03 tumblr
//
//  Created by Jorge Angarita on 3/21/14.
//  Copyright (c) 2014 jorge. All rights reserved.
//

#import "trendingViewController.h"

@interface trendingViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *activityImage;

@end

@implementation trendingViewController

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
    self.scrollView.contentSize = CGSizeMake(self.activityImage.frame.size.width, self.activityImage.frame.size.height);}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
