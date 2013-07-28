normalize(arr) = arr ./ sum(arr)

function generateAdjacencyMatrix(R_t::Array{Int,2}, C::Function)
	assert(size(R_t,2) == 2)
	A = zeros(Int,max(R_t[:,1]),max(R_t[:,2]))
	for tag = 1:size(R_t,1)
		u = R_t[tag,1]
		d = R_t[tag,2]
		A[A[:,d] .>= 1,d] += 1
		A[u,d] = 1
	end
	return sparse(C(A))
end

	
function runSpear(A::SparseMatrixCSC{Float64,Int64}, k = 10)
	M = size(A,1)    # number of unique users
	N = size(A,2)    # number of unique documents
	E = ones(M)'     # experience scors of users
	Q = ones(N)'     # qality scors of documents

	for i = 1:k # calculation of expertise and quality stores
		E = normalize(Q * A')
		Q = normalize(E * A)
	end

	return E, Q

end