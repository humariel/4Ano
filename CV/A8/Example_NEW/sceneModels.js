//////////////////////////////////////////////////////////////////////////////
//
//  For instantiating the scene models.
//
//  J. Madeira - November 2018
//
//////////////////////////////////////////////////////////////////////////////

//----------------------------------------------------------------------------
//
//  Constructors
//


function emptyModelFeatures() {

	// EMPTY MODEL

	this.vertices = [];

	this.normals = [];

	// Transformation parameters

	// Displacement vector
	
	this.tx = 0.0;
	
	this.ty = 0.0;
	
	this.tz = 0.0;	
	
	// Rotation angles	
	
	this.rotAngleXX = 0.0;
	
	this.rotAngleYY = 0.0;
	
	this.rotAngleZZ = 0.0;	

	// Scaling factors
	
	this.sx = 1.0;
	
	this.sy = 1.0;
	
	this.sz = 1.0;		
	
	// Animation controls
	
	this.rotXXOn = true;
	
	this.rotYYOn = true;
	
	this.rotZZOn = true;
	
	this.rotXXSpeed = 1.0;
	
	this.rotYYSpeed = 1.0;
	
	this.rotZZSpeed = 1.0;
	
	this.rotXXDir = 1;
	
	this.rotYYDir = 1;
	
	this.rotZZDir = 1;
	
	// Material features
	
	this.kAmbi = [ 0.2, 0.2, 0.2 ];
	
	this.kDiff = [ 0.7, 0.7, 0.7 ];

	this.kSpec = [ 0.7, 0.7, 0.7 ];

	this.nPhong = 100;
}

function singleTriangleModel( ) {
	
	var triangle = new emptyModelFeatures();
	
	// Default model has just ONE TRIANGLE

	triangle.vertices = [

		// FRONTAL TRIANGLE
		 
		-0.3, -0.3,  0.3,
		 
		 0.3, -0.3,  0.3,
		 
		 0.3,  0.3,  0.3,
	];

	triangle.normals = [

		// FRONTAL TRIANGLE
		 
		 0.0,  0.0,  1.0,
		 
		 0.0,  0.0,  1.0,
		 
		 0.0,  0.0,  1.0,
	];

	return triangle;
}


function simpleCubeModel( ) {
	
	var cube = new emptyModelFeatures();
	
	cube.vertices = [

		-1.000000, -1.000000,  1.000000, 
		 1.000000,  1.000000,  1.000000, 
		-1.000000,  1.000000,  1.000000, 
		-1.000000, -1.000000,  1.000000,
		 1.000000, -1.000000,  1.000000, 
		 1.000000,  1.000000,  1.000000, 
         1.000000, -1.000000,  1.000000, 
		 1.000000, -1.000000, -1.000000, 
		 1.000000,  1.000000, -1.000000, 
         1.000000, -1.000000,  1.000000, 
         1.000000,  1.000000, -1.000000, 
         1.000000,  1.000000,  1.000000, 
        -1.000000, -1.000000, -1.000000, 
        -1.000000,  1.000000, -1.000000,
         1.000000,  1.000000, -1.000000, 
        -1.000000, -1.000000, -1.000000, 
         1.000000,  1.000000, -1.000000, 
         1.000000, -1.000000, -1.000000, 
        -1.000000, -1.000000, -1.000000, 
		-1.000000, -1.000000,  1.000000, 
		-1.000000,  1.000000, -1.000000, 
		-1.000000, -1.000000,  1.000000, 
		-1.000000,  1.000000,  1.000000, 
		-1.000000,  1.000000, -1.000000, 
		-1.000000,  1.000000, -1.000000, 
		-1.000000,  1.000000,  1.000000, 
		 1.000000,  1.000000, -1.000000, 
		-1.000000,  1.000000,  1.000000, 
		 1.000000,  1.000000,  1.000000, 
		 1.000000,  1.000000, -1.000000, 
		-1.000000, -1.000000,  1.000000, 
		-1.000000, -1.000000, -1.000000,
		 1.000000, -1.000000, -1.000000, 
		-1.000000, -1.000000,  1.000000, 
		 1.000000, -1.000000, -1.000000, 
		 1.000000, -1.000000,  1.000000, 	 
	];

	computeVertexNormals( cube.vertices, cube.normals );

	return cube;
}


function cubeModel( subdivisionDepth = 0 ) {
	
	var cube = new simpleCubeModel();
	
	midPointRefinement( cube.vertices, subdivisionDepth );
	
	computeVertexNormals( cube.vertices, cube.normals );
	
	return cube;
}


function simpleTetrahedronModel( ) {
	
	var tetra = new emptyModelFeatures();
	
	tetra.vertices = [

		-1.000000,  0.000000, -0.707000, 
         0.000000,  1.000000,  0.707000, 
         1.000000,  0.000000, -0.707000, 
         1.000000,  0.000000, -0.707000, 
         0.000000,  1.000000,  0.707000, 
         0.000000, -1.000000,  0.707000, 
        -1.000000,  0.000000, -0.707000, 
         0.000000, -1.000000,  0.707000, 
         0.000000,  1.000000,  0.707000, 
        -1.000000,  0.000000, -0.707000, 
         1.000000,  0.000000, -0.707000, 
         0.000000, -1.000000,  0.707000,
	];

	computeVertexNormals( tetra.vertices, tetra.normals );

	return tetra;
}


function tetrahedronModel( subdivisionDepth = 0 ) {
	
	var tetra = new simpleTetrahedronModel();
	
	midPointRefinement( tetra.vertices, subdivisionDepth );
	
	computeVertexNormals( tetra.vertices, tetra.normals );
	
	return tetra;
}


function sphereModel( subdivisionDepth = 4 ) {
	
	var sphere = new simpleCubeModel();
	
	midPointRefinement( sphere.vertices, subdivisionDepth );
	
	moveToSphericalSurface( sphere.vertices )
	
	computeVertexNormals( sphere.vertices, sphere.normals );
	
	return sphere;
}


//----------------------------------------------------------------------------
//
//  Instantiating scene models
//

var sceneModels = [];

// Model 0 --- Top Left Front

sceneModels.push( new sphereModel() );

sceneModels[0].tx = -0.5; sceneModels[0].ty = 0.5; sceneModels[0].tz = 0.5;

sceneModels[0].sx = sceneModels[0].sy = sceneModels[0].sz = 0.2;

// Model 1 --- Bottom Left Front

sceneModels.push( new sphereModel() );

sceneModels[1].tx = -0.5; sceneModels[1].ty = -0.5; sceneModels[1].tz = 0.5;

sceneModels[1].sx = sceneModels[1].sy = sceneModels[1].sz = 0.2;

// Model 2 --- Bottom Right Front

sceneModels.push( new sphereModel() );

sceneModels[2].tx = 0.5; sceneModels[2].ty = -0.5; sceneModels[2].tz = 0.5;

sceneModels[2].sx = sceneModels[2].sy = sceneModels[2].sz = 0.2;

// Model 3 --- Top Right Front

sceneModels.push( new sphereModel() );

sceneModels[3].tx = 0.5; sceneModels[3].ty = 0.5; sceneModels[3].tz = 0.5;

sceneModels[3].sx = sceneModels[3].sy = sceneModels[3].sz = 0.2;

// Model 4 --- Top Left Back

sceneModels.push( new sphereModel() );

sceneModels[4].tx = -0.3; sceneModels[4].ty = 0.3; sceneModels[4].tz = -0.3;

sceneModels[4].sx = sceneModels[4].sy = sceneModels[4].sz = 0.2;

// Model 5 --- Bottom Left Back

sceneModels.push( new sphereModel() );

sceneModels[5].tx = -0.3; sceneModels[5].ty = -0.3; sceneModels[5].tz = -0.3;

sceneModels[5].sx = sceneModels[5].sy = sceneModels[5].sz = 0.2;

// Model 6 --- Bottom Right Back

sceneModels.push( new sphereModel() );

sceneModels[6].tx = 0.3; sceneModels[6].ty = -0.3; sceneModels[6].tz = -0.3;

sceneModels[6].sx = sceneModels[6].sy = sceneModels[6].sz = 0.2;

// Model 7 --- Top Right Back

sceneModels.push( new sphereModel() );

sceneModels[7].tx = 0.3; sceneModels[7].ty = 0.3; sceneModels[7].tz = -0.3;

sceneModels[7].sx = sceneModels[7].sy = sceneModels[7].sz = 0.2;



