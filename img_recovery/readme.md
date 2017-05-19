# 图像恢复（matlab）


## 目标

给定一张受损图，将其尽可能恢复为原图。

* 受损图：
	* PNG格式
	* 受损方式：每通道每行按p（通常为0.4，0.6,0.8）的概率，将像素变为0
	
* 尽可能：
	* 恢复图和原图的Frobenius范数
	

## 方法

* 局部线性回归
* 局部距离平方反比插值
* 克里金插值
* 高斯滤波（不作为独立方法，叠加在上述三种方法上）


## 运行方式

1. 将受损图片命名为“名称_受损比.png”的格式，并放到/code/img目录下
2. 打开main.m，在源代码里将
	* file参数修改为受损图片名称（如‘D’）
	* rate参数修改为受损比（如0.4）
	* mode参数修改为方法标号（1对应生成受损图，2对应局部线性回归法，3对应局部距离平方反比插值法，4对应局部克里金插值法）
3. 运行
4. 在/code/img目录下查看结果，恢复图命名格式为“名称_受损比_方法.png”


## 参考资料

* 《克里金(Kriging)插值的原理与公式推导》, http://blog.csdn.net/tsroad/article/details/50205373
* Mathwork开源代码：kriging.m，variogram.m，variogramfit.m，fminsearchbnd.m，fminsearchcon.m
