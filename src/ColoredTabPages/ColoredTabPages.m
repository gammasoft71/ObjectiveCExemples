#include <Cocoa/Cocoa.h>

@interface Form : NSWindow {
  NSTabViewItem* tabPageRed;
  NSTabViewItem* tabPageGreen;
  NSTabViewItem* tabPageBlue;
  NSTabViewItem* tabPageYellow;
  NSTabView* tabControl;
}
- (instancetype)init;
- (BOOL)windowShouldClose:(id)sender;
@end

@implementation Form
- (instancetype)init {
  NSTabViewItem* tabPageRed = [[NSTabViewItem alloc] init];
  [tabPageRed setLabel:@"Red"];
  [[tabPageRed view] setWantsLayer:YES];
  [[[tabPageRed view] layer] setBackgroundColor:[NSColor redColor].CGColor];

  tabPageGreen = [[NSTabViewItem alloc] init];
  [tabPageGreen setLabel:@"Green"];
  [[tabPageGreen view] setWantsLayer:YES];
  [[[tabPageGreen view] layer] setBackgroundColor:[NSColor greenColor].CGColor];

  tabPageBlue = [[NSTabViewItem alloc] init];
  [tabPageBlue setLabel:@"Blue"];
  [[tabPageBlue view] setWantsLayer:YES];
  [[[tabPageBlue view] layer] setBackgroundColor:[NSColor blueColor].CGColor];

  tabPageYellow = [[NSTabViewItem alloc] init];
  [tabPageYellow setLabel:@"Yellow"];
  [[tabPageYellow view] setWantsLayer:YES];
  [[[tabPageYellow view] layer] setBackgroundColor:[NSColor yellowColor].CGColor];

  tabControl = [[NSTabView alloc] initWithFrame:NSMakeRect(10, 10, 370, 250)];
  [tabControl insertTabViewItem:tabPageRed atIndex:0];
  [tabControl insertTabViewItem:tabPageGreen atIndex:1];
  [tabControl insertTabViewItem:tabPageBlue atIndex:2];
  [tabControl insertTabViewItem:tabPageYellow atIndex:3];

  [super initWithContentRect:NSMakeRect(100, 100, 390, 270) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO];
  [self setTitle:@"TabControl example"];
  [[self contentView] addSubview:tabControl];
  [self setIsVisible:YES];
  return self;
}

- (BOOL)windowShouldClose:(id)sender {
  [NSApp terminate:sender];
  return YES;
}
@end

int main(int argc, char* argv[]) {
  [NSApplication sharedApplication];
  [[[[Form alloc] init] autorelease] makeMainWindow];
  [NSApp run];
}
