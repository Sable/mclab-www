function  [Uout, Sout, Vout] = SVD(A)
  global AM_GLOBAL;
  if (~isempty(AM_GLOBAL))
    AM_EntryPoint_1 = 0;
  else 
    AM_EntryPoint_1 = 1;
  end
  if (~isfield(AM_GLOBAL, 'flops'))
    AM_GLOBAL.flops = flops;
  end
  AM_CVar_13 = A;
  AM_GLOBAL.flops.flops_bany();
  AM_CVar_14 = size(AM_CVar_13, 1);
  AM_GLOBAL.flops.flops_aany('size', 9, 'SVD');
% given an arbitrary mxn matrix (m >= n), computes its svd
% and returns it in U,S,V, where A = U*S*V, U,V unitary, and S diagonal,
% where s_i >= 0, and s_i >= s_i+1
% if called with less than three output arguments, will return only S
% eps is used for the tolerance, but is ignored.
% this svd algo is slightly inefficient, i.e. spread over a couple of
% functions that call each other a lot (we use the Kogbetliantz method)
% get the size of the matrix
  m = AM_CVar_14;
  AM_CVar_15 = A;
  AM_GLOBAL.flops.flops_bany();
  AM_CVar_16 = size(AM_CVar_15, 2);
  AM_GLOBAL.flops.flops_aany('size', 10, 'SVD');
  n = AM_CVar_16;
  AM_CVar_17 = m;
  AM_GLOBAL.flops.flops_bany();
  AM_CVar_18 = eye(AM_CVar_17);
  AM_GLOBAL.flops.flops_aany('eye', 11, 'SVD');
  U = AM_CVar_18;
  AM_CVar_19 = n;
  AM_GLOBAL.flops.flops_bany();
  AM_CVar_20 = eye(AM_CVar_19);
  AM_GLOBAL.flops.flops_aany('eye', 12, 'SVD');
  V = AM_CVar_20;
  AM_GLOBAL.flops.flops_bany();
  AM_CVar_21 = eps;
  AM_GLOBAL.flops.flops_aany('eps', 13, 'SVD');
  AM_CVar_22 = A;
  AM_GLOBAL.flops.flops_bany();
  AM_CVar_23 = fro(AM_CVar_22);
  AM_GLOBAL.flops.flops_aany('fro', 13, 'SVD');
  e = (AM_CVar_21 * AM_CVar_23);
    AM_CVar_58 = m;
    AM_CVar_59 = n;
  AM_GLOBAL.flops.flops_bany();
    AM_CVar_60 = eye(AM_CVar_58, AM_CVar_59);
  AM_GLOBAL.flops.flops_aany('eye', 14, 'SVD');
    AM_CVar_61 = A((~AM_CVar_60));
  AM_GLOBAL.flops.flops_bany();
  AM_CVar_62 = AM_GLOBAL.flops.flops_aabs(0, @abs, {AM_CVar_61}, {AM_CVar_61}, {}, 'SVD.m', 14, 'SVD', 'abs', {}, []);
  AM_GLOBAL.flops.flops_aany('abs', 14, 'SVD');
  AM_GLOBAL.flops.flops_bany();
    AM_CVar_63 = sum(AM_CVar_62);
  AM_GLOBAL.flops.flops_aany('sum', 14, 'SVD');
    AM_CVar_64 = e;
    AM_CVar_57 = (AM_CVar_63 > AM_CVar_64);
  while AM_CVar_57
    AM_CVar_24 = n;
    AM_tmpAS_i = (1 : AM_CVar_24);
    for AM_tmpFS_i = (1 : numel(AM_tmpAS_i))
      i = AM_tmpAS_i(AM_tmpFS_i);
      AM_CVar_25 = i;
      AM_CVar_26 = n;
      AM_tmpAS_j = ((AM_CVar_25 + 1) : AM_CVar_26);
      for AM_tmpFS_j = (1 : numel(AM_tmpAS_j))
        j = AM_tmpAS_j(AM_tmpFS_j);
        AM_CVar_27 = A;
        AM_CVar_28 = m;
        AM_CVar_29 = n;
        AM_CVar_30 = i;
        AM_CVar_31 = j;
        AM_GLOBAL.flops.flops_bany();
% termination condition
        [J1, J2] = jacobi(AM_CVar_27, AM_CVar_28, AM_CVar_29, AM_CVar_30, AM_CVar_31);
        AM_GLOBAL.flops.flops_aany('jacobi', 17, 'SVD');
        AM_CVar_32 = J1;
        AM_CVar_33 = A;
        AM_CVar_34 = J2;
        AM_GLOBAL.flops.flops_bany();
        AM_CVar_35 = AM_GLOBAL.flops.flops_amtimes(0, @mtimes, {AM_CVar_33, AM_CVar_34}, {AM_CVar_33, AM_CVar_34}, {}, 'SVD.m', 18, 'SVD', 'mtimes', {}, []);
        AM_GLOBAL.flops.flops_aany('mtimes', 18, 'SVD');
        AM_GLOBAL.flops.flops_bany();
        AM_CVar_36 = AM_GLOBAL.flops.flops_amtimes(1, @mtimes, {AM_CVar_32, AM_CVar_35}, {AM_CVar_32, AM_CVar_35}, {}, 'SVD.m', 18, 'SVD', 'mtimes', {}, []);
        AM_GLOBAL.flops.flops_aany('mtimes', 18, 'SVD');
        A = AM_CVar_36;
        AM_CVar_37 = U;
        AM_CVar_38 = J1;
        AM_GLOBAL.flops.flops_bany();
        AM_CVar_39 = AM_GLOBAL.flops.flops_amtimes(2, @mtimes, {AM_CVar_37, (AM_CVar_38')}, {AM_CVar_37, (AM_CVar_38')}, {}, 'SVD.m', 19, 'SVD', 'mtimes', {}, []);
        AM_GLOBAL.flops.flops_aany('mtimes', 19, 'SVD');
        U = AM_CVar_39;
        AM_CVar_40 = J2;
        AM_CVar_41 = V;
        AM_GLOBAL.flops.flops_bany();
        AM_CVar_42 = AM_GLOBAL.flops.flops_amtimes(3, @mtimes, {(AM_CVar_40'), AM_CVar_41}, {(AM_CVar_40'), AM_CVar_41}, {}, 'SVD.m', 20, 'SVD', 'mtimes', {}, []);
        AM_GLOBAL.flops.flops_aany('mtimes', 20, 'SVD');
        V = AM_CVar_42;
      end
      AM_CVar_43 = n;
      AM_CVar_44 = m;
      AM_tmpAS_j = ((AM_CVar_43 + 1) : AM_CVar_44);
      for AM_tmpFS_j = (1 : numel(AM_tmpAS_j))
        j = AM_tmpAS_j(AM_tmpFS_j);
        AM_CVar_45 = A;
        AM_CVar_46 = m;
        AM_CVar_47 = n;
        AM_CVar_48 = i;
        AM_CVar_49 = j;
        AM_GLOBAL.flops.flops_bany();
        AM_CVar_50 = jacobi2(AM_CVar_45, AM_CVar_46, AM_CVar_47, AM_CVar_48, AM_CVar_49);
        AM_GLOBAL.flops.flops_aany('jacobi2', 23, 'SVD');
        J1 = AM_CVar_50;
        AM_CVar_51 = J1;
        AM_CVar_52 = A;
        AM_GLOBAL.flops.flops_bany();
        AM_CVar_53 = AM_GLOBAL.flops.flops_amtimes(4, @mtimes, {AM_CVar_51, AM_CVar_52}, {AM_CVar_51, AM_CVar_52}, {}, 'SVD.m', 24, 'SVD', 'mtimes', {}, []);
        AM_GLOBAL.flops.flops_aany('mtimes', 24, 'SVD');
        A = AM_CVar_53;
        AM_CVar_54 = U;
        AM_CVar_55 = J1;
        AM_GLOBAL.flops.flops_bany();
        AM_CVar_56 = AM_GLOBAL.flops.flops_amtimes(5, @mtimes, {AM_CVar_54, (AM_CVar_55')}, {AM_CVar_54, (AM_CVar_55')}, {}, 'SVD.m', 25, 'SVD', 'mtimes', {}, []);
        AM_GLOBAL.flops.flops_aany('mtimes', 25, 'SVD');
        U = AM_CVar_56;
      end
    end
    AM_CVar_58 = m;
    AM_CVar_59 = n;
    AM_GLOBAL.flops.flops_bany();
    AM_CVar_60 = eye(AM_CVar_58, AM_CVar_59);
    AM_GLOBAL.flops.flops_aany('eye', 14, 'SVD');
    AM_CVar_61 = A((~AM_CVar_60));
    AM_GLOBAL.flops.flops_bany();
    AM_CVar_62 = AM_GLOBAL.flops.flops_aabs(1, @abs, {AM_CVar_61}, {AM_CVar_61}, {}, 'SVD.m', 14, 'SVD', 'abs', {}, []);
    AM_GLOBAL.flops.flops_aany('abs', 14, 'SVD');
    AM_GLOBAL.flops.flops_bany();
    AM_CVar_63 = sum(AM_CVar_62);
    AM_GLOBAL.flops.flops_aany('sum', 14, 'SVD');
    AM_CVar_64 = e;
    AM_CVar_57 = (AM_CVar_63 > AM_CVar_64);
  end
  S = A;
  AM_GLOBAL.flops.flops_bany();
  AM_CVar_65 = nargout;
  AM_GLOBAL.flops.flops_aany('nargout', 31, 'SVD');
  if (AM_CVar_65 < 3)
    AM_CVar_66 = S;
    AM_GLOBAL.flops.flops_bany();
    AM_CVar_67 = diag(AM_CVar_66);
    AM_GLOBAL.flops.flops_aany('diag', 32, 'SVD');
% check if we need less than three output arguments
    Uout = AM_CVar_67;
  else 
    Uout = U;
    AM_CVar_68 = S;
    AM_CVar_69 = m;
    AM_CVar_70 = n;
    AM_GLOBAL.flops.flops_bany();
    AM_CVar_71 = eye(AM_CVar_69, AM_CVar_70);
    AM_GLOBAL.flops.flops_aany('eye', 34, 'SVD');
    AM_GLOBAL.flops.flops_bany();
    AM_CVar_72 = AM_GLOBAL.flops.flops_atimes(0, @times, {AM_CVar_68, AM_CVar_71}, {AM_CVar_68, AM_CVar_71}, {}, 'SVD.m', 34, 'SVD', 'times', {}, []);
    AM_GLOBAL.flops.flops_aany('times', 34, 'SVD');
    Sout = AM_CVar_72;
    Vout = V;
  end
  if AM_EntryPoint_1
    AM_GLOBAL = [];
  end
end
function  [J1, J2] = jacobi(A, m, n, i, j)
  global AM_GLOBAL;
  if (~isempty(AM_GLOBAL))
    AM_EntryPoint_1 = 0;
  else 
    AM_EntryPoint_1 = 1;
  end
  if (~isfield(AM_GLOBAL, 'flops'))
    AM_GLOBAL.flops = flops;
  end
  AM_CVar_73 = i;
  AM_CVar_74 = i;
  AM_CVar_75 = A(AM_CVar_73, AM_CVar_74);
  AM_CVar_76 = i;
  AM_CVar_77 = j;
  AM_CVar_78 = A(AM_CVar_76, AM_CVar_77);
  AM_CVar_79 = j;
  AM_CVar_80 = i;
  AM_CVar_81 = A(AM_CVar_79, AM_CVar_80);
  AM_CVar_82 = j;
  AM_CVar_83 = j;
  AM_CVar_84 = A(AM_CVar_82, AM_CVar_83);
% finds the jacobi rotation that will zero A(i,j), A(j,i), A a mxn matrix
% get little matrix out of A
  B = [AM_CVar_75, AM_CVar_78; AM_CVar_81, AM_CVar_84];
  AM_CVar_85 = B;
  AM_GLOBAL.flops.flops_bany();
% get its svd
  [U, S, V] = tinySVD(AM_CVar_85);
  AM_GLOBAL.flops.flops_aany('tinySVD', 42, 'jacobi');
  AM_CVar_86 = m;
  AM_GLOBAL.flops.flops_bany();
  AM_CVar_87 = eye(AM_CVar_86);
  AM_GLOBAL.flops.flops_aany('eye', 44, 'jacobi');
  J1 = AM_CVar_87;
  AM_CVar_88 = U(1, 1);
  AM_CVar_89 = i;
  AM_CVar_90 = i;
  J1(AM_CVar_89, AM_CVar_90) = AM_CVar_88;
  AM_CVar_91 = U(2, 2);
  AM_CVar_92 = j;
  AM_CVar_93 = j;
  J1(AM_CVar_92, AM_CVar_93) = AM_CVar_91;
  AM_CVar_94 = U(2, 1);
  AM_CVar_95 = i;
  AM_CVar_96 = j;
  J1(AM_CVar_95, AM_CVar_96) = AM_CVar_94;
  AM_CVar_97 = U(1, 2);
  AM_CVar_98 = j;
  AM_CVar_99 = i;
  J1(AM_CVar_98, AM_CVar_99) = AM_CVar_97;
  AM_CVar_100 = n;
  AM_GLOBAL.flops.flops_bany();
  AM_CVar_101 = eye(AM_CVar_100);
  AM_GLOBAL.flops.flops_aany('eye', 50, 'jacobi');
  J2 = AM_CVar_101;
  AM_CVar_102 = V(1, 1);
  AM_CVar_103 = i;
  AM_CVar_104 = i;
  J2(AM_CVar_103, AM_CVar_104) = AM_CVar_102;
  AM_CVar_105 = V(2, 2);
  AM_CVar_106 = j;
  AM_CVar_107 = j;
  J2(AM_CVar_106, AM_CVar_107) = AM_CVar_105;
  AM_CVar_108 = V(2, 1);
  AM_CVar_109 = i;
  AM_CVar_110 = j;
  J2(AM_CVar_109, AM_CVar_110) = AM_CVar_108;
  AM_CVar_111 = V(1, 2);
  AM_CVar_112 = j;
  AM_CVar_113 = i;
  J2(AM_CVar_112, AM_CVar_113) = AM_CVar_111;
  if AM_EntryPoint_1
    AM_GLOBAL = [];
  end
end
function  [J1] = jacobi2(A, m, n, i, j)
  global AM_GLOBAL;
  if (~isempty(AM_GLOBAL))
    AM_EntryPoint_1 = 0;
  else 
    AM_EntryPoint_1 = 1;
  end
  if (~isfield(AM_GLOBAL, 'flops'))
    AM_GLOBAL.flops = flops;
  end
  AM_CVar_114 = i;
  AM_CVar_115 = i;
  AM_CVar_116 = A(AM_CVar_114, AM_CVar_115);
  AM_CVar_117 = j;
  AM_CVar_118 = i;
  AM_CVar_119 = A(AM_CVar_117, AM_CVar_118);
% finds the jacobi rotation that will zero A(j,i), A a mxn matrix
% get little matrix out of A
  B = [AM_CVar_116, 0; AM_CVar_119, 0];
  AM_CVar_120 = B;
  AM_GLOBAL.flops.flops_bany();
% get its svd
  [U, S, V] = tinySVD(AM_CVar_120);
  AM_GLOBAL.flops.flops_aany('tinySVD', 61, 'jacobi2');
  AM_CVar_121 = m;
  AM_GLOBAL.flops.flops_bany();
  AM_CVar_122 = eye(AM_CVar_121);
  AM_GLOBAL.flops.flops_aany('eye', 63, 'jacobi2');
  J1 = AM_CVar_122;
  AM_CVar_123 = U(1, 1);
  AM_CVar_124 = i;
  AM_CVar_125 = i;
  J1(AM_CVar_124, AM_CVar_125) = AM_CVar_123;
  AM_CVar_126 = U(2, 2);
  AM_CVar_127 = j;
  AM_CVar_128 = j;
  J1(AM_CVar_127, AM_CVar_128) = AM_CVar_126;
  AM_CVar_129 = U(2, 1);
  AM_CVar_130 = i;
  AM_CVar_131 = j;
  J1(AM_CVar_130, AM_CVar_131) = AM_CVar_129;
  AM_CVar_132 = U(1, 2);
  AM_CVar_133 = j;
  AM_CVar_134 = i;
  J1(AM_CVar_133, AM_CVar_134) = AM_CVar_132;
  if AM_EntryPoint_1
    AM_GLOBAL = [];
  end
end
function  [Uout, Sout, Vout] = tinySVD(A)
  global AM_GLOBAL;
  if (~isempty(AM_GLOBAL))
    AM_EntryPoint_1 = 0;
  else 
    AM_EntryPoint_1 = 1;
  end
  if (~isfield(AM_GLOBAL, 'flops'))
    AM_GLOBAL.flops = flops;
  end
  AM_CVar_135 = A(1, 2);
  AM_CVar_136 = A(2, 1);
  AM_GLOBAL.flops.flops_bany();
  AM_CVar_137 = AM_GLOBAL.flops.flops_aminus(0, @minus, {AM_CVar_135, AM_CVar_136}, {AM_CVar_135, AM_CVar_136}, {}, 'SVD.m', 77, 'tinySVD', 'minus', {}, []);
  AM_GLOBAL.flops.flops_aany('minus', 77, 'tinySVD');
  AM_CVar_138 = A(1, 1);
  AM_CVar_139 = A(2, 2);
  AM_GLOBAL.flops.flops_bany();
  AM_CVar_140 = AM_GLOBAL.flops.flops_aplus(0, @plus, {AM_CVar_138, AM_CVar_139}, {AM_CVar_138, AM_CVar_139}, {}, 'SVD.m', 77, 'tinySVD', 'plus', {}, []);
  AM_GLOBAL.flops.flops_aany('plus', 77, 'tinySVD');
  AM_GLOBAL.flops.flops_bany();
  AM_CVar_141 = AM_GLOBAL.flops.flops_ardivide(0, @rdivide, {AM_CVar_137, AM_CVar_140}, {AM_CVar_137, AM_CVar_140}, {}, 'SVD.m', 77, 'tinySVD', 'rdivide', {}, []);
  AM_GLOBAL.flops.flops_aany('rdivide', 77, 'tinySVD');
% given an arbitrary 2x2 matrix, computes its svd
% and returns it in U,S,V, where A = U*S*V, U,V unitary, and S diagonal,
% where s_i >= 0, and s_i >= s_i+1
% if called with less than three output arguments, will return only S
  t = AM_CVar_141;
  AM_CVar_142 = t;
  AM_GLOBAL.flops.flops_bany();
  AM_CVar_143 = AM_GLOBAL.flops.flops_asqrt(0, @sqrt, {(1 + (AM_CVar_142 ^ 2))}, {(1 + (AM_CVar_142 ^ 2))}, {}, 'SVD.m', 78, 'tinySVD', 'sqrt', {}, []);
  AM_GLOBAL.flops.flops_aany('sqrt', 78, 'tinySVD');
  AM_GLOBAL.flops.flops_bany();
  AM_CVar_144 = AM_GLOBAL.flops.flops_ardivide(1, @rdivide, {1, AM_CVar_143}, {1, AM_CVar_143}, {}, 'SVD.m', 78, 'tinySVD', 'rdivide', {}, []);
  AM_GLOBAL.flops.flops_aany('rdivide', 78, 'tinySVD');
  c = AM_CVar_144;
  AM_CVar_145 = t;
  AM_CVar_146 = c;
  AM_GLOBAL.flops.flops_bany();
  AM_CVar_147 = AM_GLOBAL.flops.flops_atimes(1, @times, {AM_CVar_145, AM_CVar_146}, {AM_CVar_145, AM_CVar_146}, {}, 'SVD.m', 79, 'tinySVD', 'times', {}, []);
  AM_GLOBAL.flops.flops_aany('times', 79, 'tinySVD');
  s = AM_CVar_147;
  AM_CVar_148 = c;
  AM_CVar_149 = s;
  AM_CVar_150 = s;
  AM_CVar_151 = c;
  R = [AM_CVar_148, (-AM_CVar_149); AM_CVar_150, AM_CVar_151];
  AM_CVar_152 = R;
  AM_CVar_153 = A;
  AM_GLOBAL.flops.flops_bany();
  AM_CVar_154 = AM_GLOBAL.flops.flops_amtimes(6, @mtimes, {AM_CVar_152, AM_CVar_153}, {AM_CVar_152, AM_CVar_153}, {}, 'SVD.m', 81, 'tinySVD', 'mtimes', {}, []);
  AM_GLOBAL.flops.flops_aany('mtimes', 81, 'tinySVD');
% find symmetric matrix
  M = AM_CVar_154;
  AM_CVar_155 = M;
  AM_GLOBAL.flops.flops_bany();
  [U, S, V] = tinySymmetricSVD(AM_CVar_155);
  AM_GLOBAL.flops.flops_aany('tinySymmetricSVD', 82, 'tinySVD');
  AM_CVar_156 = R;
  AM_CVar_157 = U;
  AM_GLOBAL.flops.flops_bany();
  AM_CVar_158 = AM_GLOBAL.flops.flops_amtimes(7, @mtimes, {(AM_CVar_156'), AM_CVar_157}, {(AM_CVar_156'), AM_CVar_157}, {}, 'SVD.m', 83, 'tinySVD', 'mtimes', {}, []);
  AM_GLOBAL.flops.flops_aany('mtimes', 83, 'tinySVD');
  U = AM_CVar_158;
  AM_GLOBAL.flops.flops_bany();
  AM_CVar_159 = nargout;
  AM_GLOBAL.flops.flops_aany('nargout', 86, 'tinySVD');
  if (AM_CVar_159 < 3)
    AM_CVar_160 = S;
    AM_GLOBAL.flops.flops_bany();
    AM_CVar_161 = diag(AM_CVar_160);
    AM_GLOBAL.flops.flops_aany('diag', 87, 'tinySVD');
% check if we need less than three output arguments
    Uout = AM_CVar_161;
  else 
    Uout = U;
    Sout = S;
    Vout = V;
  end
  if AM_EntryPoint_1
    AM_GLOBAL = [];
  end
end
function  [Uout, Sout, Vout] = tinySymmetricSVD(A)
  global AM_GLOBAL;
  if (~isempty(AM_GLOBAL))
    AM_EntryPoint_1 = 0;
  else 
    AM_EntryPoint_1 = 1;
  end
  if (~isfield(AM_GLOBAL, 'flops'))
    AM_GLOBAL.flops = flops;
  end
  AM_CVar_162 = A(2, 1);
  if (AM_CVar_162 == 0)
% given a symmetric 2x2 matrix, computes its svd
% and returns it in U,S,V, where A = U*S*V, U,V unitary, and S diagonal,
% where s_i >= 0, and s_i >= s_i+1
% if called with less than three output arguments, will return only S
% case where it's already symmetric
    S = A;
    AM_GLOBAL.flops.flops_bany();
    AM_CVar_163 = eye(2);
    AM_GLOBAL.flops.flops_aany('eye', 102, 'tinySymmetricSVD');
    U = AM_CVar_163;
    V = U;
  else 
    AM_CVar_164 = A(1, 1);
% case where off diagonals are not 0
% taken directly from the notes
    w = AM_CVar_164;
    AM_CVar_165 = A(2, 1);
    y = AM_CVar_165;
    AM_CVar_166 = A(2, 2);
    z = AM_CVar_166;
    AM_CVar_167 = z;
    AM_CVar_168 = w;
    AM_GLOBAL.flops.flops_bany();
    AM_CVar_169 = AM_GLOBAL.flops.flops_aminus(1, @minus, {AM_CVar_167, AM_CVar_168}, {AM_CVar_167, AM_CVar_168}, {}, 'SVD.m', 109, 'tinySymmetricSVD', 'minus', {}, []);
    AM_GLOBAL.flops.flops_aany('minus', 109, 'tinySymmetricSVD');
    AM_CVar_170 = y;
    AM_GLOBAL.flops.flops_bany();
    AM_CVar_171 = AM_GLOBAL.flops.flops_atimes(2, @times, {2, AM_CVar_170}, {2, AM_CVar_170}, {}, 'SVD.m', 109, 'tinySymmetricSVD', 'times', {}, []);
    AM_GLOBAL.flops.flops_aany('times', 109, 'tinySymmetricSVD');
    AM_GLOBAL.flops.flops_bany();
    AM_CVar_172 = AM_GLOBAL.flops.flops_ardivide(2, @rdivide, {AM_CVar_169, AM_CVar_171}, {AM_CVar_169, AM_CVar_171}, {}, 'SVD.m', 109, 'tinySymmetricSVD', 'rdivide', {}, []);
    AM_GLOBAL.flops.flops_aany('rdivide', 109, 'tinySymmetricSVD');
    ro = AM_CVar_172;
    AM_CVar_173 = ro;
    AM_GLOBAL.flops.flops_bany();
    AM_CVar_174 = sign(AM_CVar_173);
    AM_GLOBAL.flops.flops_aany('sign', 110, 'tinySymmetricSVD');
    AM_CVar_175 = ro;
    AM_GLOBAL.flops.flops_bany();
    AM_CVar_176 = AM_GLOBAL.flops.flops_aabs(2, @abs, {AM_CVar_175}, {AM_CVar_175}, {}, 'SVD.m', 110, 'tinySymmetricSVD', 'abs', {}, []);
    AM_GLOBAL.flops.flops_aany('abs', 110, 'tinySymmetricSVD');
    AM_CVar_177 = ro;
    AM_CVar_178 = ro;
    AM_GLOBAL.flops.flops_bany();
    AM_CVar_179 = AM_GLOBAL.flops.flops_atimes(3, @times, {AM_CVar_177, AM_CVar_178}, {AM_CVar_177, AM_CVar_178}, {}, 'SVD.m', 110, 'tinySymmetricSVD', 'times', {}, []);
    AM_GLOBAL.flops.flops_aany('times', 110, 'tinySymmetricSVD');
    AM_GLOBAL.flops.flops_bany();
    AM_CVar_180 = AM_GLOBAL.flops.flops_aplus(1, @plus, {AM_CVar_179, 1}, {AM_CVar_179, 1}, {}, 'SVD.m', 110, 'tinySymmetricSVD', 'plus', {}, []);
    AM_GLOBAL.flops.flops_aany('plus', 110, 'tinySymmetricSVD');
    AM_GLOBAL.flops.flops_bany();
    AM_CVar_181 = AM_GLOBAL.flops.flops_asqrt(1, @sqrt, {AM_CVar_180}, {AM_CVar_180}, {}, 'SVD.m', 110, 'tinySymmetricSVD', 'sqrt', {}, []);
    AM_GLOBAL.flops.flops_aany('sqrt', 110, 'tinySymmetricSVD');
    AM_GLOBAL.flops.flops_bany();
    AM_CVar_182 = AM_GLOBAL.flops.flops_aplus(2, @plus, {AM_CVar_176, AM_CVar_181}, {AM_CVar_176, AM_CVar_181}, {}, 'SVD.m', 110, 'tinySymmetricSVD', 'plus', {}, []);
    AM_GLOBAL.flops.flops_aany('plus', 110, 'tinySymmetricSVD');
    AM_GLOBAL.flops.flops_bany();
    AM_CVar_183 = AM_GLOBAL.flops.flops_ardivide(3, @rdivide, {AM_CVar_174, AM_CVar_182}, {AM_CVar_174, AM_CVar_182}, {}, 'SVD.m', 110, 'tinySymmetricSVD', 'rdivide', {}, []);
    AM_GLOBAL.flops.flops_aany('rdivide', 110, 'tinySymmetricSVD');
    t2 = AM_CVar_183;
    t = t2;
    AM_CVar_184 = t;
    AM_CVar_185 = t;
    AM_GLOBAL.flops.flops_bany();
    AM_CVar_186 = AM_GLOBAL.flops.flops_atimes(4, @times, {AM_CVar_184, AM_CVar_185}, {AM_CVar_184, AM_CVar_185}, {}, 'SVD.m', 112, 'tinySymmetricSVD', 'times', {}, []);
    AM_GLOBAL.flops.flops_aany('times', 112, 'tinySymmetricSVD');
    AM_GLOBAL.flops.flops_bany();
    AM_CVar_187 = AM_GLOBAL.flops.flops_aplus(3, @plus, {1, AM_CVar_186}, {1, AM_CVar_186}, {}, 'SVD.m', 112, 'tinySymmetricSVD', 'plus', {}, []);
    AM_GLOBAL.flops.flops_aany('plus', 112, 'tinySymmetricSVD');
    AM_GLOBAL.flops.flops_bany();
    AM_CVar_188 = AM_GLOBAL.flops.flops_asqrt(2, @sqrt, {AM_CVar_187}, {AM_CVar_187}, {}, 'SVD.m', 112, 'tinySymmetricSVD', 'sqrt', {}, []);
    AM_GLOBAL.flops.flops_aany('sqrt', 112, 'tinySymmetricSVD');
    AM_GLOBAL.flops.flops_bany();
    AM_CVar_189 = AM_GLOBAL.flops.flops_ardivide(4, @rdivide, {1, AM_CVar_188}, {1, AM_CVar_188}, {}, 'SVD.m', 112, 'tinySymmetricSVD', 'rdivide', {}, []);
    AM_GLOBAL.flops.flops_aany('rdivide', 112, 'tinySymmetricSVD');
    c = AM_CVar_189;
    AM_CVar_190 = t;
    AM_CVar_191 = c;
    AM_GLOBAL.flops.flops_bany();
    AM_CVar_192 = AM_GLOBAL.flops.flops_atimes(5, @times, {AM_CVar_190, AM_CVar_191}, {AM_CVar_190, AM_CVar_191}, {}, 'SVD.m', 113, 'tinySymmetricSVD', 'times', {}, []);
    AM_GLOBAL.flops.flops_aany('times', 113, 'tinySymmetricSVD');
    s = AM_CVar_192;
    AM_CVar_193 = c;
    AM_CVar_194 = s;
    AM_CVar_195 = s;
    AM_CVar_196 = c;
    U = [AM_CVar_193, (-AM_CVar_194); AM_CVar_195, AM_CVar_196];
    AM_CVar_197 = c;
    AM_CVar_198 = s;
    AM_CVar_199 = s;
    AM_CVar_200 = c;
    V = [AM_CVar_197, AM_CVar_198; (-AM_CVar_199), AM_CVar_200];
    AM_CVar_201 = U;
    AM_CVar_202 = A;
    AM_CVar_203 = V;
    AM_GLOBAL.flops.flops_bany();
    AM_CVar_204 = AM_GLOBAL.flops.flops_amtimes(8, @mtimes, {AM_CVar_202, AM_CVar_203}, {AM_CVar_202, AM_CVar_203}, {}, 'SVD.m', 116, 'tinySymmetricSVD', 'mtimes', {}, []);
    AM_GLOBAL.flops.flops_aany('mtimes', 116, 'tinySymmetricSVD');
    AM_GLOBAL.flops.flops_bany();
    AM_CVar_205 = AM_GLOBAL.flops.flops_amtimes(9, @mtimes, {AM_CVar_201, AM_CVar_204}, {AM_CVar_201, AM_CVar_204}, {}, 'SVD.m', 116, 'tinySymmetricSVD', 'mtimes', {}, []);
    AM_GLOBAL.flops.flops_aany('mtimes', 116, 'tinySymmetricSVD');
    S = AM_CVar_205;
    AM_CVar_206 = U;
    U = (AM_CVar_206');
    AM_CVar_207 = V;
    V = (AM_CVar_207');
  end
  AM_CVar_208 = U;
  AM_CVar_209 = S;
  AM_CVar_210 = V;
  AM_GLOBAL.flops.flops_bany();
% make sure everything is descending etc...
  [U, S, V] = fixSVD(AM_CVar_208, AM_CVar_209, AM_CVar_210);
  AM_GLOBAL.flops.flops_aany('fixSVD', 121, 'tinySymmetricSVD');
  AM_GLOBAL.flops.flops_bany();
  AM_CVar_211 = nargout;
  AM_GLOBAL.flops.flops_aany('nargout', 124, 'tinySymmetricSVD');
  if (AM_CVar_211 < 3)
    AM_CVar_212 = S;
    AM_GLOBAL.flops.flops_bany();
    AM_CVar_213 = diag(AM_CVar_212);
    AM_GLOBAL.flops.flops_aany('diag', 125, 'tinySymmetricSVD');
% check if we need less than three output arguments
    Uout = AM_CVar_213;
  else 
    Uout = U;
    Sout = S;
    Vout = V;
  end
  if AM_EntryPoint_1
    AM_GLOBAL = [];
  end
end
function  [U, S, V] = fixSVD(U, S, V)
  global AM_GLOBAL;
  if (~isempty(AM_GLOBAL))
    AM_EntryPoint_1 = 0;
  else 
    AM_EntryPoint_1 = 1;
  end
  if (~isfield(AM_GLOBAL, 'flops'))
    AM_GLOBAL.flops = flops;
  end
  AM_CVar_214 = S(1, 1);
  AM_GLOBAL.flops.flops_bany();
  AM_CVar_215 = sign(AM_CVar_214);
  AM_GLOBAL.flops.flops_aany('sign', 136, 'fixSVD');
  AM_CVar_216 = S(2, 2);
  AM_GLOBAL.flops.flops_bany();
  AM_CVar_217 = sign(AM_CVar_216);
  AM_GLOBAL.flops.flops_aany('sign', 136, 'fixSVD');
% takes matrizes U,S,V and returns matrizes U,S,V s.t. S is positive, and
% ordered in descending order
% this only works for 2x2 matrizes
% the diagonal matrix holding the signs of elts in S
  Z = [AM_CVar_215, 0; 0, AM_CVar_217];
  AM_CVar_218 = U;
  AM_CVar_219 = Z;
  AM_GLOBAL.flops.flops_bany();
  AM_CVar_220 = AM_GLOBAL.flops.flops_amtimes(10, @mtimes, {AM_CVar_218, AM_CVar_219}, {AM_CVar_218, AM_CVar_219}, {}, 'SVD.m', 137, 'fixSVD', 'mtimes', {}, []);
  AM_GLOBAL.flops.flops_aany('mtimes', 137, 'fixSVD');
  U = AM_CVar_220;
  AM_CVar_221 = Z;
  AM_CVar_222 = S;
  AM_GLOBAL.flops.flops_bany();
  AM_CVar_223 = AM_GLOBAL.flops.flops_amtimes(11, @mtimes, {AM_CVar_221, AM_CVar_222}, {AM_CVar_221, AM_CVar_222}, {}, 'SVD.m', 138, 'fixSVD', 'mtimes', {}, []);
  AM_GLOBAL.flops.flops_aany('mtimes', 138, 'fixSVD');
  S = AM_CVar_223;
  AM_CVar_224 = S(1, 1);
  AM_CVar_225 = S(2, 2);
  if (AM_CVar_224 < AM_CVar_225)
    P = [0, 1; 1, 0];
    AM_CVar_226 = U;
    AM_CVar_227 = P;
    AM_GLOBAL.flops.flops_bany();
    AM_CVar_228 = AM_GLOBAL.flops.flops_amtimes(12, @mtimes, {AM_CVar_226, AM_CVar_227}, {AM_CVar_226, AM_CVar_227}, {}, 'SVD.m', 141, 'fixSVD', 'mtimes', {}, []);
    AM_GLOBAL.flops.flops_aany('mtimes', 141, 'fixSVD');
    U = AM_CVar_228;
    AM_CVar_229 = P;
    AM_CVar_230 = S;
    AM_CVar_231 = P;
    AM_GLOBAL.flops.flops_bany();
    AM_CVar_232 = AM_GLOBAL.flops.flops_amtimes(13, @mtimes, {AM_CVar_230, AM_CVar_231}, {AM_CVar_230, AM_CVar_231}, {}, 'SVD.m', 142, 'fixSVD', 'mtimes', {}, []);
    AM_GLOBAL.flops.flops_aany('mtimes', 142, 'fixSVD');
    AM_GLOBAL.flops.flops_bany();
    AM_CVar_233 = AM_GLOBAL.flops.flops_amtimes(14, @mtimes, {AM_CVar_229, AM_CVar_232}, {AM_CVar_229, AM_CVar_232}, {}, 'SVD.m', 142, 'fixSVD', 'mtimes', {}, []);
    AM_GLOBAL.flops.flops_aany('mtimes', 142, 'fixSVD');
    S = AM_CVar_233;
    AM_CVar_234 = P;
    AM_CVar_235 = V;
    AM_GLOBAL.flops.flops_bany();
    AM_CVar_236 = AM_GLOBAL.flops.flops_amtimes(15, @mtimes, {AM_CVar_234, AM_CVar_235}, {AM_CVar_234, AM_CVar_235}, {}, 'SVD.m', 143, 'fixSVD', 'mtimes', {}, []);
    AM_GLOBAL.flops.flops_aany('mtimes', 143, 'fixSVD');
    V = AM_CVar_236;
  end
  if AM_EntryPoint_1
    AM_GLOBAL = [];
  end
end
function  [f] = fro(M)
  global AM_GLOBAL;
  if (~isempty(AM_GLOBAL))
    AM_EntryPoint_1 = 0;
  else 
    AM_EntryPoint_1 = 1;
  end
  if (~isfield(AM_GLOBAL, 'flops'))
    AM_GLOBAL.flops = flops;
  end
  AM_CVar_237 = M;
  AM_CVar_238 = M;
  AM_GLOBAL.flops.flops_bany();
  AM_CVar_239 = AM_GLOBAL.flops.flops_atimes(6, @times, {AM_CVar_237, AM_CVar_238}, {AM_CVar_237, AM_CVar_238}, {}, 'SVD.m', 150, 'fro', 'times', {}, []);
  AM_GLOBAL.flops.flops_aany('times', 150, 'fro');
  AM_GLOBAL.flops.flops_bany();
  AM_CVar_240 = sum(AM_CVar_239);
  AM_GLOBAL.flops.flops_aany('sum', 150, 'fro');
  AM_GLOBAL.flops.flops_bany();
  AM_CVar_241 = sum(AM_CVar_240);
  AM_GLOBAL.flops.flops_aany('sum', 150, 'fro');
  AM_GLOBAL.flops.flops_bany();
  AM_CVar_242 = AM_GLOBAL.flops.flops_asqrt(3, @sqrt, {AM_CVar_241}, {AM_CVar_241}, {}, 'SVD.m', 150, 'fro', 'sqrt', {}, []);
  AM_GLOBAL.flops.flops_aany('sqrt', 150, 'fro');
% calculates the frobenius norm
  f = AM_CVar_242;
  if AM_EntryPoint_1
    AM_GLOBAL = [];
  end
end
function  [s] = sign(x)
  global AM_GLOBAL;
  if (~isempty(AM_GLOBAL))
    AM_EntryPoint_1 = 0;
  else 
    AM_EntryPoint_1 = 1;
  end
  if (~isfield(AM_GLOBAL, 'flops'))
    AM_GLOBAL.flops = flops;
  end
  AM_CVar_243 = x;
  if (AM_CVar_243 > 0)
% we will override sign, so that sign(0) = 1
    s = 1;
  else 
    s = (-1);
  end
  if AM_EntryPoint_1
    AM_GLOBAL = [];
  end
end
