# script to trigger swift-format automatically when editing this project's source files.
# Created by scholar-of-artifice on 27/09/2026.

# Target specific source folder to avoid formatting third-party dependencies
SOURCE_DIRECTORIES=(
    "${SRCROOT}/ToyDataBinaryClassifierFactory"
    "${SRCROOT}/ToyDataBinaryClassifierFactoryApp"
    "${SRCROOT}/ToyDataBinaryClassifierFactoryTests"
    "${SRCROOT}/ToyDataBinaryClassifierFactoryAppTests"
    "${SRCROOT}/ToyDataBinaryClassifierFactoryAppUITests"
)

# check for swift-format first
if ! xcrun --find swift-format &> /dev/null; then
    echo "error: swift-format not found in the active toolchain."
    exit 1
fi

for SOURCE_DIRECTORY in "${SOURCE_DIRECTORIES[@]}"; do
    # check if the source directory exists
    if [  ! -d "${SOURCE_DIRECTORY}" ]; then
        echo "error: source directory not found at ${SOURCE_DIRECTORY}"
        echo "---- check your SOURCE_DIRECTORY path."
        exit 1
    fi
    # check if the directory actually contains swift files
    if [  -z "$(find "${SOURCE_DIRECTORY}" -name '*.swift' -print -quit 2>/dev/null)" ]; then
        echo "error: no .swift files found in ${SOURCE_DIRECTORY}"
        echo "---- nothing to format."
        exit 1
    fi
    # must be good. try to format things
    echo "formatting swift code..."
    xcrun swift-format format --in-place --recursive "${SOURCE_DIRECTORY}"
done
