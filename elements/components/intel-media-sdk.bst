kind: cmake

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-cmake.bst

depends:
- freedesktop-sdk.bst:components/libva.bst

variables:
  cmake-local: >-
    -DENABLE_OPENCL=OFF
    -DENABLE_WAYLAND=OFF
    -DENABLE_X11=OFF
    -DENABLE_X11_DRI3=OFF
    -DBUILD_SAMPLES=OFF
    -DBUILD_TUTORIALS=OFF

public:
  bst:
    split-rules:
      runtime:
        (>):
        - "%{datadir}"
        - "%{datadir}/**"
        - "%{libdir}/mfx"
        - "%{libdir}/mfx/**"

sources:
- kind: git_repo
  url: github:Intel-Media-SDK/MediaSDK.git
  track: intel-mediasdk-23.2.2
  ref: 869b60a6c3d7b5e9f7c3b3b914986322dca4bbae
- kind: patch
  path: patches/intel-media-sdk/010-intel-media-sdk-fix-reproducible-build.patch
- kind: patch
  path: patches/intel-media-sdk/020-intel-media-sdk-gcc13-fix.patch
