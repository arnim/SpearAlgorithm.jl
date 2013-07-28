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
	
Calculate the top user expertise scores and resource qualities

	julia> (expertise, quality) = runSpear(A)
	
To print the results 

	julia> iSortUsers = sortperm(vec(expertise), Sort.Reverse)
	julia> sortedPrintU = reduce(*,map((i -> "$(users[i]) =>  $(expertise[i])\n"),iSortUsers))
	julia> println("Users sorted by expertise \n$sortedPrintU")
	Users sorted by expertise 
	alice =>  0.5857864376269051
	bob =>  0.4142135623730951

	julia> iSortResources = sortperm(vec(quality), Sort.Reverse)
	julia> sortedPrintR = reduce(*,map((i -> "$(resources[i]) =>  $(quality[i])\n"),iSortResources))
	julia> println("Resources sorted by quality \n$sortedPrintR")
	Resources sorted by quality 
	http://www.quuxlabs.com/ =>  1.0

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
