
## shader_feature 与 multi_compile 的区别
创建分别使用 shader_feature 和 multi_compile 的shader
```shader
Shader "Unlit/TestShaderFeature"
{
    Properties
    {
        [Toggle(SHOW_RED)] SHOW_RED ("SHOW_RED", Integer) = 0
    }

    ...

    #pragma shader_feature SHOW_RED

    ...

    fixed4 frag (v2f i) : SV_Target
    {
        fixed4 col = fixed4(1,1,1,1);
        #if SHOW_RED
        col = fixed4(1,0,0,1);
        #endif
        return col;
    }

    ...
}
```

```shader
Shader "Unlit/TestMultiCompile"
{
    Properties
    {
        [Toggle(SHOW_RED)] SHOW_RED ("SHOW_RED", Integer) = 0
    }

    ...

    #pragma multi_compile __ SHOW_RED

    ...

    fixed4 frag (v2f i) : SV_Target
    {
        fixed4 col = fixed4(1,1,1,1);
        #if SHOW_RED
        col = fixed4(1,0,0,1);
        #endif
        return col;
    }

    ...
}
```

写一个组件，在运行时通过点击按钮分别开启或关闭材质中的 SHOW_RED
```C#
public class TestShaders : MonoBehaviour
{
    public MeshRenderer shaderFeature;
    public MeshRenderer multiCompile;

    Material _shaderFeature;
    Material _multiCompile;
    const string shaderKeyWord = "SHOW_RED";

    void Start()
    {
        _shaderFeature = shaderFeature.material;
        _multiCompile = multiCompile.material;
    }

    public void OnRed()
    {
        _shaderFeature.EnableKeyword(shaderKeyWord);
        _multiCompile.EnableKeyword(shaderKeyWord);
    }

    public void OnWhite()
    {
        _shaderFeature.DisableKeyword(shaderKeyWord);
        _multiCompile.DisableKeyword(shaderKeyWord);
    }
}
```

这是Editor中运行时的效果

![image](https://github.com/gaolizheng/UnityDemo/blob/main/Pics/Shader&Material/TestShader_Editor.gif)

可以看到这时使用 shader_feature 和 multi_compile 的效果是一样的。但是当运行构建后的程序时

![image](https://github.com/gaolizheng/UnityDemo/blob/main/Pics/Shader&Material/TestShader_Run.gif)

使用 shader_feature 的材质不生效了。观察可以发现 使用 shader_feature 要比使用 multi_compile 变体要少

![image](https://github.com/gaolizheng/UnityDemo/blob/main/Pics/Shader&Material/TestFeatureShader_Variants.png)

![image](https://github.com/gaolizheng/UnityDemo/blob/main/Pics/Shader&Material/TestMultiCompile_Variants.png)

这也就是为什么使用 shader_feature 无法在运行时切换颜色的原因，它只有一个变体，假如我们在材质Inspector窗口中勾选 SHOW_RED，此时变体数量就会变成2

![image](https://github.com/gaolizheng/UnityDemo/blob/main/Pics/Shader&Material/TestFeatureShader_Variants2.png)

也就是说当使用 shader_feature 时，会在编译Shader时根据材质中相应参数的使用情况来决定是否编译不同变体，不勾选 SHOW_RED，只会编译不使用的变体，当勾选了 SHOW_RED 会编译使用与不使用两个变体，因此这更适合美术同学去使用，如果需要在程序中动态修改就需要使用 multi_compile.


