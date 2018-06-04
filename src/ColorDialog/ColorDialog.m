#include <Cocoa/Cocoa.h>

@interface Form : NSWindow {
  NSButton* buttonShowMessage;
}
- (IBAction) OnButtonClick:(id)sender;
- (void)changeColor:(id)sender;
- (BOOL)windowShouldClose:(id)sender;
@end

@implementation Form
- (instancetype)init {
  buttonShowMessage = [[[NSButton alloc] initWithFrame:NSMakeRect(10, 265, 100, 32)] autorelease];
  [buttonShowMessage setTitle:@"colors"];
  [buttonShowMessage setBezelStyle:NSBezelStyleRounded];
  [buttonShowMessage setTarget:self];
  [buttonShowMessage setAction:@selector(OnButtonClick:)];
  [buttonShowMessage setAutoresizingMask:NSViewMaxXMargin | NSViewMinYMargin];

  [super initWithContentRect:NSMakeRect(100, 100, 300, 300) styleMask:NSWindowStyleMaskTitled | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable backing:NSBackingStoreBuffered defer:NO];
  [self setTitle:@"ColorDialog example"];
  [[self contentView] addSubview:buttonShowMessage];
  [self setIsVisible:YES];
  return self;
}

- (IBAction) OnButtonClick:(id)sender {
  NSColorPanel* colorDialog = [NSColorPanel sharedColorPanel];
  [colorDialog setIsVisible:YES];
  [colorDialog setColor:[self backgroundColor]];
  [colorDialog setAction:@selector(changeBackgroundColor:)];
}

- (void)changeColor:(id)sender {
  [self setBackgroundColor:[(NSColorPanel*)sender color]];
}

- (BOOL)windowShouldClose:(id)sender {
  [NSApp terminate:sender];
  return NO;
}
@end

int main(int argc, char* argv[]) {

  [NSApplication sharedApplication];
  [[[[Form alloc] init] autorelease] makeMainWindow];
  [NSApp run];
}
