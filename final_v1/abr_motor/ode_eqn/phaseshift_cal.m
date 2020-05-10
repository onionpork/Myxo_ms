function [phase_start, phase_end, phase_mid, diff_curr] = ...
    phaseshift_cal(vzeros, shift_time_pos, tspan_loc, shiftduration)

ini_start_idx_st = find(vzeros{1} < shift_time_pos, 1, 'last');
ini_end_idx_st = find(vzeros{1} > shift_time_pos, 1, 'first');
ini_start_idx_mid = find(vzeros{1} < shift_time_pos + shiftduration/2, 1, 'last');
ini_end_idx_mid = find(vzeros{1} > shift_time_pos + shiftduration/2, 1, 'first');
ini_start_idx_ed = find(vzeros{1} < shift_time_pos + shiftduration, 1, 'last');
ini_end_idx_ed = find(vzeros{1} > shift_time_pos + shiftduration, 1, 'first');

one_phase = vzeros{1}(ini_end_idx_mid) - vzeros{1}(ini_start_idx_mid);

phase_start = (shift_time_pos - vzeros{1}(ini_start_idx_st))/...
    (vzeros{1}(ini_end_idx_st) - vzeros{1}(ini_start_idx_st));
phase_mid = (shift_time_pos + shiftduration/2 - vzeros{1}(ini_start_idx_mid))/...
    (vzeros{1}(ini_end_idx_mid) - vzeros{1}(ini_start_idx_mid));
phase_end= (shift_time_pos + shiftduration - vzeros{1}(ini_start_idx_ed))/...
    (vzeros{1}(ini_end_idx_ed) - vzeros{1}(ini_start_idx_ed));



len_tmp = min(length(vzeros{1}), length(vzeros{tspan_loc}));
diff_ = vzeros{1}(1:len_tmp) - vzeros{tspan_loc}(1:len_tmp);
diff_loc = find(diff_ ~= 0, 1, 'first');

% ini_zeros
ini_zeros = vzeros{1};
ini_zeros_new = ini_zeros(diff_loc:end);
loc = 1;
while loc < length(ini_zeros_new)
    if ini_zeros_new(loc+1) -  ini_zeros_new(loc) < one_phase/2
        ini_zeros_new(loc+1) = [];
    else
        loc = loc + 1;
    end   
end

% curr_zeros
curr_zeros = vzeros{tspan_loc};
curr_zeros_new = curr_zeros(diff_loc:end);
loc = 1;
while loc < length(curr_zeros_new)
    if curr_zeros_new(loc+1) -  curr_zeros_new(loc) < one_phase/2
        curr_zeros_new(loc+1) = [];
    else
        loc = loc + 1;
    end   
end

if length(curr_zeros_new) == length(ini_zeros_new)
    diff_curr = mean(ini_zeros_new - curr_zeros_new)/one_phase;
else
    len_ = min(length(ini_zeros_new), length(curr_zeros_new));
    if abs(curr_zeros_new(1) - ini_zeros_new(1)) > one_phase/2
        diff_curr = mean(ini_zeros_new(end:-1:end-len_+1) - ...
            curr_zeros_new(end:-1:end-len_+1))/one_phase;
    elseif abs(curr_zeros_new(end) - ini_zeros_new(end)) > one_phase/2
        diff_curr = mean(ini_zeros_new(1:len_) - ...
            curr_zeros_new(1:len_))/one_phase;
    else
        disp('check')
    end
    
end