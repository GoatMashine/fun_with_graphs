# This is a terrible, terrible piece of code. This is the epitome of mathematician code. I wanted to implement a function that counts how many 
# homomorphismns there are between two graphs. This is the first attempt I do, future ones will be more efficient.
# This one works by checking every single mapping between the edgelists of the two graphs. yeah..... this is terrible, bad, no good code
# but atleast in theory it should be correct. I have read basically no theory about graph homs and this is what my brain came up with
# after thinking about it for like 15 minutes.

function check_hom(A::AbstractMatrix{Bool}, B::AbstractMatrix{Bool}, edgelist::Vector{Int}, mapping::Vector{Int})
    for i in eachindex(edgelist)
        for j in eachindex(mapping)
            if A[i,j] == false || A[i,j] && B[mapping[i], mapping[j]]
                continue
            elseif A[i,j] != B[mapping[i], mapping[j]]
                return false
            end
        end
    end
    return true
end

function count_hom(A::AbstractMatrix{Bool}, B::AbstractMatrix{Bool})
    rows_A = size(A,1)
    rows_B = size(B,1)
    source = collect(1:rows_A)
    counter = 0
    for m in Iterators.product(fill(1:rows_B,rows_A)...)
        target = collect(m)
        if check_hom(A,B,source,target) == false
            continue
        else
            counter += 1
            println(source, " -> ", target)
        end
    end
    return counter
end

A = [
    false true false;
    false false true;
    false false false
]

B = [
    false true;
    true false
]


G = [
    false true  true  false;
    false false false true;
    false false false true;
    false false false false
]

H = [
    false true  false false;
    true  false true  false;
    false true  false true;
    false false true  false
]

count_hom(H,G)