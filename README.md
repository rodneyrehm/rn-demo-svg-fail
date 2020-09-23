# react-native-svg & babel-plugin-inline-import problmer

* react-native `0.63.2`
* react-native-svg `12.1.0`
* babel-plugin-inline-import `3.0.0`

| OS      | configuration | status |
| ------- | ------------- | ------ |
| Android | debug         | ✅ |
| Android | release       | ✅ |
| iOS     | debug         | ✅ |
| iOS     | release       | ❌ |

Fails with

```
PhaseScriptExecution Bundle React Native code and images

…

+ node /…/rninitsvg/node_modules/react-native/cli.js bundle --entry-file index.js --platform ios --dev false --reset-cache --bundle-output /Users/rodneyrehm/Library/Developer/Xcode/DerivedData/rninitsvg-dnbjzwgpwkmgpwgbdhqifdlsytlc/Build/Products/Release-iphonesimulator/rninitsvg.app/main.jsbundle --assets-dest /Users/rodneyrehm/Library/Developer/Xcode/DerivedData/rninitsvg-dnbjzwgpwkmgpwgbdhqifdlsytlc/Build/Products/Release-iphonesimulator/rninitsvg.app
warning: the transform cache was reset.
                 Welcome to React Native!
                Learn once, write anywhere


error App.js: /…/rninitsvg/ios/App.js: Path './test.svg' could not be found for '/…/rninitsvg/ios/App.js'. Run CLI with --verbose flag for more details.
Error: /…/rninitsvg/ios/App.js: Path './test.svg' could not be found for '/…/rninitsvg/ios/App.js'
    at Function.getContents (/…/rninitsvg/node_modules/babel-plugin-inline-import/build/helper.js:72:15)
    at PluginPass.exit (/…/rninitsvg/node_modules/babel-plugin-inline-import/build/index.js:25:46)
    at newFn (/…/rninitsvg/node_modules/@babel/traverse/lib/visitors.js:175:21)
    at NodePath._call (/…/rninitsvg/node_modules/@babel/traverse/lib/path/context.js:55:20)
    at NodePath.call (/…/rninitsvg/node_modules/@babel/traverse/lib/path/context.js:42:17)
    at NodePath.visit (/…/rninitsvg/node_modules/@babel/traverse/lib/path/context.js:101:8)
    at TraversalContext.visitQueue (/…/rninitsvg/node_modules/@babel/traverse/lib/context.js:112:16)
    at TraversalContext.visitMultiple (/…/rninitsvg/node_modules/@babel/traverse/lib/context.js:79:17)
    at TraversalContext.visit (/…/rninitsvg/node_modules/@babel/traverse/lib/context.js:138:19)

+ [[ false != true ]]
+ [[ ! -f /Users/rodneyrehm/Library/Developer/Xcode/DerivedData/rninitsvg-dnbjzwgpwkmgpwgbdhqifdlsytlc/Build/Products/Release-iphonesimulator/rninitsvg.app/main.jsbundle ]]
+ echo 'error: File /Users/rodneyrehm/Library/Developer/Xcode/DerivedData/rninitsvg-dnbjzwgpwkmgpwgbdhqifdlsytlc/Build/Products/Release-iphonesimulator/rninitsvg.app/main.jsbundle does not exist. This must be a bug with'
error: File /Users/rodneyrehm/Library/Developer/Xcode/DerivedData/rninitsvg-dnbjzwgpwkmgpwgbdhqifdlsytlc/Build/Products/Release-iphonesimulator/rninitsvg.app/main.jsbundle does not exist. This must be a bug with
+ echo 'React Native, please report it here: https://github.com/facebook/react-native/issues'
React Native, please report it here: https://github.com/facebook/react-native/issues
+ exit 2
```
