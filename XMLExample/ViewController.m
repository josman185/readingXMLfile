//
//  ViewController.m
//  XMLExample
//
//  Created by MCS on 3/30/16.
//  Copyright © 2016 MCS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (privateMethods)
-(void)printXML;
@end


@implementation ViewController

@synthesize parser;
@synthesize currentElement;
@synthesize titleArray;
@synthesize yearArray;
@synthesize ratingArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.currentElement = [[NSString alloc]init];
    self.titleArray = [[NSMutableArray alloc] init];
    self.yearArray = [[NSMutableArray alloc] init];
    self.ratingArray = [[NSMutableArray alloc] init];
    
    NSString *pathString = [[NSBundle mainBundle] pathForResource:@"Games" ofType:@"xml"];
    
    NSData *gameData = [[NSData alloc] initWithContentsOfFile:pathString];
    
    self.parser = [[NSXMLParser alloc] initWithData:gameData];
    
    self.parser.delegate = self;
    
    [self.parser parse];
    
    [self printXML];
}

-(void) printXML
{
    for (int i = 0; i<[self.ratingArray count]; i++) {
        NSString *title  = [self.titleArray objectAtIndex:i];
        NSString *year   = [self.yearArray objectAtIndex:i];
        NSString *rating = [self.ratingArray objectAtIndex:i];
        
        NSLog(@"\n Title: %@ \n Year: %d\n Rating: %@",title,[year intValue],rating);
    }
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:@"Game"])
    {
        NSString *gameTitle = [attributeDict objectForKey:@"Title"];
        [self.titleArray addObject:gameTitle];
        
        NSNumber *gameYear = [attributeDict objectForKey:@"Year"];
        [self.yearArray addObject:gameYear];
    }
    self.currentElement = elementName;
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if ([self.currentElement isEqualToString:@"Game"])
    {
        [self.ratingArray addObject:string];
    }
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    self.currentElement = @"";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
