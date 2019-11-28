//the base of this file is what was given in classes
//new things were added for the project 
//and some things were changed

function lightSource(){
	this.intensity = [];
	this.position = [];
}


function emptyModelFeatures(tx,ty,tz,sx,sy,sz) {

	// EMPTY MODEL

	this.vertices = [];

	this.normals = [];

	this.color = [];
	this.colors = [];

	this.tx = tx;
	this.ty = ty;
	this.tz = tz;

	this.initSize = 0;
	
	// Rotation angles	
	
	this.rotAngleXX = 0.0;
	
	this.rotAngleYY = 0.0;
	
	this.rotAngleZZ = 0.0;	
	
	this.sx = sx;
	this.sy = sy;
	this.sz = sz;		
	
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
	
	this.kAmbi = [ 0.8, 0.8, 0.8 ];
	
	this.kDiff = [ 0.7, 0.7, 0.7 ];

	this.kSpec = [ 0.7, 0.7, 0.7 ];

	this.nPhong = 100;

	this.hasRays = false;
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


function simpleCubeModel(tx,ty,tz,sx,sy,sz) {
	
	var cube = new emptyModelFeatures(tx,ty,tz,sx,sy,sz);
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

function sphereModel(tx,ty,tz,sx,sy,sz, subdivisionDepth = 5 , color) {
	
	var sphere = new simpleCubeModel(tx,ty,tz,sx,sy,sz);
	sphere.color = color;

	midPointRefinement( sphere.vertices, subdivisionDepth );
	
	moveToSphericalSurface( sphere.vertices )
	//translaçao e escalar
	for(var i=0; i<sphere.vertices.length; i+=3){
		sphere.vertices[i] *= sphere.sx;
		sphere.vertices[i] += sphere.tx;
		sphere.vertices[i+1] *= sphere.sy;
		sphere.vertices[i+1] += sphere.ty;
		sphere.vertices[i+2] *= sphere.sz;
		sphere.vertices[i+2] += sphere.tz;
	}
	computeSimpleColor(sphere.vertices, sphere.colors, sphere.color)
	computeVertexNormals( sphere.vertices, sphere.normals );
	sphere.initSize = sphere.vertices.length;
	return sphere;
}


function squareModel(tx,ty,tz,sx,sy,sz, floor=false, color=[]) {
	
	var square = new emptyModelFeatures(tx,ty,tz,sx,sy,sz);
	
	square.vertices = [
		//surface - bottom square
		1.0 , 0.0, 1.0, 
		1.0 , 0.0, -1.0, 
		-1.0 , 0.0, -1.0,
		1.0 , 0.0, 1.0, 
		-1.0 , 0.0, -1.0,
		-1.0 , 0.0, 1.0,
	];
	if(floor){
		square.color = color;
		midPointRefinement(square.vertices, 3);
		//translaçao e escalar
		for(var i=0; i<square.vertices.length; i+=3){
			square.vertices[i] *= square.sx;
			square.vertices[i] += square.tx;
			square.vertices[i+1] *= square.sy;
			square.vertices[i+1] += square.ty;
			square.vertices[i+2] *= square.sz;
			square.vertices[i+2] += square.tz;
		}
	}
	computeSimpleColor(square.vertices, square.colors, color)
	computeVertexNormals( square.vertices, square.normals );
	square.initSize = square.vertices.length;
	return square;
}

function coneModel(tx,ty,tz,sx,sy,sz, subdivisionDepth = 5, color) {

	var cone = new squareModel(tx,ty,tz,sx,sy,sz, false);
	cone.color = color;
	midPointRefinement(cone.vertices, subdivisionDepth);
	moveToSphericalSurface(cone.vertices);	
	cone.vertices = createCone(cone.vertices);
	//translaçao e escalar
	for(var i=0; i<cone.vertices.length; i+=3){
		cone.vertices[i] *= cone.sx;
		cone.vertices[i] += cone.tx;
		cone.vertices[i+1] *= cone.sy;
		cone.vertices[i+1] += cone.ty;
		cone.vertices[i+2] *= cone.sz;
		cone.vertices[i+2] += cone.tz;
	}
	computeSimpleColor(cone.vertices, cone.colors, cone.color)
	computeVertexNormals( cone.vertices, cone.normals );
	cone.initSize = cone.vertices.length;
	return cone;
}

function createCone(arr) {
	var result = [];

	for(var i=0; i<arr.length; i+=6){
		result.push(...arr.slice(i, i+3));
		result.push(...arr.slice(i+3, i+6));
		result.push(...[0.0, 2, 0.0]);
	}
	return result;
}

//----------------------------------------------------------------------------
//
//  Instantiating scene models
//

var sceneModels = [];

// Cone 

sceneModels.push( new coneModel(0.0,-1.4,-4, 0.4,0.4,0.4, 4, [0.0, 1.0, 0.0]) );
sceneModels[0].hasRays = false;

// Sphere 1 

sceneModels.push( new sphereModel(-0.8,0.8,-6.5, 0.25,0.25,0.25, 3, [0.2, 0.8, 0.3]) );
sceneModels[1].hasRays = true;

//Sphere 2

sceneModels.push(new sphereModel(0.8, 0.0,-6.5, 0.45,0.45,0.45, 3, [1, 0.84, 0.37]));
sceneModels[2].hasRays = true;

//Floor
sceneModels.push(new squareModel(0.0,-0.6,-6.0, 1.5,1.5,1.5, true, [0.8,0.8,0.8]));
sceneModels[3].hasRays = true;



