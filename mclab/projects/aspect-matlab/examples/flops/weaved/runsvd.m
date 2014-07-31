global AM_GLOBAL;
if (~isempty(AM_GLOBAL))
  AM_EntryPoint_0 = 0;
else 
  AM_EntryPoint_0 = 1;
end
if (~isfield(AM_GLOBAL, 'flops'))
  AM_GLOBAL.flops = flops;
end
AM_tmpAS_n = (10 : 10 : 10);
for AM_tmpFS_n = (1 : numel(AM_tmpAS_n))
  n = AM_tmpAS_n(AM_tmpFS_n);
  if (exist('tic', 'var') ~= 1)
    AM_GLOBAL.flops.flops_bany();
  end
  tic
  if (exist('tic', 'var') ~= 1)
    AM_GLOBAL.flops.flops_aany('tic', 4, 'runsvd');
  end
  AM_CVar_0 = n;
  AM_CVar_1 = n;
  if (exist('rand', 'var') ~= 1)
    AM_GLOBAL.flops.flops_bany();
  end
  AM_CVar_2 = rand(AM_CVar_0, AM_CVar_1);
  if (exist('rand', 'var') ~= 1)
    AM_GLOBAL.flops.flops_aany('rand', 5, 'runsvd');
  end
  x = AM_CVar_2;
  AM_CVar_3 = x;
  if (exist('SVD', 'var') ~= 1)
    AM_GLOBAL.flops.flops_beforeTrack('SVD');
  end
  if (exist('SVD', 'var') ~= 1)
    AM_GLOBAL.flops.flops_bany();
  end
  [u, s, v] = SVD(AM_CVar_3);
  if (exist('SVD', 'var') ~= 1)
    AM_GLOBAL.flops.flops_aany('SVD', 6, 'runsvd');
  end
  if (exist('SVD', 'var') ~= 1)
    AM_GLOBAL.flops.flops_afterTrack();
  end
  AM_CVar_4 = n;
  AM_CVar_5 = u;
  AM_CVar_6 = s;
  if (exist('diag', 'var') ~= 1)
    AM_GLOBAL.flops.flops_bany();
  end
  AM_CVar_7 = diag(AM_CVar_6);
  if (exist('diag', 'var') ~= 1)
    AM_GLOBAL.flops.flops_aany('diag', 7, 'runsvd');
  end
  if (exist('diag', 'var') ~= 1)
    AM_GLOBAL.flops.flops_bany();
  end
  AM_CVar_8 = diag(AM_CVar_7);
  if (exist('diag', 'var') ~= 1)
    AM_GLOBAL.flops.flops_aany('diag', 7, 'runsvd');
  end
  AM_CVar_9 = v;
  AM_CVar_10 = x;
  if (exist('norm', 'var') ~= 1)
    AM_GLOBAL.flops.flops_bany();
  end
  AM_CVar_11 = norm((((AM_CVar_5 * AM_CVar_8) * AM_CVar_9) - AM_CVar_10), 2);
  if (exist('norm', 'var') ~= 1)
    AM_GLOBAL.flops.flops_aany('norm', 7, 'runsvd');
  end
  if (exist('toc', 'var') ~= 1)
    AM_GLOBAL.flops.flops_bany();
  end
  AM_CVar_12 = toc;
  if (exist('toc', 'var') ~= 1)
    AM_GLOBAL.flops.flops_aany('toc', 7, 'runsvd');
  end
  if (exist('fprintf', 'var') ~= 1)
    AM_GLOBAL.flops.flops_bany();
  end
  fprintf('run with n=%x, delta norm=%x, time: %.3fs\n', AM_CVar_4, AM_CVar_11, AM_CVar_12);
  if (exist('fprintf', 'var') ~= 1)
    AM_GLOBAL.flops.flops_aany('fprintf', 7, 'runsvd');
  end
end
if AM_EntryPoint_0
  AM_GLOBAL = [];
end
