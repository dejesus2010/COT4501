function H = Houspre(A)

    H = house_matrix(house_reflector(A(1:end,1)));
    
end
