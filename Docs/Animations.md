
动画资源来自于:https://www.mixamo.com/

![Image text](https://github.com/gaolizheng/UnityDemo/blob/master/Pics/Animations/animation-res.png)

## BlendTree

![image](https://github.com/gaolizheng/UnityDemo/blob/master/Pics/Animations/Animation-1d.gif)

![image](https://github.com/gaolizheng/UnityDemo/blob/master/Pics/Animations/Animation-2d.gif)

![Image text](https://github.com/gaolizheng/UnityDemo/blob/master/Pics/Animations/Animations-mir.png)

可以通过勾选 mirror animation 属性来添加镜像动画

## 位移和旋转
通过代码和动画都可以控制角色的位移和旋转，当勾选 Animator 组件的<a href="https://docs.unity.cn/cn/2021.3/Manual/class-Animator.html#:~:text=%E8%BF%9B%E8%A1%8C%E5%8A%A8%E7%94%BB%E5%8C%96%EF%BC%89-,Apply%20Root%20Motion,-%E9%80%89%E6%8B%A9%E4%BB%8E%E5%8A%A8%E7%94%BB">Apply Root Motion 属性</a>时，就可以把动画本身的位移和旋转作用到角色身上。在Clip的属性面板可以查看到动画的位移和旋转数值。

![Image text](https://github.com/gaolizheng/UnityDemo/blob/master/Pics/Animations/Animation-clip-property.png)

![image](https://github.com/gaolizheng/UnityDemo/blob/master/Pics/Animations/Animation-ApplyRootMotion.gif)