//
//  PuzzleViewController.m
//  MagicPuzzle
//
//  Created by broy denty on 14-4-9.
//  Copyright (c) 2014年 denty. All rights reserved.
//
// 摇一摇排序拼图
#import "PuzzleViewController.h"
#import "GMGridView.h"
#import "sys/param.h"
#import "sys/mount.h"
#import "UIImage+additions.h"
#import "ImagePickerViewController.h"
#import "SWSnapshotStackView.h"
@interface PuzzleViewController ()

@end

@implementation PuzzleViewController
{
    NSMutableArray * m_captureImageArray;
    NSMutableArray *m_checkArray;
    UIImage *m_puzzleImage;
    BOOL check;
    CGFloat m_scale;
}
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
    [self.gridView setPagingEnabled:NO];
    self.gridView.style = GMGridViewStyleSwap;
    self.gridView.centerGrid = YES;
    self.gridView.actionDelegate = self;
    self.gridView.sortingDelegate = self;
//    self.gridView.transformDelegate = self;
    self.gridView.dataSource = self;
    [self.homeBackgroundView setImage:[UIImage imageNamed:@"Wood.jpg"]];
    [self.gridView setBackgroundColor:[UIColor clearColor]];
    UIButton *startButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 50)];
    [startButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [startButton setTitle:@"start" forState:UIControlStateNormal];
    [self.view addSubview:startButton];
    [startButton addTarget:self action: @selector(pickImage) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *reloadButton = [[UIButton alloc] initWithFrame:CGRectMake(240, 0, 80, 50)];
    [reloadButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [reloadButton setTitle:@"load" forState:UIControlStateNormal];
    [self.view addSubview:reloadButton];
    [reloadButton addTarget:self action: @selector(loadLibraryImage) forControlEvents:UIControlEventTouchUpInside];

//    shake
//    [[UIApplication sharedApplication] setApplicationSupportsShakeToEdit:YES];
    // Do any additional setup after loading the view from its nib.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfItemsInGMGridView:(GMGridView *)gridView
{
    return 20;
}

- (GMGridViewCell *)GMGridView:(GMGridView *)gridView cellForItemAtIndex:(NSInteger)index
{
    //NSLog(@"Creating view indx %d", index);
    

    GMGridViewCell *cell = [gridView dequeueReusableCell];
    
    if (!cell)
    {
        cell = [[GMGridViewCell alloc] init];
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 70, 70)];
        view.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        view.layer.masksToBounds = NO;
        view.layer.cornerRadius = 4;
        cell.contentView = view;
        UIImageView *imageHolder = [[UIImageView alloc] initWithFrame:CGRectMake(2, 2, 66, 66)];
        [cell addSubview:imageHolder];
        [imageHolder setTag:10];
        [cell.contentView addSubview:imageHolder];

    }
    if (m_captureImageArray.count>0) {
        UIImage * captureImage = (UIImage *)[m_captureImageArray objectAtIndex:index];
        [(UIImageView *)[cell.contentView viewWithTag:10] setImage:captureImage];
    }
    return cell;

}

- (CGSize)GMGridView:(GMGridView *)gridView sizeForItemsInInterfaceOrientation:(UIInterfaceOrientation)orientation
{
    return CGSizeMake(70, 70);
}

- (BOOL)GMGridView:(GMGridView *)gridView canDeleteItemAtIndex:(NSInteger)index
{
    return NO; //index % 2 == 0;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return NO;
}

- (void)GMGridView:(GMGridView *)gridView didTapOnItemAtIndex:(NSInteger)position
{
    
}

- (void)GMGridView:(GMGridView *)gridView moveItemAtIndex:(NSInteger)oldIndex toIndex:(NSInteger)newIndex
{
    
}

- (void)GMGridView:(GMGridView *)gridView exchangeItemAtIndex:(NSInteger)index1 withItemAtIndex:(NSInteger)index2
{
    [m_captureImageArray exchangeObjectAtIndex:index1 withObjectAtIndex:index2];
}

- (void)GMGridView:(GMGridView *)gridView didStartMovingCell:(GMGridViewCell *)cell
{
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         cell.contentView.backgroundColor = [UIColor orangeColor];
                         cell.contentView.layer.shadowOpacity = 0.7;
                     }
                     completion:nil
     ];
}

- (void)GMGridView:(GMGridView *)gridView didEndMovingCell:(GMGridViewCell *)cell
{
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationOptionAllowUserInteraction
                     animations:^{
                         cell.contentView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
                         cell.contentView.layer.shadowOpacity = 0;
                     }
                     completion:nil
     ];
}

-(UIImage*)captureView:(UIImage *)theimage frame:(CGRect)fra{
    CGImageRef ref = CGImageCreateWithImageInRect(theimage.CGImage, fra);
    UIImage *i = [UIImage imageWithCGImage:ref];
    return i;
}

- (void)refresh
{
    UIImage * fullImage = m_puzzleImage;
    m_captureImageArray = [self captureImage:fullImage CellNumber:20];
    m_checkArray = [m_captureImageArray copy];
    [self.tipImageVIew setImage:fullImage];
}

- (NSMutableArray*)captureImage:(UIImage *)image CellNumber:(NSInteger) number
{
    NSMutableArray *imageArray = [[NSMutableArray alloc] init];
    if (number == 20) {
        for (int i = 0; i<number; i++) {
            if (i<4) {
                UIImage *tempImage =[self captureView:image frame:CGRectMake(70*i*m_scale,0, 70*m_scale, 70*m_scale)];
                [imageArray addObject:tempImage];
            }
            else if(i<8)
            {
                UIImage *tempImage = [self captureView:image frame:CGRectMake(70*(i-4)*m_scale,70*m_scale, 70*m_scale, 70*m_scale)];
                [imageArray addObject:tempImage];
            }
            else if(i<12)
            {
                UIImage *tempImage = [self captureView:image frame:CGRectMake(70*(i-8)*m_scale,140*m_scale, 70*m_scale, 70*m_scale)];
                [imageArray addObject:tempImage];
            }else if(i<16)
            {
                UIImage *tempImage = [self captureView:image frame:CGRectMake(70*(i-12)*m_scale,210*m_scale, 70*m_scale, 70*m_scale)];
                [imageArray addObject:tempImage];
            }else if(i<20)
            {
                UIImage *tempImage = [self captureView:image frame:CGRectMake(70*(i-16)*m_scale,280*m_scale, 70*m_scale, 70*m_scale)];
                [imageArray addObject:tempImage];
            }
        }
    }
    return imageArray;
}

- (void)randomMutableArray
{
    for (int i=0; i<m_captureImageArray.count; i++) {
        int value = arc4random() % (m_captureImageArray.count-1);
        [m_captureImageArray exchangeObjectAtIndex:i withObjectAtIndex:value];
    }
    [self.gridView reloadData];
    [self startShakeAnimation];
}

- (void)loadLibraryImage
{
    ImagePickerViewController *aImagePickerViewController = [[ImagePickerViewController alloc] init];
    [self presentViewController:aImagePickerViewController animated:YES completion:^{
        
    }];
}

- (void)check
{
    for (int i=0; i<m_captureImageArray.count; i++) {
        NSData *data = UIImagePNGRepresentation([m_captureImageArray objectAtIndex:i]);
        NSData *checkData = UIImagePNGRepresentation([m_checkArray objectAtIndex:i]);
        if ([data isEqual:checkData]) {
            check = YES;
        }else
        {
            check = NO;
            break;
        }
    }
    if (check) {
        [self.gridView makeToast:@"excellent！！！"];
    }else
    {
        [self.gridView makeToast:@"Is wrong！！！ Try again！"];
    }
}
- (IBAction)checkAction:(id)sender {
    [self check];
}

- (IBAction)tipAction:(id)sender {
    UIView *imageholder = [[UIView alloc] initWithFrame:CGRectMake(self.gridView.frame.origin.x, self.gridView.frame.origin.y, self.gridView.frame.size.width, self.gridView.frame.size.height)];
    [imageholder setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.8]];
    UIImage *tempImage = [self captureView:m_puzzleImage frame:CGRectMake(0,0, 280*m_scale, 350*m_scale)];
    UIImageView *toastView = [[UIImageView alloc] initWithImage:tempImage];
    [toastView setFrame:CGRectMake(0, 0, 280, 350)];
    [imageholder addSubview:toastView];
    [toastView setCenter:self.gridView.center];
    [self.view showToast:imageholder
                duration:2.0
                position:@"center"];
}

- (void)pickImage
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"从手机相册选择", nil];
    [actionSheet showInView:self.view];

}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch ( buttonIndex) {
        case 0 : // camera
        {
            long long freeDiskSpace = [self freeDiskSpaceInBytes];
            if (freeDiskSpace<10) {
                [self.gridView makeToast:@"您的手机内存已满，无法使用相机"];
                return;
            }
            else{
                UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
                imagePicker.allowsEditing = NO;
                [imagePicker setDelegate:self];
                imagePicker.videoQuality = UIImagePickerControllerQualityTypeLow;
                if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
                {
                    [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
                }
                
                [self presentViewController:imagePicker animated:YES completion:^{                }];
            }
            break;
        }
        case 1:
        {
            UIImagePickerController *albumController = [[UIImagePickerController alloc] init];
            albumController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [albumController setDelegate:self];
            [self presentViewController:albumController animated:YES completion:^{            }];
            break;
        }
        default:
            break;
    }
}

- (long long)freeDiskSpaceInBytes
{
    struct statfs buf;
    long long freespace = -1;
    if (statfs("/var", &buf) == 0) {
        freespace = (long long)(buf.f_bsize*buf.f_bfree)/1024/1024;
    }
    return freespace;
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    m_puzzleImage = [self scaleImage:[info objectForKey:@"UIImagePickerControllerOriginalImage"]];
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
    [self refresh];
    [self.gridView reloadData];
}

- (UIImage *)scaleImage:(UIImage *)image
{
    CGFloat ratio = image.size.width/image.size.height;
    image = [image scaleToSize:CGSizeMake(1050*ratio, 1050)];
    if (ratio>0.8) {
        m_scale = image.size.height/350;
    }
    else
    {
        m_scale = image.size.width/280;
    }
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width , image.size.height ));
    NSLog(@"height = %f , width = %f",image.size.height,image.size.width);
    [image drawInRect:CGRectMake(0, 0, image.size.width , image.size.height )];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

#pragma mark -
#pragma mark yaoyiyao
-(BOOL)canBecomeFirstResponder {
    return YES;
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated {
    [self resignFirstResponder];
    [super viewWillDisappear:animated];
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if (motion == UIEventSubtypeMotionShake)
    {
        // your code
        NSLog(@"end animations");
    }
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    
    if (motion == UIEventSubtypeMotionShake)
    {
        // your code
        [self randomMutableArray];
        NSLog(@"begin animations");
    }
}

- (void)startShakeAnimation
{
    CGFloat fOriginX = 0;
    [UIView animateWithDuration:0.2 animations:^{
        [self.gridView setFrame:CGRectMake(fOriginX-80, 0, self.gridView.frame.size.width, self.gridView.frame.size.height)];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.4 animations:^{
            [self.gridView setFrame:CGRectMake(fOriginX+80, 0, self.gridView.frame.size.width, self.gridView.frame.size.height)];
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.2 animations:^{
                [self.gridView setFrame:CGRectMake(fOriginX, 0, self.gridView.frame.size.width, self.gridView.frame.size.height)];
            } completion:^(BOOL finished) {
                
            }];
        }];
    }];
}
@end
