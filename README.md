# DPlayer
基于ijkPlayer的iOS多功能播放器

```
git submodule update --init


cd DPlayer
git submodule add git@github.com:Bilibili/ijkplayer.git

cd jkplayer/config/
rm module.sh
ln -s module-default.sh module.sh
cd ..
rm -rf android/
cd ios
sh compile-ffmpeg.sh clean
cd ..
git checkout -B latest k0.5.0
./init-ios.sh
cd ios
./compile-ffmpeg.sh clean
./compile-ffmpeg.sh all
```

完成：

本地视频播放


TODO:

1.字幕

2.观看直播


