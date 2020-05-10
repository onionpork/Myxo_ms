function [val,isterminal, dir] = MyxoEvent(t,pop, dragco, bmp_start, comp_num) 
bmp_end = bmp_start + comp_num -1;
bmn_start = bmp_end + 1;
bmn_end = bmn_start + comp_num -1;

val = (sum(pop(bmp_start:bmp_end)) - sum(pop(bmn_start:bmn_end)))*dragco;
isterminal = 0;
dir = 0;
