#!/bin/bash

###############################################################################
# A bug in react-native-xcode.sh of react-native version 0.63.2 prevents
# babel-plugin-inline-import to work during bundling of iOS Release builds
# see https://github.com/facebook/react-native/pull/29477
###############################################################################

TARGET="node_modules/react-native/scripts/react-native-xcode.sh"

read -r -d '' PATCH << "EndOfPatch"
diff --git a/react-native-xcode.sh b/react-native-xcode.sh
index 328085f..da9e44c 100644
--- a/react-native-xcode.sh
+++ b/react-native-xcode.sh
@@ -54,17 +54,11 @@ case "$CONFIGURATION" in
     ;;
 esac
 
-# Setting up a project root was a workaround to enable support for non-standard
-# structures, including monorepos. Today, CLI supports that out of the box
-# and setting custom `PROJECT_ROOT` only makes it confusing. 
-#
-# As a backwards-compatible change, I am leaving "PROJECT_ROOT" support for those
-# who already use it - it is likely a non-breaking removal.
-#
-# For new users, we default to $PWD - not changing things all.
-#
-# For context: https://github.com/facebook/react-native/commit/9ccde378b6e6379df61f9d968be6346ca6be7ead#commitcomment-37914902
-PROJECT_ROOT=${PROJECT_ROOT:-$PWD}
+# Path to react-native folder inside node_modules
+REACT_NATIVE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
+# The project should be located next to where react-native is installed
+# in node_modules.
+PROJECT_ROOT=${PROJECT_ROOT:-"$REACT_NATIVE_DIR/../.."}
 
 cd "$PROJECT_ROOT" || exit
 
@@ -102,9 +96,6 @@ if [[ ! -x node && -d ${HOME}/.anyenv/bin ]]; then
   fi
 fi
 
-# Path to react-native folder inside node_modules
-REACT_NATIVE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
-
 # check and assign NODE_BINARY env
 # shellcheck source=/dev/null
 source "$REACT_NATIVE_DIR/scripts/node-binary.sh"

EndOfPatch

echo "looking at ${TARGET}"
if ! patch --unified --reverse --dry-run --quiet --force "${TARGET}" >/dev/null <<< "${PATCH}"; then
  echo "patch not yet applied"
  patch --unified --forward "${TARGET}" <<< "${PATCH}"
else
  echo "patch was already applied"
fi
