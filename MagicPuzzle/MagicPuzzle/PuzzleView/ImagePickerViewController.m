//
//  ImagePickerViewController.m
//  MagicPuzzle
//
//  Created by broy denty on 14-4-21.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "ImagePickerViewController.h"
#import "AWCollectionViewDialLayout.h"
#import "ImagePickerCollectionCell.h"
@interface ImagePickerViewController ()
{
    UICollectionView *m_collectionView;
    AWCollectionViewDialLayout *m_dialLayout;
}
@end

@implementation ImagePickerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        m_dialLayout = [[AWCollectionViewDialLayout alloc] initWithRadius:390 andAngularSpacing:14.4 andCellSize:CGSizeMake(100, 100) andAlignment:WHEELALIGNMENTCENTER andItemHeight:100 andXOffset:73];
        m_collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 320, 300) collectionViewLayout:m_dialLayout];
        [m_collectionView setBackgroundColor:[UIColor blackColor]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:m_collectionView];
//    m_dialLayout = [[AWCollectionViewDialLayout alloc] initWithRadius:390 andAngularSpacing:14.4 andCellSize:CGSizeMake(100, 100) andAlignment:WHEELALIGNMENTCENTER andItemHeight:100 andXOffset:73];
//    [m_collectionView setCollectionViewLayout:m_dialLayout];
    [m_collectionView setDataSource:self];
    [m_collectionView setDelegate:self];
    [m_collectionView registerNib:[UINib nibWithNibName:@"ImagePickerCollectionCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"ImagePickerCollectionCell"];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 1;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ImagePickerCollectionCell *cell;
//    if(type == 0){
    cell = (ImagePickerCollectionCell *)[cv dequeueReusableCellWithReuseIdentifier:@"ImagePickerCollectionCell" forIndexPath:indexPath];
//    }else{
//        cell = [cv dequeueReusableCellWithReuseIdentifier:cellId2 forIndexPath:indexPath];
//    }
    [cell.imageStackView setImage:[UIImage imageNamed:@"test"]];
    
//    NSDictionary *item = [self.items objectAtIndex:indexPath.item];
    
//    NSString *playerName = [item valueForKey:@"name"];
//    UILabel *nameLabel = (UILabel*)[cell viewWithTag:101];
//    [nameLabel setText:playerName];
//    
//    
//    NSString *hexColor = [item valueForKey:@"team-color"];
//    NSString *hexColor = @"#148af7";
//
//    
//    if(type == 0){
//        UIView *borderView = [cell viewWithTag:102];
//        
//        borderView.layer.borderWidth = 1;
//        borderView.layer.borderColor = [self colorFromHex:hexColor].CGColor;
//        
//        NSString *imgURL = [item valueForKey:@"picture"];
//        UIImageView *imgView = (UIImageView*)[cell viewWithTag:100];
//        [imgView setImage:nil];
//        __block UIImage *imageProduct = [thumbnailCache objectForKey:imgURL];
//        if(imageProduct){
//            imgView.image = imageProduct;
//        }
//        else{
//            dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
//            dispatch_async(queue, ^{
//                UIImage *image = [UIImage imageNamed:imgURL];
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    imgView.image = image;
//                    [thumbnailCache setValue:image forKey:imgURL];
//                });
//            });
//        }
//    
//    }else{
//        nameLabel.textColor = [self colorFromHex:hexColor];
//    }
    
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"didEndDisplayingCell:%i", (int)indexPath.item);
}

#pragma mark - UICollectionViewDelegate methods
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(240, 100);
}


- (UIEdgeInsets)collectionView:
(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0 , 0, 0, 0);
}

- (unsigned int)intFromHexString:(NSString *)hexStr
{
    unsigned int hexInt = 0;
    // Create scanner
    NSScanner *scanner = [NSScanner scannerWithString:hexStr];
    // Tell scanner to skip the # character
    [scanner setCharactersToBeSkipped:[NSCharacterSet characterSetWithCharactersInString:@"#"]];
    // Scan hex value
    [scanner scanHexInt:&hexInt];
    return hexInt;
}

-(UIColor*)colorFromHex:(NSString*)hexString{
    unsigned int hexint = [self intFromHexString:hexString];
    
    // Create color object, specifying alpha as well
    UIColor *color =
    [UIColor colorWithRed:((CGFloat) ((hexint & 0xFF0000) >> 16))/255
                    green:((CGFloat) ((hexint & 0xFF00) >> 8))/255
                     blue:((CGFloat) (hexint & 0xFF))/255
                    alpha:1];
    
    return color;
}

@end
