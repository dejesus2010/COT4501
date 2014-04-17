function L = LHopitals( gnum, gden )
    syms x;
    
    gnum;
    gden;
    
    while( limit( gnum, x, 0 ) == 0 && limit( gden, x, 0 ) == 0 )
        gnum = sym(gnum);
        gnum = matlabFunction( diff(gnum) );
        gden = sym(gden);
        gden = matlabFunction( diff(gden) );
    end%while
    
    gden;
    
    %L = limit(fnum, x, 0 ) / ( limit( gnum, x, 0 ) / gden );
    
    L = limit( gnum, x, 0 ) / limit( gden, x , 0 );
    
end%function
