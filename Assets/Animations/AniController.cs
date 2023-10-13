using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AniController : MonoBehaviour
{
    Animator animator;
    [Range(0,1)]
    public float Forward = 0;
    [Range(0, 1)]
    public float Turn = 0;
    // Start is called before the first frame update
    void Start()
    {
        animator = GetComponent<Animator>();
    }

    // Update is called once per frame
    void Update()
    {
        animator.SetFloat("Forward", Forward);
        animator.SetFloat("Turn", Turn);
    }
}
