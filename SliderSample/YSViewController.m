//
//  YSViewController.m
//  SliderSample
//
//  Created by 新谷　よしみ on 2013/04/18.
//  Copyright (c) 2013年 新谷　よしみ. All rights reserved.
//

#import "YSViewController.h"

@interface YSViewController ()

@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UISlider *slider;

@end

@implementation YSViewController


//.｡.:*･ﾟ♡★♡ﾟ･*:.｡ ｡.:*･ﾟ♡★♡ﾟ･*:.｡ ｡.:*･ﾟ♡★♡ﾟ･*:.｡ ｡.:*･ﾟ♡★♡ﾟ･*:.｡ ｡.:*･ﾟ//
#pragma mark -- View Life Cycle --
//.｡.:*･ﾟ♡★♡ﾟ･*:.｡ ｡.:*･ﾟ♡★♡ﾟ･*:.｡ ｡.:*･ﾟ♡★♡ﾟ･*:.｡ ｡.:*･ﾟ♡★♡ﾟ･*:.｡ ｡.:*･ﾟ//

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setTextViewOnView];
    [self setSliderOnView];
}


//.｡.:*･ﾟ♡★♡ﾟ･*:.｡ ｡.:*･ﾟ♡★♡ﾟ･*:.｡ ｡.:*･ﾟ♡★♡ﾟ･*:.｡ ｡.:*･ﾟ♡★♡ﾟ･*:.｡ ｡.:*･ﾟ//
#pragma mark -- UITextView --
//.｡.:*･ﾟ♡★♡ﾟ･*:.｡ ｡.:*･ﾟ♡★♡ﾟ･*:.｡ ｡.:*･ﾟ♡★♡ﾟ･*:.｡ ｡.:*･ﾟ♡★♡ﾟ･*:.｡ ｡.:*･ﾟ//

- (void)setTextViewOnView {
    
    self.textView = [[UITextView alloc] init];
    _textView.delegate = self;
    _textView.showsVerticalScrollIndicator = NO;
    _textView.font = [UIFont systemFontOfSize:24];
    _textView.text = @"Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. Sed consequat, leo eget bibendum sodales, augue velit cursus nunc";
    
    CGRect frame = self.view.frame;
    frame.size.width -= 20;
    _textView.frame = frame;
    
    [self.view addSubview:_textView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    //textViewがスクロールされたらつまみを表示する
    [self showSlider];
    
    //textViewのスクロールに合わせてつまみを動かす
    _slider.value = scrollView.contentOffset.y/(_textView.contentSize.height - _textView.bounds.size.height);
}


//.｡.:*･ﾟ♡★♡ﾟ･*:.｡ ｡.:*･ﾟ♡★♡ﾟ･*:.｡ ｡.:*･ﾟ♡★♡ﾟ･*:.｡ ｡.:*･ﾟ♡★♡ﾟ･*:.｡ ｡.:*･ﾟ//
#pragma mark -- UISlider --
//.｡.:*･ﾟ♡★♡ﾟ･*:.｡ ｡.:*･ﾟ♡★♡ﾟ･*:.｡ ｡.:*･ﾟ♡★♡ﾟ･*:.｡ ｡.:*･ﾟ♡★♡ﾟ･*:.｡ ｡.:*･ﾟ//

- (void)setSliderOnView {
    
    self.slider = [[UISlider alloc] initWithFrame:CGRectZero];
    
    //UISliderを90°回転して縦方向にする
    _slider.transform = CGAffineTransformMakeRotation(M_PI * 0.5);
    
    //回転したあとにframeを設定しないと、xとy、widthとheightが逆になるので注意(๑￫_￩๑ )
    _slider.frame = CGRectMake(self.view.frame.size.width - 25, self.view.bounds.origin.y, 20, self.view.bounds.size.height);
    
    //UISliderのバーを透明にするためにバーに透明な画像を設定している
    [_slider setMinimumTrackImage:[UIImage imageNamed:@"skeleton.png"] forState:UIControlStateNormal];
    [_slider setMaximumTrackImage:[UIImage imageNamed:@"skeleton.png"] forState:UIControlStateNormal];
    
    //UISliderのつまみにカスタム画像を設定
    [_slider setThumbImage:[UIImage imageNamed:@"thumb.png"] forState:UIControlStateNormal];
    
    //UISliderが動くたびに sliderValueChanged: が呼ばれる
    [_slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:_slider];    
}

- (void)sliderValueChanged:(UISlider*)slider {
    
    //つまみに合わせてtextViewをスクロールさせる
    float position = (_textView.contentSize.height - _textView.bounds.size.height)*slider.value;
    [_textView setContentOffset:CGPointMake(0, position)];
}

- (void)showSlider {
    
    _slider.alpha = 1.0;
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(hideSlider) object:nil];
    [self performSelector:@selector(hideSlider) withObject:nil afterDelay:2];
}

- (void)hideSlider {
    
    [UIView animateWithDuration:0.5f
                     animations:^{
                         _slider.alpha = 0.0;
                     }
                     completion:nil];
}

@end
