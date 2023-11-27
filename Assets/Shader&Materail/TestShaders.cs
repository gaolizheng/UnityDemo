using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;


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
