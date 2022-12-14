clear; clc;

lin = input('Enter in a length in meter for conversion: ');

units = input('Enter in the unit of conversion (in, ft, mm, cm): ');

switch (units)
    case {'in', 'IN', 'In', 'inch' ,'inches', 'Inch' ,'Inches'}
        out = lin * 39.37;
    case {'ft', 'FT', 'Feet', 'FEET', 'feet'}
        out = lin * 39.37/12;
    case 'mm'
        out = lin * 1000;
    case 'cm' 
        out = lin * 100;
    otherwise
        fprintf('Ty again, did not enter acceptable unit.');
end

fprintf('\nThe original measurement was %g meters, converted to %g %s\n\n',lin,out,units);