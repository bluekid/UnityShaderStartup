using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class TextureLerp : MonoBehaviour
{
    [SerializeField]
    private MeshRenderer _renderMesh = null;

    private Material _material = null;
    private float _lerpValue = 0.0f;
    private float _lerpTIme = 0.0f;
    private bool _isPlus = true;

    // Start is called before the first frame update
    void Start()
    {
        _material = _renderMesh.GetComponent<Material>();
        _isPlus = true;
    }

	// Update is called once per frame
	void Update()
    {
        if ( _renderMesh == null )
            return;

        if ( _material == null )
        {
            List<Material> m = new List<Material>();
            _renderMesh.GetMaterials( m );
            if ( m.Count > 0 )
                _material = m[0];
        }

        if ( _material == null )
            return;

        if ( _lerpValue >= 1.0f )
        {
            _isPlus = false;
            _lerpTIme = 0.0f;
        }

        if ( _lerpValue <= 0.0f )
        {
            _isPlus = true;
            _lerpTIme = 0.0f;
        }
        
        _lerpTIme += Time.deltaTime;

        if ( _isPlus )
		{
            _lerpValue = Mathf.Lerp( 0, 1, _lerpTIme );
        }
        else
		{
            _lerpValue = Mathf.Lerp( 1, 0, _lerpTIme );
        }

        _material.SetFloat( "_lerpValue", _lerpValue );
    }
}
