%% Computer Prob 6.2
% 
% function L = LHopitals( fnum, gnum, gden )
%    syms x;
%    while( limit( gden, x, 0 ) == 0 )
%        gden = matlabFunction( diff(g1) );
%    end%while
% end%function

f = @(x)(0.5);
g = @(x)((1-cos(x))/x^2);

dg = @(x)



gnum = @(x)(1-cos(x));
gden = @(x)(x^2);

%% 
% (a) Use l'Hopital's rule to show that f is continuous at x = 0
%
% function L = LHopitals( gnum, gden )
%    syms x;
%    
%    gnum;
%    gden;
%    
%    while( limit( gnum, x, 0 ) == 0 && limit( gden, x, 0 ) == 0 )
%        gnum = sym(gnum);
%        gnum = matlabFunction( diff(gnum) );
%        gden = sym(gden);
%        gden = matlabFunction( diff(gden) );
%    end%while
%    
%    gden;
%    
%    %L = limit(fnum, x, 0 ) / ( limit( gnum, x, 0 ) / gden );
%    
%    L = limit( gnum, x, 0 ) / limit( gden, x , 0 );
%    
% end%function
%

disp( LHopitals( gnum, gden ) );

disp( limit( f, x, 0) );

disp( 'Because the limit f=0.5 and the limit of g = (1-cos(x))/x^2 are both 1/2, f is continuous at 0');


%%
% (b) Use differentiation to show that f has a local maximum at x = 0


% 









