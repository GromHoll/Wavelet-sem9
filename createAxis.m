function x = createAxis(start, finish, count)
    step = (finish - start)/count;
    x = start:step:(finish-step);
end