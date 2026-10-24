function path_hom(A)
    start = 1
    distances = Tuple{Int,Int}[]
    queue = Int[]

    for s in [start; axes(A,1)]
        if !any(t -> t[1] == s, distances)
            push!(distances,(s,0))
            push!(queue, s)
        end
        while !isempty(queue)
            u = popfirst!(queue)
            outgoing = findall(==(1), A[u, :])
            incoming = findall(==(1), A[:, u])
            idx = findfirst(t -> t[1] == u, distances)

            for i in outgoing
                if !any(t -> t[1] == i, distances)
                    push!(distances,(i,distances[idx][2]+1))
                    push!(queue, i)
                end
            end
            for i in incoming
                if !any(t -> t[1] == i, distances)
                    push!(distances,(i,distances[idx][2]-1))
                    push!(queue, i)
                end
            end
        end
    end
    return distances
end


A = Bool[
    0 1 1 0;
    0 0 0 0;
    0 0 0 0;
    0 1 1 0
]

path_hom(A)