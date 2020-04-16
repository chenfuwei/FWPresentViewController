//
//  FWPushViewController.m
//  FWPresentViewController
//
//  Created by net263 on 2020/4/15.
//  Copyright © 2020 net263. All rights reserved.
//

#import "FWPushViewController.h"

@interface FWPushViewController ()
@property(nonatomic, assign)BOOL isViewDidLoad;

@end

@implementation FWPushViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _bgColor = [UIColor clearColor];
        _contentSize= self.view.frame.size;
        _pushType = FWPUSHTYPE_RIGHT;
        [self updateBackgroundColor];
        [self updateContentViewConstraint];
        self.transitioningDelegate = self;
    }
    return self;
}

- (instancetype)initWithChildViewController:(UIViewController *)childViewController
{
    self = [self init];
    if (self) {
        _childViewController = childViewController;
        [self updateChildViewController];
    }
    return self;
}

- (void)setChildViewController:(UIViewController *)childViewController
{
    [self removeOldChildViewController];
    _childViewController = childViewController;
    [self updateChildViewController];
}

- (void)setBgColor:(UIColor *)bgColor
{
    _bgColor = bgColor;
    [self updateBackgroundColor];
}

- (void)setContentSize:(CGSize)contentSize
{
    _contentSize = contentSize;
    [self updateContentViewConstraint];
}

-(void)setPushType:(FWPUSHTYPE)pushType
{
    _pushType = pushType;
    [self updateContentViewConstraint];
}

-(void)removeOldChildViewController
{
    if(_childViewController)
    {
        [_childViewController willMoveToParentViewController:self];
        [_childViewController removeFromParentViewController];
        [_childViewController.view removeFromSuperview];
        _childViewController = nil;
    }
}

-(void)updateChildViewController
{
    if(_childViewController && _isViewDidLoad)
    {
        [self addChildViewController:_childViewController];
        [self.contentView addSubview:_childViewController.view];
        [self updateContentViewConstraint];
    }
}

-(void)updateBackgroundColor
{
    self.view.backgroundColor = _bgColor;
    
}

-(void)updateContentViewConstraint
{
    if([_childViewController.view superview] && _isViewDidLoad)
    {
        CGFloat pWidth = self.view.frame.size.width;
        CGFloat pHeight = self.view.frame.size.height;
        CGFloat pLeft = self.view.frame.origin.x;
        CGFloat pTop = self.view.frame.origin.y;
        
        CGFloat cWidth = 0;
        CGFloat cHeight = 0;
        CGFloat cLeft = 0;
        CGFloat cTop = 0;
        if(_contentSize.height == MAXFLOAT)
        {
            cHeight = pHeight;
        }else{
            cHeight = _contentSize.height;
        }
        if(_contentSize.width == MAXFLOAT)
        {
            cWidth = pWidth;
        }else{
            cWidth = _contentSize.width;
        }
        if(_pushType == FWPUSHTYPE_RIGHT)
        {
            cLeft = pWidth - cWidth;
            cTop = pTop;
        }else if(_pushType == FWPUSHTYPE_LEFT)
        {
            cLeft = pLeft;
            cTop = pTop;
        }
        _contentView.frame = CGRectMake(cLeft, cTop, cWidth, cHeight);
        _childViewController.view.frame = self.contentView.bounds;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _isViewDidLoad = YES;
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(self.view.frame.size.width - _contentSize.width, self.view.frame.size.height - _contentSize.height, _contentSize.width, _contentSize.height)];
    _contentView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_contentView];
    [self updateChildViewController];
    [self addSingleGestureDetect];
}

-(void)addSingleGestureDetect
{
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap:)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
}

-(void)onTap:(UITapGestureRecognizer*)tapGestureRecognizer
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)dealloc
{
    _isViewDidLoad = NO;
}

- (void)viewDidLayoutSubviews
{
    [self updateContentViewConstraint];
}
@end
