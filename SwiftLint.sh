SWIFTLINT="${PODS_ROOT}/SwiftLint/swiftlint"

if which $SWIFTLINT >/dev/null; then
    $SWIFTLINT
else
echo "warning: SwiftLint not founded "
fi

