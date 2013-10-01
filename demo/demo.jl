include("../spear.jl")
activities = int(readcsv("activities.csv"))

C(x) = x.^.5      # credit scoring function
A = generateAdjacencyMatrix(activities, C)
(expertise, quality) = runSpear(A)

# Display the results
users = readcsv("users.csv")
resources = readcsv("resources.csv")

iSortUsers = reverse(sortperm(vec(expertise)))
sortedPrintU = reduce(*,map((i -> "$(users[i]) =>  $(round(expertise[i],3))\n"),iSortUsers))
println("Users sorted by expertise \n$sortedPrintU")

iSortResources = reverse(sortperm(vec(quality)))
sortedPrintR = reduce(*,map((i -> "$(resources[i]) =>  $(round(quality[i],3))\n"),iSortResources))
println("Resources sorted by quality \n$sortedPrintR")

