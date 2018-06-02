#include <Cocoa/Cocoa.h>

@interface Form : NSWindow {
  NSScrollView* panel1;
  NSScrollView* panel2;
}
- (instancetype)init;
- (BOOL)windowShouldClose:(id)sender;
@end

@implementation Form
- (instancetype)init {
  panel1 = [[NSScrollView alloc] initWithFrame:NSMakeRect(10, 10, 305, 460)];
  [panel1 setBorderType:NSLineBorder];
  
  panel2 = [[NSScrollView alloc] initWithFrame:NSMakeRect(325, 10, 305, 460)];
  [panel2 setBorderType:NSBezelBorder];

  [super initWithContentRect:NSMakeRect(100, 100, 640, 480) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO];
  [self setTitle:@"Panel example"];
  [[self contentView] addSubview:panel1];
  [[self contentView] addSubview:panel2];
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