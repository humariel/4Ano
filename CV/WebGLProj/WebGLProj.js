
var gl = null; // WebGL context

var shaderProgram = null;
var shader_lines = null;

var triangleVertexPositionBuffer = null;
var triangleVertexColorBuffer = null;	

var linesVertexPositionBuffer = null;
var linesVertexColorBuffer = null;

// To allow choosing the way of drawing the model triangles

var primitiveType = null;
 
// To allow choosing the projection type

var projectionType = 1;

// NEW --- The viewer position

// It has to be updated according to the projection type

var pos_Viewer = [ 0.0, 0.0, 0.0, 1.0 ];

var light = new lightSource();
light.intensity = [0.4,0.4,0.8];
light.position = [-0.8, 2, -6.5];

var light2 = new lightSource();
light2.intensity = [0.9,0.2,0.2];
light2.position = [0.8, 2, -6.5];

//light

sceneModels.push(new sphereModel(light.position[0], light.position[1],light.position[2], 0.15,0.15,0.15, 3, light.intensity));
sceneModels[4].hasRays = false;

//light 2

sceneModels.push(new sphereModel(light2.position[0], light2.position[1],light2.position[2], 0.15,0.15,0.15, 3, light2.intensity));
sceneModels[5].hasRays = false;

var divFactor = 200;
var animateFlag = false;
var stop = false;
var lastCount = 0;

//----------------------------------------------------------------------------
//
// NEW - To count the number of frames per second (fps)
//

var elapsedTime = 0;

var frameCount = 0;

var lastfpsTime = new Date().getTime();;


function countFrames() {
	
   var now = new Date().getTime();

   frameCount++;
   
   elapsedTime += (now - lastfpsTime);

   lastfpsTime = now;

   if(elapsedTime >= 1000) {
	   
       fps = frameCount;
       
       frameCount = 0;
       
       elapsedTime -= 1000;
	   
	   document.getElementById('fps').innerHTML = 'fps:' + fps;
   }
}

function initBuffers( model ) {	
	
	// Vertex Coordinates
		
	triangleVertexPositionBuffer = gl.createBuffer();
	gl.bindBuffer(gl.ARRAY_BUFFER, triangleVertexPositionBuffer);
	gl.bufferData(gl.ARRAY_BUFFER, new Float32Array(model.vertices), gl.STATIC_DRAW);
	triangleVertexPositionBuffer.itemSize = 3;
	triangleVertexPositionBuffer.numItems =  model.vertices.length / 3;			

	// Associating to the vertex shader
	
	gl.vertexAttribPointer(shaderProgram.vertexPositionAttribute, 
			triangleVertexPositionBuffer.itemSize, 
			gl.FLOAT, false, 0, 0);
	
	// Colors
		
	triangleVertexColorBuffer = gl.createBuffer();
	gl.bindBuffer(gl.ARRAY_BUFFER, triangleVertexColorBuffer);
	gl.bufferData(gl.ARRAY_BUFFER, new Float32Array(model.colors), gl.STATIC_DRAW);
	triangleVertexColorBuffer.itemSize = 3;
	triangleVertexColorBuffer.numItems = model.colors.length / 3;			

	// Associating to the vertex shader
	
	gl.vertexAttribPointer(shaderProgram.vertexColorAttribute, 
			triangleVertexColorBuffer.itemSize, 
			gl.FLOAT, false, 0, 0);



}

//----------------------------------------------------------------------------

//  Drawing the model

function drawModel( model,
					mvMatrix,
					primitiveType ) {
    
						 
	// Passing the Model View Matrix to apply the current transformation
	
	var mvUniform = gl.getUniformLocation(shaderProgram, "uMVMatrix");
	
	gl.uniformMatrix4fv(mvUniform, false, new Float32Array(flatten(mvMatrix)));
	
	//the viewer eye position/camera position is any 3rd point in cone vertices which is the tip of the cone
	//create rays to then fill the buffers
	var cameraPos = sceneModels[0].vertices.slice(6,9);
	var count = 0;

	if(model.vertices.length <= model.initSize*divFactor){
		count = computeRays(light, light2, model, cameraPos, model.hasRays && animateFlag, divFactor);
	}
	if(count > lastCount)
		lastCount = count;
	initBuffers(model);
        
	// Drawing 
	if( primitiveType == gl.LINE_LOOP ) {	
		var i;
		for( i = 0; i < triangleVertexPositionBuffer.numItems / 3; i++ ) {
			gl.drawArrays( primitiveType, 3 * i, 3 ); 
		}
	}	
	else {
		//if model has rays we need to handle that
		if(model.hasRays && animateFlag){
			gl.drawArrays(primitiveType, 0, triangleVertexPositionBuffer.numItems-lastCount*3); 
			for( i = 0; i < lastCount; i++ ) {
				gl.drawArrays( gl.LINE_LOOP, i*3 + (triangleVertexPositionBuffer.numItems-lastCount*3), 3 ); 
			}
			//gl.drawArrays(gl.LINE_LOOP, triangleVertexPositionBuffer.numItems-count*3, count*3);
		}else{
			gl.drawArrays(primitiveType, 0, triangleVertexPositionBuffer.numItems); 
		}	
	}	
}

function drawScene() {
	
	var pMatrix;
	
	var mvMatrix = mat4();
	
	// Clearing the frame-buffer and the depth-buffer
	gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
	
	// Computing the Projection Matrix
	if( projectionType == 0 ) {
		// For now, the default orthogonal view volume
		pMatrix = ortho( -1.0, 1.0, -1.0, 1.0, -1.0, 1.0 );
	}
	else {	
		pMatrix = perspective( 45, 1, 0.05, 10 );
	}
	
	// Passing the Projection Matrix to apply the current projection
	var pUniform = gl.getUniformLocation(shaderProgram, "uPMatrix");
	gl.uniformMatrix4fv(pUniform, false, new Float32Array(flatten(pMatrix)));	
	
	for(var i = 0; i < sceneModels.length; i++ )
	{ 
		drawModel( sceneModels[i],
			   mvMatrix,
			   primitiveType, i );
	}       	
	countFrames();
}


var lastTime = 0;

function animate() {
	
	var timeNow = new Date().getTime();
	
	lastTime = timeNow;
}


//----------------------------------------------------------------------------

// Timer

function tick() {
	
	requestAnimFrame(tick);
	
	drawScene();
	
	animate();
}
//----------------------------------------------------------------------------

function setEventListeners(){    

	// Dropdown list
	
	var list = document.getElementById("rendering-mode-selection");
	
	list.addEventListener("click", function(){
				
		// Getting the selection
		
		var mode = list.selectedIndex;
				
		switch(mode){
			
			case 0 : primitiveType = gl.TRIANGLES;
				break;
			
			case 1 : primitiveType = gl.LINE_LOOP;
				break;
			
			case 2 : primitiveType = gl.POINTS;
				break;
		}
	}); 
	
	var button = document.getElementById("animate");
	button.addEventListener('click', ()=>{
		if(animateFlag) animateFlag = false;
		else animateFlag = true;
	})
	////////////////////////////LIGHT 1//////////////////////////
	//x+
	var button = document.getElementById("x+");
	button.addEventListener('click', ()=>{
		light.position[0] += 0.1;
		//translaçao e escalar
		for(var i=0; i<sceneModels[4].vertices.length; i+=3){
			sceneModels[4].vertices[i] += 0.1;
		}
	})
	//x-
	var button = document.getElementById("x-");
	button.addEventListener('click', ()=>{
		light.position[0] -= 0.1;
		//translaçao e escalar
		for(var i=0; i<sceneModels[4].vertices.length; i+=3){
			sceneModels[4].vertices[i] -= 0.1;
		}
	})
	//y+
	var button = document.getElementById("y+");
	button.addEventListener('click', ()=>{
		light.position[1] += 0.1;
		//translaçao e escalar
		for(var i=0; i<sceneModels[4].vertices.length; i+=3){
			sceneModels[4].vertices[i+1] += 0.1;
		}
	})
	//y-
	var button = document.getElementById("y-");
	button.addEventListener('click', ()=>{
		light.position[1] -= 0.1;
		//translaçao e escalar
		for(var i=0; i<sceneModels[4].vertices.length; i+=3){
			sceneModels[4].vertices[i+1] -= 0.1;
		}
	})
	//z+
	var button = document.getElementById("z+");
	button.addEventListener('click', ()=>{
		light.position[2] += 0.1;
		//translaçao e escalar
		for(var i=0; i<sceneModels[4].vertices.length; i+=3){
			sceneModels[4].vertices[i+2] += 0.1;
		}
	})
	//z-
	var button = document.getElementById("z-");
	button.addEventListener('click', ()=>{
		light.position[2] -= 0.1;
		//translaçao e escalar
		for(var i=0; i<sceneModels[4].vertices.length; i+=3){
			sceneModels[4].vertices[i+2] -= 0.1;
		}
	})
	////////////////////////////LIGHT 2//////////////////////////
	//x+
	var button = document.getElementById("x+2");
	button.addEventListener('click', ()=>{
		light2.position[0] += 0.1;
		//translaçao e escalar
		for(var i=0; i<sceneModels[5].vertices.length; i+=3){
			sceneModels[5].vertices[i] += 0.1;
		}
	})
	//x-
	var button = document.getElementById("x-2");
	button.addEventListener('click', ()=>{
		light2.position[0] -= 0.1;
		//translaçao e escalar
		for(var i=0; i<sceneModels[5].vertices.length; i+=3){
			sceneModels[5].vertices[i] -= 0.1;
		}
	})
	//y+
	var button = document.getElementById("y+2");
	button.addEventListener('click', ()=>{
		light2.position[1] += 0.1;
		//translaçao e escalar
		for(var i=0; i<sceneModels[5].vertices.length; i+=3){
			sceneModels[5].vertices[i+1] += 0.1;
		}
	})
	//y-
	var button = document.getElementById("y-2");
	button.addEventListener('click', ()=>{
		light2.position[1] -= 0.1;
		//translaçao e escalar
		for(var i=0; i<sceneModels[5].vertices.length; i+=3){
			sceneModels[5].vertices[i+1] -= 0.1;
		}
	})
	//z+
	var button = document.getElementById("z+2");
	button.addEventListener('click', ()=>{
		light2.position[2] += 0.1;
		//translaçao e escalar
		for(var i=0; i<sceneModels[5].vertices.length; i+=3){
			sceneModels[5].vertices[i+2] += 0.1;
		}
	})
	//z-
	var button = document.getElementById("z-2");
	button.addEventListener('click', ()=>{
		light2.position[2] -= 0.1;
		//translaçao e escalar
		for(var i=0; i<sceneModels[5].vertices.length; i+=3){
			sceneModels[5].vertices[i+2] -= 0.1;
		}
	})
	//reset
	var button = document.getElementById("reset");
	button.addEventListener('click', ()=>{
		//restart all models
		sceneModels[1] = new sphereModel(-0.8,0.8,-6.5, 0.25,0.25,0.25, 3, [0.2, 0.8, 0.3]);
		sceneModels[1].hasRays = true;
		sceneModels[2] = new sphereModel(0.8, 0.0,-6.5, 0.45,0.45,0.45, 3, [1, 0.84, 0.37]);
		sceneModels[2].hasRays = true;
		sceneModels[3] = (new squareModel(0.0,-0.6,-6.0, 1.5,1.5,1.5, true, [0.8,0.8,0.8]));
		sceneModels[3].hasRays = true;
		//restart count
		lastCount = 0;
	})

	var button = document.getElementById("light_color");
	button.addEventListener('change', (e)=>{
		var hex = e.target.value;
		light.intensity[0] = scale(parseInt(hex.slice(1,3),16));
		light.intensity[1] = scale(parseInt(hex.slice(3,5),16));
		light.intensity[2] = scale(parseInt(hex.slice(5,7),16));
		//recreate sphere with new color
		sceneModels[4] = new sphereModel(light.position[0], light.position[1],light.position[2], 0.15,0.15,0.15, 3, light.intensity)
	})
	var button = document.getElementById("light_color2");
	button.addEventListener('change', (e)=>{
		var hex = e.target.value;
		light2.intensity[0] = scale(parseInt(hex.slice(1,3),16));
		light2.intensity[1] = scale(parseInt(hex.slice(3,5),16));
		light2.intensity[2] = scale(parseInt(hex.slice(5,7),16));
		//recreate sphere with new color
		sceneModels[5] = new sphereModel(light2.position[0], light2.position[1],light2.position[2], 0.15,0.15,0.15, 3, light2.intensity)
	})
}

//----------------------------------------------------------------------------
//
// WebGL Initialization
//

function initWebGL( canvas ) {
	try {

		gl = canvas.getContext("webgl") || canvas.getContext("experimental-webgl");
		
		primitiveType = gl.TRIANGLES;
		
		gl.enable( gl.CULL_FACE );
		
		gl.cullFace( gl.BACK );

		gl.enable( gl.DEPTH_TEST );
        
	} catch (e) {
	}
	if (!gl) {
		alert("Could not initialise WebGL, sorry! :-(");
	}        
}

//----------------------------------------------------------------------------

function runWebGL() {
	
	var canvas = document.getElementById("my-canvas");
	
	initWebGL( canvas );

	shaderProgram = initShaders( gl );

	setEventListeners();
	
	tick();		// A timer controls the rendering / animation    
}


