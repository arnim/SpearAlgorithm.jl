SpearAlgorithm.jl
=================

Implementation of the [SPEAR ranking algorithm](http://www.michael-noll.com/projects/spear-algorithm/) in [Julia](http://julialang.org/)

Usage
-----
Start with a chronological ordered list of user activities on resources and a credit scoring function as input to generate the adjacency matrix.
The first column of the activities matrix refers to the user the second to the resource. Each row of the matrix represents a single activity.

    julia> include("spear.jl")
	julia> activities = [1 1
	                     2 1]
	julia> C(x) = x.^.5      # credit scoring function
	julia> A = generateAdjacencyMatrix(activities, C)
	julia> showall(A)        # display the adjacency matrix
	
Calculate the user expertise scores and resource qualities

	julia> (expertise, quality) = runSpear(A)
	julia> showall(expertise) # print the expertise for each user
	x2 Float64 Array:
	0.585786  0.414214
	julia> showall(quality)   # print the quality for each resource
	1x1 Float64 Array:
	1.0

Alternatively cd into demo and run

    julia demo.jl 
    Users sorted by expertise 
    Odersky =>  0.399
    Alice =>  0.326
    Bob =>  0.275
    SomeOne =>  0.0

    Resources sorted by quality 
    http://www.scala-lang.org/ =>  0.839
    http://julialang.org/ =>  0.161
    http://www.shoppingportal.com =>  0.0
	
License & Copyright
-------------------
SpearAlgorithm.jl is licensed under the [MIT License](http://opensource.org/licenses/MIT).  
Copyright (c) 2013: Arnim Bleier and other contributors.
