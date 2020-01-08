//the base of this file is what was given in classes
//new things were added for the project

function recSubdivisionMidPoint( v1, v2, v3, 
								 coordsArray,
								 recursionDepth ) {

	// Recursive midpoint subdivision of one triangle
	
	if( recursionDepth == 0 ) {
		
		// Storing coordinates and colors in the destination arrays
 
        coordsArray.push( v1[0], v1[1], v1[2] );
		
		coordsArray.push( v2[0], v2[1], v2[2] );
		
		coordsArray.push( v3[0], v3[1], v3[2] );
	}
	else {
		
		// Compute the midpoints and proceed recursively
		
        var mid12 = computeMidPoint( v1, v2 );

        var mid23 = computeMidPoint( v2, v3 );
        
        var mid31 = computeMidPoint( v3, v1 );
                
        // 4 recursive calls 

        recSubdivisionMidPoint( v1, mid12, mid31,
                                coordsArray, recursionDepth - 1 );

        recSubdivisionMidPoint( v2, mid23, mid12,
                                coordsArray, recursionDepth - 1 );

        recSubdivisionMidPoint( v3, mid31, mid23,
                                coordsArray, recursionDepth - 1 );

        recSubdivisionMidPoint( mid12, mid23, mid31,
                                coordsArray, recursionDepth - 1 );
	}
}

//----------------------------------------------------------------------------

function midPointRefinement( coordsArray, 
						     recursionDepth ) {
	
	// Mesh refinement - Higher-level function
	
	// Each triangle is subdivided into 4 smaller ones - Lower-level recursive function
	
	// Vertices are duplicated, whenever needed !!
	
	// recursionDepth controls the final number of triangles and vertices 
    
    var origArrayLength = coordsArray.length;

    // Copying
    
    var origCoords = coordsArray.slice();
    
    // Clearing the arrays
    
    coordsArray.splice( 0, origArrayLength );
    
    var origIndex;
    
    // Each triangle is recursively subdivided into 4 triangles
    
    // Iterate through the original triangular faces
    
    for( origIndex = 0; origIndex < origArrayLength; origIndex += 9 )
    {
        /* Call the recursive subdivision function */
        
        recSubdivisionMidPoint( origCoords.slice( origIndex, origIndex + 3 ),
								origCoords.slice( origIndex + 3, origIndex + 6 ),
								origCoords.slice( origIndex + 6, origIndex + 9 ),
								coordsArray,
								recursionDepth );
    }
}

//----------------------------------------------------------------------------
////  Recursive triangle subdivision, using the triangle centroid
//

function recSubdivisionCentroid( v1, v2, v3, 
								 coordsArray,
								 recursionDepth ) {

	// Recursive centroid subdivision of one triangle
	
	if( recursionDepth == 0 ) {
		
		// Storing coordinates and colors in the destination arrays
 
        coordsArray.push( v1[0], v1[1], v1[2] );
		
		coordsArray.push( v2[0], v2[1], v2[2] );
		
		coordsArray.push( v3[0], v3[1], v3[2] );
	}
	else {
		
		// Compute the centroid and proceed recursively
		
        var centroid = computeCentroid( v1, v2, v3 );

        // 3 recursive calls 

        recSubdivisionCentroid( v1, v2, centroid,
                                coordsArray, recursionDepth - 1 );

        recSubdivisionCentroid( v2, v3, centroid,
                                coordsArray, recursionDepth - 1 );

        recSubdivisionCentroid( v3, v1, centroid,
                                coordsArray, recursionDepth - 1 );
    }
}

//----------------------------------------------------------------------------

function centroidRefinement( coordsArray, 
						     recursionDepth ) {
	
	// Mesh refinement - Higher-level function
	
	// Each triangle is subdivided into 3 smaller ones - Lower-level recursive function
	
	// Vertices are duplicated, whenever needed !!
	
	// recursionDepth controls the final number of triangles and vertices 
    
    var origArrayLength = coordsArray.length;

    // Copying
    
    var origCoords = coordsArray.slice();
    
    // Clearing the arrays
    
    coordsArray.splice( 0, origArrayLength );
    
    var origIndex;
    
    // Each triangle is recursively subdivided into 3 triangles
    
    // Iterate through the original triangular faces
    
    for( origIndex = 0; origIndex < origArrayLength; origIndex += 9 )
    {
        /* Call the recursive subdivision function */
        
        recSubdivisionCentroid( origCoords.slice( origIndex, origIndex + 3 ),
								origCoords.slice( origIndex + 3, origIndex + 6 ),
								origCoords.slice( origIndex + 6, origIndex + 9 ),
								coordsArray,
								recursionDepth );
    }
}

//----------------------------------------------------------------------------
//
//  Moving vertices to the spherical surface of radius 1
//

function moveToSphericalSurface( coordsArray ) {
	
	// Each vertex is moved to the spherecial surface of radius 1
    // and centered at (0,0,0)
    
    // This is done by handling each vertex as if it were a prosition vector,
    // and normalizing
	
    var arrayLength = coordsArray.length;
    
    for( origIndex = 0; origIndex < arrayLength; origIndex += 3 )
    {
        var v =  coordsArray.slice( origIndex, origIndex + 3 );
        
        normalize( v );
        
        var i;
        
        for( i = 0; i < 3; i++ ) {
            
            coordsArray[origIndex + i] = v[i];
        }
    }
}

//----------------------------------------------------------------------------
//
//  NEW --- Computing the triangle unit normal vector
//
//  And associating to every vertex
//

function computeVertexNormals( coordsArray, normalsArray ) {
	
	// Clearing the new normals array
	
	normalsArray.splice( 0, normalsArray.length );
	
    // Taking 3 vertices from the coordinates array 

    for( var index = 0; index < coordsArray.length; index += 9 )
    {
		// Compute unit normal vector for each triangle
			
        var normalVector = computeNormalVector( coordsArray.slice(index, index + 3),
												coordsArray.slice(index + 3, index + 6),
												coordsArray.slice(index + 6, index + 9) );

        // Store the unit normal vector for each vertex 

        for( var j = 0; j < 3; j++ )
        {
            normalsArray.push( normalVector[0], normalVector[1], normalVector[2] ); 
		}
	}
}


function computeSimpleColor(arr, colorArr, color){
    colorArr.splice(0, colorArr.length);
    var len = arr.length;
    for(var i=0; i<len; i+=3){
        colorArr.push(...color)
    }
}


function computeRays(light, light2, model, cameraPos, rays, divFactor){

    var lightColor = light.intensity;
    var lightPos = light.position;
    var minDist = Infinity;
    var maxDist = 0;

    var lightColor2 = light2.intensity;
    var lightPos2 = light2.position;
    var minDist2 = Infinity;
    var maxDist2 = 0;

    var color = model.color;
    var count = 0;

    var inShadow = false;
    if(rays){
        //first cicle to calculate min/max distancies
        for(var i=0; i<model.vertices.length/divFactor; i+=3){
            //light
            var dist = euclideanDist([model.vertices[i], model.vertices[i+1], model.vertices[i+2]], lightPos);
            if(dist < minDist) minDist = dist;
            if(dist > maxDist) maxDist = dist;
            //light2
            var dist2 = euclideanDist([model.vertices[i], model.vertices[i+1], model.vertices[i+2]], lightPos2);
            if(dist2 < minDist2) minDist2 = dist2;
            if(dist2 > maxDist2) maxDist2 = dist2;
        }
        //second cicle to compute the rays
        for(var i=0; i<model.vertices.length/divFactor; i+=3){

            var coef = illumCoeficient(minDist, maxDist, euclideanDist([model.vertices[i], model.vertices[i+1], model.vertices[i+2]], lightPos))

            var coef2 = illumCoeficient(minDist2, maxDist2, euclideanDist([model.vertices[i], model.vertices[i+1], model.vertices[i+2]], lightPos2))
            
            //shadows detection part -- intersection not well, very very slow too
            //////////////////////////////////////////////////////////////////////
            //check for intersections to know if we illuminate or shadow
            // var p0 = [model.vertices[i], model.vertices[i+1], model.vertices[i+2]]
            // var p1 = lightPos

            // for(var j=0; j<sceneModels.length; j++){
            //     for(var k=0; k<sceneModels[j].vertices.length; k+=3){
            //         if(model == sceneModels[j]) break
            //         var q0 = [sceneModels[j].vertices[k], sceneModels[j].vertices[k+1], sceneModels[j].vertices[k+2]]
            //         var q1 = lightPos
            //         var inter = math.intersect(p0,p1,q0,q1)
            //         if(inter != null && inter[0] != lightPos[0] && inter[1] != lightPos[1] && inter[2] != lightPos[2] ){
            //             inShadow = true
            //             break
            //         }
            //     }
            //     if(inShadow) break
            // }
            // if(inShadow) coef *= 0
            ///////////////////////////////////////////////////////////////////////

            //adapt color of this vertice
            model.colors[i] = Math.max(color[0]*lightColor[0]*coef, color[0]*lightColor2[0]*coef2);
            model.colors[i+1] =  Math.max(color[1]*lightColor[1]*coef, color[1]*lightColor2[1]*coef2);
            model.colors[i+2] =  Math.max(color[2]*lightColor[2]*coef, color[2]*lightColor2[2]*coef2);

            //primary ray light
            model.vertices.push(...cameraPos);
            model.vertices.push(...cameraPos);
            model.vertices.push(...[model.vertices[i], model.vertices[i+1], model.vertices[i+2]])
            model.colors.push(...[color[0]*lightColor[0]*coef, color[1]*lightColor[1]*coef, color[2]*lightColor[2]*coef]);
            model.colors.push(...[color[0]*lightColor[0]*coef, color[1]*lightColor[1]*coef, color[2]*lightColor[2]*coef]);
            model.colors.push(...[color[0]*lightColor[0]*coef, color[1]*lightColor[1]*coef, color[2]*lightColor[2]*coef]);
            count++;

            //secondary ray light
            model.vertices.push(...[model.vertices[i], model.vertices[i+1], model.vertices[i+2]]);
            model.vertices.push(...lightPos);
            model.vertices.push(...lightPos)
            model.colors.push(...[lightColor[0], lightColor[1], lightColor[2]]);
            model.colors.push(...[lightColor[0], lightColor[1], lightColor[2]]);
            model.colors.push(...[lightColor[0], lightColor[1], lightColor[2]]);
            count++;

            //primary ray light 2
            model.vertices.push(...cameraPos);
            model.vertices.push(...cameraPos);
            model.vertices.push(...[model.vertices[i], model.vertices[i+1], model.vertices[i+2]])
            model.colors.push(...[color[0]*lightColor2[0]*coef2, color[1]*lightColor2[1]*coef2, color[2]*lightColor2[2]*coef2]);
            model.colors.push(...[color[0]*lightColor2[0]*coef2, color[1]*lightColor2[1]*coef2, color[2]*lightColor2[2]*coef2]);
            model.colors.push(...[color[0]*lightColor2[0]*coef2, color[1]*lightColor2[1]*coef2, color[2]*lightColor2[2]*coef2]);
            count++;

            //secondary ray light 2
            model.vertices.push(...[model.vertices[i], model.vertices[i+1], model.vertices[i+2]]);
            model.vertices.push(...lightPos2);
            model.vertices.push(...lightPos2)
            model.colors.push(...[lightColor2[0], lightColor2[1], lightColor2[2]]);
            model.colors.push(...[lightColor2[0], lightColor2[1], lightColor2[2]]);
            model.colors.push(...[lightColor2[0], lightColor2[1], lightColor2[2]]);
            count++;
        }
    }
    return count;
}

