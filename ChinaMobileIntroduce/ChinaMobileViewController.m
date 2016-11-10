//
//  ChinaMobileViewController.m
//  talkIntro
//
//  Created by 123456 on 16/11/1.
//  Copyright © 2016年 sdq. All rights reserved.
//

#import "ChinaMobileViewController.h"
#import <Masonry.h>
#define NUMBER_OF_PAGES 4

#define timeForPage(page) (NSInteger)(self.view.frame.size.width * (page - 1))

@interface ChinaMobileViewController ()
//page1
@property (strong, nonatomic) UIImageView *page1_back;
@property (strong, nonatomic) UIImageView *page1_bubble;
@property (strong, nonatomic) UIImageView *page1_title;
@property (nonatomic, strong) IFTTTPathPositionAnimation *page1_bubbleFlyingAnimation;


//page2
@property (strong, nonatomic) UIImageView *page2_back;
@property (strong, nonatomic) UIImageView *page2_bubble;
@property (strong, nonatomic) UIImageView *page2_title;

//page3
@property (strong, nonatomic) UIImageView *page3_back;
@property (strong, nonatomic) UIImageView *page3_bubble;
@property (strong, nonatomic) UIImageView *page3_graph;
@property (strong, nonatomic) UIImageView *page3_title;


//page4
@property (strong, nonatomic) UIImageView *page4_back;
@property (strong, nonatomic) UIImageView *page4_bubble;
@property (strong, nonatomic) UIImageView *page4_decoration;
@property (strong, nonatomic) UIButton *page4_practice;
@property (strong, nonatomic) UIImageView *page4_title;



@end

@implementation ChinaMobileViewController
@synthesize page1_title,page1_bubble, page1_back;
@synthesize page2_back, page2_bubble, page2_title;
@synthesize page3_back, page3_bubble, page3_graph, page3_title;
@synthesize page4_back, page4_bubble, page4_decoration, page4_practice, page4_title;



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setScrollView];
    [self configureView];
    [self configureAnimation];
    
}
- (BOOL)prefersStatusBarHidden {
    return  YES;
}
- (NSUInteger)numberOfPages {
    return 4;
}
- (void)setScrollView {
    //set scrollview
//    self.scrollView.contentSize = CGSizeMake(NUMBER_OF_PAGES * CGRectGetWidth(self.view.frame),
//                                             CGRectGetHeight(self.view.frame));
    self.scrollView.bounces = YES;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = YES;
    self.scrollView.accessibilityLabel = @"Intro";
    self.scrollView.accessibilityIdentifier = @"Talk";
    self.scrollView.backgroundColor = [UIColor lightGrayColor];//change clear
}

- (void)configureView {
    [self configurePageView1];
    [self configurePageView2];
    [self configurePageView3];
    [self configurePageView4];
}

- (void)configureAnimation {
    [self configureBackgroundAnimation];
    [self configurePage1Animation];
    [self configurePage2Animation];
    [self configurePage3Animation];
    [self configurePage4Animation];
}

- (void)configureBackgroundAnimation{
    IFTTTBackgroundColorAnimation *backgroundColorAnimation = [IFTTTBackgroundColorAnimation animationWithView:self.scrollView];
    [backgroundColorAnimation addKeyframeForTime:0 color:[UIColor colorWithRed:31/255.f green:189/255.f blue:221/255.f alpha:1.0f]];
    [backgroundColorAnimation addKeyframeForTime:1 color:[UIColor colorWithRed:110/255.f green:156/255.f blue:253/255.f alpha:1.0f]];
    
    [backgroundColorAnimation addKeyframeForTime:2 color:[UIColor colorWithRed:118/255.f green:191/255.f blue:74/255.f alpha:1.0f]];
    
    [backgroundColorAnimation addKeyframeForTime:3 color:[UIColor colorWithRed:253/255.f green:170/255.f blue:72/255.f alpha:1.0f]];
    [self.animator addAnimation:backgroundColorAnimation];
}


- (void)setPage1_title_way2 {
    //"view1.attr1 = view2.attr2 * multiplier + constant"
    NSLayoutConstraint *titleVerticalConstraint = [NSLayoutConstraint constraintWithItem:page1_title
                                                                               attribute:NSLayoutAttributeCenterY
                                                                               relatedBy:NSLayoutRelationEqual
                                                                                  toItem:self.contentView
                                                                               attribute:NSLayoutAttributeCenterY
                                                                              multiplier:1.f constant:0.f];
    [self.contentView addConstraint:titleVerticalConstraint];
    
    
    IFTTTConstraintMultiplierAnimation *jazzVerticalAnimation = [IFTTTConstraintMultiplierAnimation animationWithSuperview:self.contentView
                                                                                                                constraint:titleVerticalConstraint
                                                                                                                 attribute:IFTTTLayoutAttributeHeight
                                                                                                             referenceView:self.view];
    
    [jazzVerticalAnimation addKeyframeForTime:0 multiplier:0];
    [jazzVerticalAnimation addKeyframeForTime:1 multiplier:-0.3];
    
    [self.animator addAnimation:jazzVerticalAnimation];

}

#pragma mark - Page
- (void)configurePageView1 {
    page1_title = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"page1_title"]];
    [self.contentView addSubview:page1_title];
    [page1_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(40);
        make.width.equalTo(self.scrollView).multipliedBy(0.7);
        make.height.equalTo(page1_title.mas_width).multipliedBy(0.4);
    }];
    
    
    page1_back = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"page1_back"]];
    [self.contentView addSubview:page1_back];
    
    [page1_back mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.page1_title.mas_bottom).offset(10);
        make.width.equalTo(self.scrollView).multipliedBy(0.9);
        make.height.equalTo(self.scrollView).multipliedBy(0.6);
    }];

   
    page1_bubble = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"page1_bubble"]];
    [self.contentView addSubview:page1_bubble];
    [page1_bubble mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.page1_title.mas_bottom).offset(15);
        make.width.equalTo(self.scrollView).multipliedBy(0.2);
        make.height.equalTo(self.scrollView).multipliedBy(0.1);
        make.right.equalTo(page1_back.mas_right).offset(-55);
    }];
    
    

}

    


- (void)configurePageView2 {
    page2_title = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"page2_title"]];
    [self.contentView addSubview:page2_title];
    [page2_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(40);
        make.width.equalTo(self.scrollView).multipliedBy(0.7);
        make.height.equalTo(page2_title.mas_width).multipliedBy(0.4);
    }];
    
    page2_back = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"page2_back"]];
    [self.contentView addSubview:page2_back];
    
    [page2_back mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.page2_title.mas_bottom).offset(10);
        make.width.equalTo(self.scrollView).multipliedBy(0.9);
        make.height.equalTo(self.scrollView).multipliedBy(0.6);
    }];
    
    
    page2_bubble = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"page2_bubble"]];
    [self.contentView addSubview:page2_bubble];
    [page2_bubble mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.page2_back.mas_bottom).offset(-140);
        make.width.equalTo(self.scrollView).multipliedBy(0.22);
        make.height.equalTo(self.scrollView).multipliedBy(0.15);
        make.right.equalTo(page2_back.mas_left).offset(70);
    }];

    
    

}

- (void)configurePageView3 {
    page3_title = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"page3_title"]];
    [self.contentView addSubview:page3_title];
    [page3_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(40);
        make.width.equalTo(self.scrollView).multipliedBy(0.7);
        make.height.equalTo(page3_title.mas_width).multipliedBy(0.4);
    }];
    
    
    page3_back = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"page3_back"]];
    [self.contentView addSubview:page3_back];
    
    [page3_back mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.page3_title.mas_bottom).offset(10);
        make.width.equalTo(self.scrollView).multipliedBy(0.9);
        make.height.equalTo(self.scrollView).multipliedBy(0.6);
    }];
    
    
    page3_bubble = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"page3_bubble"]];
    [self.contentView addSubview:page3_bubble];
    [page3_bubble mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.page3_back.mas_top).offset(50);
        make.width.equalTo(self.scrollView).multipliedBy(0.2);
        make.height.equalTo(self.scrollView).multipliedBy(0.15);
        make.right.equalTo(page3_back.mas_left).offset(75);
    }];
    
    page3_graph = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"page3_graph"]];
    [self.contentView addSubview:page3_graph];
    [page3_graph mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.page3_back.mas_top).offset(170);
        make.width.equalTo(self.page3_back).multipliedBy(0.5);
        make.height.equalTo(self.page3_back).multipliedBy(0.3);
        make.right.equalTo(page3_back.mas_right).offset(0);
    }];

    
    
    
}

- (void)configurePageView4 {
    page4_title = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"page4_title"]];
    [self.contentView addSubview:page4_title];
    [page4_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(40);
        make.width.equalTo(self.scrollView).multipliedBy(0.7);
        make.height.equalTo(page4_title.mas_width).multipliedBy(0.4);
    }];
    
    
    page4_back = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"page4_back"]];
    [self.contentView addSubview:page4_back];
    
    [page4_back mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.page4_title.mas_bottom).offset(10);
        make.width.equalTo(self.scrollView).multipliedBy(0.9);
        make.height.equalTo(self.scrollView).multipliedBy(0.6);
    }];
    
    
    page4_bubble = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"page4_bubble"]];
    [self.contentView addSubview:page4_bubble];
    [page4_bubble mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.page4_back.mas_top).offset(-20);
        make.width.equalTo(self.scrollView).multipliedBy(0.2);
        make.height.equalTo(self.scrollView).multipliedBy(0.15);
        make.right.equalTo(page4_back.mas_right).offset(5);
    }];
    
    page4_decoration = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"page4_decoration"]];
    [self.contentView addSubview:page4_decoration];
    [page4_decoration mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.page4_back.mas_top).offset(60);
        make.width.equalTo(self.page4_back).multipliedBy(0.14);
        make.height.equalTo(self.page4_back).multipliedBy(0.1);
        make.right.equalTo(page4_back.mas_right).offset(-70);
    }];
    
    
    page4_practice = [UIButton buttonWithType:UIButtonTypeCustom];
    [page4_practice setBackgroundImage:[UIImage imageNamed:@"page4_practice"] forState:UIControlStateNormal];
    [page4_practice addTarget:self action:@selector(enterHomePage) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:page4_practice];
    [page4_practice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.page4_back.mas_bottom).offset(20);
        make.width.equalTo(self.page4_back).multipliedBy(0.4);
        make.height.equalTo(self.page4_back).multipliedBy(0.09);
    }];
    
}

#pragma mark - Animation
- (void)configurePage1Animation {
    //设置page1_title的移动
    IFTTTTranslationAnimation *titleTran=[IFTTTTranslationAnimation animationWithView:page1_title];
    [titleTran addKeyframeForTime:0 translation:CGPointMake(0, 0)];
    [titleTran addKeyframeForTime:1 translation:CGPointMake(0, -self.scrollView.frame.size.height*0.3)];
    
    [self.animator addAnimation:titleTran];
    
    
    
    //设置page1_title的透明度
    IFTTTAlphaAnimation *titlealphaAnimation = [IFTTTAlphaAnimation animationWithView:page1_title];
    [titlealphaAnimation addKeyframeForTime:0 alpha:1];
    [titlealphaAnimation addKeyframeForTime:0.8 alpha:0];
    [self.animator addAnimation:titlealphaAnimation];
    
    //设置page1_title的隐藏
    IFTTTHideAnimation *titlelHideAnimation = [IFTTTHideAnimation animationWithView:page1_title hideAt:0.8];
    [self.animator addAnimation:titlelHideAnimation];
    
    
    
    //page1_back
    //    IFTTTTransform3D *transform3D = [IFTTTTransform3D transformWithM34:500];
    //    IFTTTTransform3DAnimation *backTransform3DAnimation = [IFTTTTransform3DAnimation animationWithView:page1_back];
    //    [backTransform3DAnimation addKeyframeForTime:1 transform:transform3D];
    //    [self.animator addAnimation:backTransform3DAnimation];
    
    
    //设置page1_back的移动
    IFTTTTranslationAnimation *backTran=[IFTTTTranslationAnimation animationWithView:page1_back];
    [backTran addKeyframeForTime:0 translation:CGPointMake(0, 0)];
    [backTran addKeyframeForTime:1 translation:CGPointMake(0, self.scrollView.frame.size.height)];
    [self.animator addAnimation:backTran];
    
    
    //设置page1_bubble的移动
    IFTTTScaleAnimation *bubbleScaleAnimation = [IFTTTScaleAnimation animationWithView:page1_bubble];
    [bubbleScaleAnimation addKeyframeForTime:0 scale:1 withEasingFunction:IFTTTEasingFunctionEaseInQuad];
    [bubbleScaleAnimation addKeyframeForTime:0.6 scale:0.1 withEasingFunction:IFTTTEasingFunctionEaseInQuad];
    [self.animator addAnimation:bubbleScaleAnimation];
    
    IFTTTAlphaAnimation *bubbleAlphaAnimation = [IFTTTAlphaAnimation animationWithView:page1_bubble];
    [bubbleAlphaAnimation addKeyframeForTime:0 alpha:1];
    [bubbleAlphaAnimation addKeyframeForTime:0.6 alpha:0];
    [self.animator addAnimation:bubbleAlphaAnimation];
    

    
    
    
//    self.page1_bubbleFlyingAnimation = [IFTTTPathPositionAnimation animationWithView:page1_bubble  path:[self getPage1_bubblePath]];
//    [self.page1_bubbleFlyingAnimation addKeyframeForTime:0 animationProgress:1];
//    [self.page1_bubbleFlyingAnimation addKeyframeForTime:1 animationProgress:1];
//    [self.animator addAnimation:self.page1_bubbleFlyingAnimation];
    
    
    [self keepView:page1_title onPages:@[@(0), @(1)]];
    [self keepView:page1_back onPages:@[@(0)]];
    [self keepView:page1_bubble onPages:@[@(0)]];
}

- (void)configurePage2Animation {
    //page2_title
    IFTTTTranslationAnimation *titleTran=[IFTTTTranslationAnimation animationWithView:page2_title];
    [titleTran addKeyframeForTime:1 translation:CGPointMake(0, 0)];
    [titleTran addKeyframeForTime:2 translation:CGPointMake(0, -self.scrollView.frame.size.height*0.3)];
    [self.animator addAnimation:titleTran];
    
    IFTTTAlphaAnimation *titlealphaAnimation = [IFTTTAlphaAnimation animationWithView:page2_title];
    [titlealphaAnimation addKeyframeForTime:0 alpha:0];
    [titlealphaAnimation addKeyframeForTime:1 alpha:1];
    [titlealphaAnimation addKeyframeForTime:1.8 alpha:0];
    [self.animator addAnimation:titlealphaAnimation];
    
    IFTTTHideAnimation *titlelHideAnimation = [IFTTTHideAnimation animationWithView:page2_title hideAt:1.7];
    [self.animator addAnimation:titlelHideAnimation];
    
    
    //page2_back
    IFTTTTranslationAnimation *backTran=[IFTTTTranslationAnimation animationWithView:page2_back];
    [backTran addKeyframeForTime:0 translation:CGPointMake(self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
    [backTran addKeyframeForTime:1 translation:CGPointMake(0, 0)];
    [backTran addKeyframeForTime:2 translation:CGPointMake(0, self.scrollView.frame.size.height)];

    [self.animator addAnimation:backTran];
    
    
    
    
    
    //page2_bubble
    IFTTTAlphaAnimation *bubbleAlphaAnimation = [IFTTTAlphaAnimation animationWithView:page2_bubble];
    [bubbleAlphaAnimation addKeyframeForTime:0.1 alpha:0];
    [bubbleAlphaAnimation addKeyframeForTime:1 alpha:1];
    [self.animator addAnimation:bubbleAlphaAnimation];
    
    IFTTTScaleAnimation *bubbleScaleAnimation = [IFTTTScaleAnimation animationWithView:page2_bubble];
    [bubbleScaleAnimation addKeyframeForTime:0.1 scale:0.1 withEasingFunction:IFTTTEasingFunctionEaseInQuad];
    [bubbleScaleAnimation addKeyframeForTime:1 scale:1 withEasingFunction:IFTTTEasingFunctionEaseInQuad];
    [self.animator addAnimation:bubbleScaleAnimation];
    
    IFTTTTranslationAnimation *bubbleTran=[IFTTTTranslationAnimation animationWithView:page2_bubble];
    [bubbleTran addKeyframeForTime:0 translation:CGPointMake(-self.scrollView.frame.size.width, -self.scrollView.frame.size.height)];
    [bubbleTran addKeyframeForTime:1 translation:CGPointMake(0, 0)];
    [self.animator addAnimation:bubbleTran];
    
    
    
    
    
    
    
    [self keepView:page2_title onPages:@[@(1), @(2)]];
    [self keepView:page2_back onPages:@[@(1)]];
    [self keepView:page2_bubble onPages:@[@(1)]];
}

- (void)configurePage3Animation {
    //page3_title的移动
    IFTTTTranslationAnimation *titleTran=[IFTTTTranslationAnimation animationWithView:page3_title];
    [titleTran addKeyframeForTime:2 translation:CGPointMake(0, 0)];
    [titleTran addKeyframeForTime:3 translation:CGPointMake(0, -self.scrollView.frame.size.height*0.3)];
    [self.animator addAnimation:titleTran];
    
    IFTTTAlphaAnimation *titlealphaAnimation = [IFTTTAlphaAnimation animationWithView:page3_title];
    [titlealphaAnimation addKeyframeForTime:1 alpha:0];
    [titlealphaAnimation addKeyframeForTime:2 alpha:1];
    [titlealphaAnimation addKeyframeForTime:2.8 alpha:0];
    [self.animator addAnimation:titlealphaAnimation];
    
    IFTTTHideAnimation *titlelHideAnimation = [IFTTTHideAnimation animationWithView:page3_title hideAt:2.7];
    [self.animator addAnimation:titlelHideAnimation];
    
    [self keepView:page3_title onPages:@[@(2), @(3)]];
    [self keepView:page3_back onPages:@[@(2)]];
    [self keepView:page3_bubble onPages:@[@(2)]];
    [self keepView:page3_graph onPages:@[@(2)]];
    
    
    
    //page3_back
    IFTTTTranslationAnimation *backTran=[IFTTTTranslationAnimation animationWithView:page3_back];
    [backTran addKeyframeForTime:1 translation:CGPointMake(self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
    [backTran addKeyframeForTime:2 translation:CGPointMake(0, 0)];
    [backTran addKeyframeForTime:3 translation:CGPointMake(0, self.scrollView.frame.size.height)];
    [self.animator addAnimation:backTran];
    
    
    
    
    //page3_bubble
    IFTTTAlphaAnimation *bubbleAlphaAnimation = [IFTTTAlphaAnimation animationWithView:page3_bubble];
    [bubbleAlphaAnimation addKeyframeForTime:1.1 alpha:0];
    [bubbleAlphaAnimation addKeyframeForTime:2 alpha:1];
    [self.animator addAnimation:bubbleAlphaAnimation];
    
    IFTTTScaleAnimation *bubbleScaleAnimation = [IFTTTScaleAnimation animationWithView:page3_bubble];
    [bubbleScaleAnimation addKeyframeForTime:1.1 scale:0.1 withEasingFunction:IFTTTEasingFunctionEaseInQuad];
    [bubbleScaleAnimation addKeyframeForTime:2 scale:1 withEasingFunction:IFTTTEasingFunctionEaseInQuad];
    [self.animator addAnimation:bubbleScaleAnimation];
    
    IFTTTTranslationAnimation *bubbleTran=[IFTTTTranslationAnimation animationWithView:page3_bubble];
    [bubbleTran addKeyframeForTime:1 translation:CGPointMake(self.scrollView.frame.size.width, self.scrollView.frame.size.height*2)];
    [bubbleTran addKeyframeForTime:2 translation:CGPointMake(0, 0)];
    [self.animator addAnimation:bubbleTran];
    
    
    

    
}

- (void)configurePage4Animation {
    //page4_title的透明度
    IFTTTAlphaAnimation *titlealphaAnimation = [IFTTTAlphaAnimation animationWithView:page4_title];
    [titlealphaAnimation addKeyframeForTime:2 alpha:0];
    [titlealphaAnimation addKeyframeForTime:3 alpha:1];
    [titlealphaAnimation addKeyframeForTime:4 alpha:0];
    [self.animator addAnimation:titlealphaAnimation];
    
    
    
    
    //page4_back
    IFTTTTranslationAnimation *backTran=[IFTTTTranslationAnimation animationWithView:page4_back];
    [backTran addKeyframeForTime:2 translation:CGPointMake(self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
    [backTran addKeyframeForTime:3 translation:CGPointMake(0, 0)];
    [self.animator addAnimation:backTran];
    
    
    
    //page4_bubble
    IFTTTAlphaAnimation *bubbleAlphaAnimation = [IFTTTAlphaAnimation animationWithView:page4_bubble];
    [bubbleAlphaAnimation addKeyframeForTime:2.1 alpha:0];
    [bubbleAlphaAnimation addKeyframeForTime:3 alpha:1];
    [self.animator addAnimation:bubbleAlphaAnimation];
    
    IFTTTScaleAnimation *bubbleScaleAnimation = [IFTTTScaleAnimation animationWithView:page4_bubble];
    [bubbleScaleAnimation addKeyframeForTime:2.1 scale:0.1 withEasingFunction:IFTTTEasingFunctionEaseInQuad];
    [bubbleScaleAnimation addKeyframeForTime:3 scale:1 withEasingFunction:IFTTTEasingFunctionEaseInQuad];
    [self.animator addAnimation:bubbleScaleAnimation];
    
    IFTTTTranslationAnimation *bubbleTran=[IFTTTTranslationAnimation animationWithView:page4_bubble];
    [bubbleTran addKeyframeForTime:2 translation:CGPointMake(self.scrollView.frame.size.width, self.scrollView.frame.size.height*2)];
    [bubbleTran addKeyframeForTime:3 translation:CGPointMake(0, 0)];
    [self.animator addAnimation:bubbleTran];
    
    
    
    
    
    
    
    
    
    [self keepView:page4_title onPages:@[@(3)]];
    [self keepView:page4_back onPages:@[@(3)]];
    [self keepView:page4_bubble onPages:@[@(3)]];
    [self keepView:page4_decoration onPages:@[@(3)]];
    [self keepView:page4_practice onPages:@[@(3)]];

}



- (CGPathRef)airplanePath
{
    // Create a bezier path for the airplane to fly along
    UIBezierPath *airplanePath = [UIBezierPath bezierPath];
    [airplanePath moveToPoint: CGPointMake(120, 120)];
    [airplanePath addCurveToPoint: CGPointMake(120, 200) controlPoint1: CGPointMake(30, 80) controlPoint2: CGPointMake(140, 50)];
//    [airplanePath addCurveToPoint: CGPointMake(30, -430) controlPoint1: CGPointMake(-60, -210) controlPoint2: CGPointMake(-320, -430)];
//    [airplanePath addCurveToPoint: CGPointMake(-210, -190) controlPoint1: CGPointMake(320, -430) controlPoint2: CGPointMake(130, -190)];
    
    return airplanePath.CGPath;
}

- (CGPathRef)getPage1_bubblePath
{
    // Scale the airplane path to the given page size
    CGSize scaleSize = CGSizeMake(self.scrollView.frame.size.width , self.scrollView.frame.size.height);
    
    CGAffineTransform scaleTransform = CGAffineTransformMakeScale(scaleSize.width, scaleSize.height);
    
    CGPathRef scaledPath = CGPathCreateCopyByTransformingPath(self.airplanePath, &scaleTransform);
    
//    self.planePathLayer.path = scaledPath;
    self.page1_bubbleFlyingAnimation.path = scaledPath;

//    CGPathRelease(scaledPath);
    return scaledPath;
}


- (void)enterHomePage {
    NSLog(@"Enter home pagge.");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
