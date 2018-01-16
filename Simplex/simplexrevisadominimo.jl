function simplex(z,A,b)
   m, n = (size(A,1), size(A,2))
   z = -1*[z ; zeros(m,1)]
   A = [A eye(m)]
   X = 0
   status = [false,false]
   Base,NBase = collect(n+1:n+m),collect(1:n)
   X = A[:,Base]\b
   println(z)
    while !(status[1] || status[2])
          CNbase = z[NBase,:] - A[:,NBase]' *((A[:,Base])'\z[Base,:])
          minNB = findmin(CNbase)
          status[1] = minNB[1] > 0
          if status[1]
              continue
          end
          U = A[:,Base]\A[:,minNB[2]]
          delta = X./U
          status[2] = !any(delta .>0)
          if status[2]
              continue
          end
        menorpos,ind_menor = minimum(delta[delta.>0]),findfirst(delta,minimum(delta[delta.>0]))
        X = X - delta[ind_menor]*U
        X[ind_menor] = delta[ind_menor]
        Base[ind_menor] , NBase[minNB[2]] = (NBase[minNB[2]],Base[ind_menor])
    end

return X
end
              #return "Solução ótima? :  " *string(status[1])" Solução Infinita? : "*string(status[2])
