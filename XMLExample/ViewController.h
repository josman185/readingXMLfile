//
//  ViewController.h
//  XMLExample
//
//  Created by MCS on 3/30/16.
//  Copyright © 2016 MCS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <NSXMLParserDelegate>

@property (strong,nonatomic) NSXMLParser    *parser;
@property (strong,nonatomic) NSString       *currentElement;
@property (strong,nonatomic) NSMutableArray *titleArray;
@property (strong,nonatomic) NSMutableArray *yearArray;
@property (strong,nonatomic) NSMutableArray *ratingArray;

@end

