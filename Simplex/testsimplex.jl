include("simplexrevisadominimo.jl")
A= [12.3 -3 4;1 1 1;2 5 6.32]
z= [1; 3; -4]
b = [ 20; 25; 30]
solution = simplex(z,A,b)
toc()
println(solution)
aslo
