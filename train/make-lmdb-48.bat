@echo off

title 如果是第一次执行，请先解压yzm-easy.rar然后再执行

set tips_info=0
if exist train_lmdb48 set tips_info=1

if %tips_info% == 1 (
    echo 确定要创建吗，这个操作会删掉已有目录的？，防止误操作把好不容易创建的删除掉啦
    pause
)


if exist train_lmdb48 rd /q /s train_lmdb48

rem 如果要设计图像尺寸的，比如，可以加参数--resize_width=224 --resize_height=224
rem 如果要讲输入图像弄成单通道灰度图，可以加参数--gray=true

echo 创建训练数据库train_lmdb48...
"F:\research\1.CCDL\CCDL\caffe-easy\windows-gpu\caffe\../../Build/gpu_cuda8.0/Release/x64/convert_imageset.exe" "" 48/label-train.txt train_lmdb48 --backend=mtcnn --shuffle=true

echo LMDB数据库创建完毕。
pause