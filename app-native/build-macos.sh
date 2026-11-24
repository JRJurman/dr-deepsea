mkdir -p native/macos

clang -dynamiclib -fobjc-arc -fPIC -fvisibility=hidden \
  -arch arm64 -arch x86_64 \
  -isystem ../include -I app-native \
  app-native/ext.c \
  app-native/eclair/eclair.c \
  app-native/eclair/eclair_apple.m \
  -framework AppKit -framework AVFoundation -framework Foundation \
  -o native/macos/ext.dylib
