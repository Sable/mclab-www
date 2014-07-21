import x10.util.Timer;
import x10.array.Array_1;
import x10.array.Array_2;
import x10.array.Array_3;
import simpleArrayLib.Mix10;
import simpleArrayLib.Helper;

class drv_fiff_x10{
  static def drv_fiff (var scale: Double)
  {
    //%
    //%  Driver for finite-difference solution to the wave equation.
    //%
        var a: Double = 2.5;
    var b: Double = 1.5;
    var c: Double = 0.5;
    var n: Double = 3500;
    var m: Double = 3500;
        var mc_t0: Long = 1;
    var time: Double;
    var U: Array_2[Double] = null;
    for (time = mc_t0 ;
        (time <= scale);time = (time + 1))
    {
      U = finediff(a, b, c, n, m) ;
    }
      }
  static def finediff (var a: Double, var b: Double, var c: Double, var n: Double, var m: Double)
  {
            //%-----------------------------------------------------------------------
    //%
    //%	This function M-file finds the finite-difference solution
    //%	to the wave equation
    //%
    //%			     2
    //%		u  (x, t)=c u  (x, t),
    //%		 tt	       xx
    //%
    //%	with the boundary conditions
    //%
    //%		u(0, t)=0, u(a, t)=0 for all 0 <= t <= b,
    //%
    //%		u(x, 0)=sin(pi*x)+sin(2*pi*x), for all 0 < x < a,
    //%
    //%		u (x, 0)=0 for all 0 < x < a.
    //%		 t
    //%
    //%	The subscripts t, tt and xx denote the first and second
    //%	partial derivatives of u(x, t) with respect to t and x.
    //%
    //%	Invocation:
    //%		>> U=finediff(a, b, c, n, m)
    //%
    //%		where
    //%
    //%		i. a is the displacement,
    //%
    //%		i. b is the time duration,
    //%
    //%		i. c is the square root of the
    //%		   constant in the wave equation,
    //%
    //%		i. n is the number of grid points over [0, a],
    //%
    //%		i. m is the number of grid points over [0, b],
    //%
    //%		o. U is the solution matrix.
    //%
    //%	Requirements:
    //%		None.
    //%
    //%	Examples:
    //%		>> U=finediff(2.5, 1.5, 0.5, 451, 451)
    //%
    //%	Source:
    //%		Numerical Methods: MATLAB Programs,
    //%		(c) John H. Mathews, 1995.
    //%
    //%		Accompanying text:
    //%		Numerical Methods for Mathematics, Science and
    //%		Engineering, 2nd Edition, 1992.
    //%
    //%		Prentice Hall, Englewood Cliffs,
    //%		New Jersey, 07632, USA.
    //%
    //%		Also part of the FALCON project.
    //%
    //%	Author:
    //%		John H. Mathews (mathews@fullerton.edu).
    //%
    //%	Date:
    //%		March 1995.
    //%
    //%-----------------------------------------------------------------------
        var mc_t4: Double = a;
    var mc_t94: Long = 1;
    var mc_t5: Double = Mix10.minus(n, mc_t94);
    var h: Double = Mix10.mrdivide(mc_t4, mc_t5);
    var mc_t6: Double = b;
    var mc_t95: Long = 1;
    var mc_t7: Double = Mix10.minus(m, mc_t95);
    var k: Double = Mix10.mrdivide(mc_t6, mc_t7);
    var mc_t8: Double = Mix10.mtimes(c, k);
    var mc_t9: Double = h;
    var r: Double = Mix10.mrdivide(mc_t8, mc_t9);
    var mc_t96: Double = 2;
    var r2: Double = Mix10.mpower(r, mc_t96);
    var mc_t97: Double = 2;
    var mc_t10: Double = Mix10.mpower(r, mc_t97);
    var mc_t98: Double = 2;
    var r22: Double = Mix10.mrdivide(mc_t10, mc_t98);
    var mc_t99: Double = 2;
    var mc_t11: Double = Mix10.mpower(r, mc_t99);
    var mc_t100: Long = 1;
    var s1: Double = Mix10.minus(mc_t100, mc_t11);
    var mc_t101: Double = 2;
    var mc_t13: Double = Mix10.mpower(r, mc_t101);
    var mc_t102: Long = 2;
    var mc_t12: Double = Mix10.mtimes(mc_t102, mc_t13);
    var mc_t103: Long = 2;
    var s2: Double = Mix10.minus(mc_t103, mc_t12);
    var U: Array_2[Double] = new Array_2[Double](Mix10.zeros(n, m) as Array_2[Double]);
    var mc_t104: Long = 1;
    var mc_t74: Double = Mix10.minus(n, mc_t104);
    var mc_t117: Long = 2;
    var i1: Long;
    var mc_t25: Double;
    var mc_t26: Double;
    var mc_t23: Double;
    var mc_t105: Long;
    var mc_t24: Long;
    var mc_t22: Double;
    var mc_t14: Double;
    var mc_t21: Double;
    var mc_t106: Long;
    var mc_t19: Double;
    var mc_t20: Double;
    var mc_t17: Double;
    var mc_t107: Long;
    var mc_t18: Long;
    var mc_t16: Double;
    var mc_t15: Double;
    var mc_t1: Double;
    var mc_t108: Long;
    var mc_t59: Double;
    var mc_t72: Double;
    var mc_t73: Double;
    var mc_t70: Double;
    var mc_t109: Long;
    var mc_t71: Long;
    var mc_t69: Double;
    var mc_t61: Double;
    var mc_t68: Double;
    var mc_t110: Long;
    var mc_t66: Double;
    var mc_t67: Double;
    var mc_t64: Double;
    var mc_t111: Long;
    var mc_t65: Long;
    var mc_t63: Double;
    var mc_t62: Double;
    var mc_t60: Double;
    var mc_t27: Double;
    var mc_t29: Double;
    var mc_t57: Double;
    var mc_t58: Double;
    var mc_t55: Double;
    var mc_t56: Long;
    var mc_t54: Double;
    var mc_t46: Double;
    var mc_t53: Double;
    var mc_t112: Long;
    var mc_t51: Double;
    var mc_t52: Double;
    var mc_t49: Double;
    var mc_t50: Long;
    var mc_t48: Double;
    var mc_t47: Double;
    var mc_t39: Double;
    var mc_t44: Double;
    var mc_t45: Double;
    var mc_t42: Double;
    var mc_t113: Long;
    var mc_t43: Long;
    var mc_t41: Double;
    var mc_t40: Double;
    var mc_t31: Double;
    var mc_t38: Double;
    var mc_t114: Long;
    var mc_t36: Double;
    var mc_t37: Double;
    var mc_t34: Double;
    var mc_t115: Long;
    var mc_t35: Long;
    var mc_t33: Double;
    var mc_t32: Double;
    var mc_t30: Double;
    var mc_t28: Double;
    var mc_t2: Double;
    var mc_t116: Long;
    for (i1 = mc_t117 ;
        (i1 <= mc_t74);i1 = (i1 + 1))
    {
      mc_t25 = Mix10.pi() ;
      mc_t26 = h ;
      mc_t23 = Mix10.mtimes(mc_t25, mc_t26) ;
      mc_t105 = 1 ;
      mc_t24 = Mix10.minus(i1, mc_t105) ;
      mc_t22 = Mix10.mtimes(mc_t23, mc_t24) ;
      mc_t14 = Mix10.sin(mc_t22) ;
      mc_t21 = Mix10.pi() ;
      mc_t106 = 2 ;
      mc_t19 = Mix10.mtimes(mc_t106, mc_t21) ;
      mc_t20 = h ;
      mc_t17 = Mix10.mtimes(mc_t19, mc_t20) ;
      mc_t107 = 1 ;
      mc_t18 = Mix10.minus(i1, mc_t107) ;
      mc_t16 = Mix10.mtimes(mc_t17, mc_t18) ;
      mc_t15 = Mix10.sin(mc_t16) ;
      mc_t1 = Mix10.plus(mc_t14, mc_t15) ;
      mc_t108 = 1 ;
      U = Helper.setSubArray(U, i1, i1, mc_t108, mc_t108, mc_t1);
      mc_t59 = s1 ;
      mc_t72 = Mix10.pi() ;
      mc_t73 = h ;
      mc_t70 = Mix10.mtimes(mc_t72, mc_t73) ;
      mc_t109 = 1 ;
      mc_t71 = Mix10.minus(i1, mc_t109) ;
      mc_t69 = Mix10.mtimes(mc_t70, mc_t71) ;
      mc_t61 = Mix10.sin(mc_t69) ;
      mc_t68 = Mix10.pi() ;
      mc_t110 = 2 ;
      mc_t66 = Mix10.mtimes(mc_t110, mc_t68) ;
      mc_t67 = h ;
      mc_t64 = Mix10.mtimes(mc_t66, mc_t67) ;
      mc_t111 = 1 ;
      mc_t65 = Mix10.minus(i1, mc_t111) ;
      mc_t63 = Mix10.mtimes(mc_t64, mc_t65) ;
      mc_t62 = Mix10.sin(mc_t63) ;
      mc_t60 = Mix10.plus(mc_t61, mc_t62) ;
      mc_t27 = Mix10.mtimes(mc_t59, mc_t60) ;
      mc_t29 = r22 ;
      mc_t57 = Mix10.pi() ;
      mc_t58 = h ;
      mc_t55 = Mix10.mtimes(mc_t57, mc_t58) ;
      mc_t56 = i1 ;
      mc_t54 = Mix10.mtimes(mc_t55, mc_t56) ;
      mc_t46 = Mix10.sin(mc_t54) ;
      mc_t53 = Mix10.pi() ;
      mc_t112 = 2 ;
      mc_t51 = Mix10.mtimes(mc_t112, mc_t53) ;
      mc_t52 = h ;
      mc_t49 = Mix10.mtimes(mc_t51, mc_t52) ;
      mc_t50 = i1 ;
      mc_t48 = Mix10.mtimes(mc_t49, mc_t50) ;
      mc_t47 = Mix10.sin(mc_t48) ;
      mc_t39 = Mix10.plus(mc_t46, mc_t47) ;
      mc_t44 = Mix10.pi() ;
      mc_t45 = h ;
      mc_t42 = Mix10.mtimes(mc_t44, mc_t45) ;
      mc_t113 = 2 ;
      mc_t43 = Mix10.minus(i1, mc_t113) ;
      mc_t41 = Mix10.mtimes(mc_t42, mc_t43) ;
      mc_t40 = Mix10.sin(mc_t41) ;
      mc_t31 = Mix10.plus(mc_t39, mc_t40) ;
      mc_t38 = Mix10.pi() ;
      mc_t114 = 2 ;
      mc_t36 = Mix10.mtimes(mc_t114, mc_t38) ;
      mc_t37 = h ;
      mc_t34 = Mix10.mtimes(mc_t36, mc_t37) ;
      mc_t115 = 2 ;
      mc_t35 = Mix10.minus(i1, mc_t115) ;
      mc_t33 = Mix10.mtimes(mc_t34, mc_t35) ;
      mc_t32 = Mix10.sin(mc_t33) ;
      mc_t30 = Mix10.plus(mc_t31, mc_t32) ;
      mc_t28 = Mix10.mtimes(mc_t29, mc_t30) ;
      mc_t2 = Mix10.plus(mc_t27, mc_t28) ;
      mc_t116 = 2 ;
      U = Helper.setSubArray(U, i1, i1, mc_t116, mc_t116, mc_t2);
    }
        var mc_t126: Long = 3;
    var j1: Long;
    var mc_t118: Long;
    var mc_t93: Double;
    var mc_t125: Long;
    var mc_t89: Double;
    var mc_t91: Long;
    var mc_t119: Long;
    var mc_t92: Long;
    var mc_t90: Double;
    var mc_t79: Double;
    var mc_t81: Double;
    var mc_t120: Long;
    var mc_t87: Long;
    var mc_t121: Long;
    var mc_t88: Long;
    var mc_t83: Double;
    var mc_t122: Long;
    var mc_t85: Long;
    var mc_t123: Long;
    var mc_t86: Long;
    var mc_t84: Double;
    var mc_t82: Double;
    var mc_t80: Double;
    var mc_t75: Double;
    var mc_t77: Long;
    var mc_t124: Long;
    var mc_t78: Long;
    var mc_t76: Double;
    var mc_t3: Double;
    for (j1 = mc_t126 ;
        (j1 <= m);j1 = (j1 + 1))
    {
      mc_t118 = 1 ;
      mc_t93 = Mix10.minus(n, mc_t118) ;
      mc_t125 = 2 ;
      for (i1 = mc_t125 ;
          (i1 <= mc_t93);i1 = (i1 + 1))
      {
        mc_t89 = s2 ;
        mc_t91 = i1 ;
        mc_t119 = 1 ;
        mc_t92 = Mix10.minus(j1, mc_t119) ;
        mc_t90 = U(mc_t91 as Long -1, mc_t92 as Long -1) ;
        mc_t79 = Mix10.mtimes(mc_t89, mc_t90) ;
        mc_t81 = r2 ;
        mc_t120 = 1 ;
        mc_t87 = Mix10.minus(i1, mc_t120) ;
        mc_t121 = 1 ;
        mc_t88 = Mix10.minus(j1, mc_t121) ;
        mc_t83 = U(mc_t87 as Long -1, mc_t88 as Long -1) ;
        mc_t122 = 1 ;
        mc_t85 = Mix10.plus(i1, mc_t122) ;
        mc_t123 = 1 ;
        mc_t86 = Mix10.minus(j1, mc_t123) ;
        mc_t84 = U(mc_t85 as Long -1, mc_t86 as Long -1) ;
        mc_t82 = Mix10.plus(mc_t83, mc_t84) ;
        mc_t80 = Mix10.mtimes(mc_t81, mc_t82) ;
        mc_t75 = Mix10.plus(mc_t79, mc_t80) ;
        mc_t77 = i1 ;
        mc_t124 = 2 ;
        mc_t78 = Mix10.minus(j1, mc_t124) ;
        mc_t76 = U(mc_t77 as Long -1, mc_t78 as Long -1) ;
        mc_t3 = Mix10.minus(mc_t75, mc_t76) ;
        U = Helper.setSubArray(U, i1, i1, j1, j1, mc_t3);
      }
    }
        return U;
  }
  static def finediff (var a: Double, var b: Double, var c: Double, var n: Double, var m: Double)
  {
            //%-----------------------------------------------------------------------
    //%
    //%	This function M-file finds the finite-difference solution
    //%	to the wave equation
    //%
    //%			     2
    //%		u  (x, t)=c u  (x, t),
    //%		 tt	       xx
    //%
    //%	with the boundary conditions
    //%
    //%		u(0, t)=0, u(a, t)=0 for all 0 <= t <= b,
    //%
    //%		u(x, 0)=sin(pi*x)+sin(2*pi*x), for all 0 < x < a,
    //%
    //%		u (x, 0)=0 for all 0 < x < a.
    //%		 t
    //%
    //%	The subscripts t, tt and xx denote the first and second
    //%	partial derivatives of u(x, t) with respect to t and x.
    //%
    //%	Invocation:
    //%		>> U=finediff(a, b, c, n, m)
    //%
    //%		where
    //%
    //%		i. a is the displacement,
    //%
    //%		i. b is the time duration,
    //%
    //%		i. c is the square root of the
    //%		   constant in the wave equation,
    //%
    //%		i. n is the number of grid points over [0, a],
    //%
    //%		i. m is the number of grid points over [0, b],
    //%
    //%		o. U is the solution matrix.
    //%
    //%	Requirements:
    //%		None.
    //%
    //%	Examples:
    //%		>> U=finediff(2.5, 1.5, 0.5, 451, 451)
    //%
    //%	Source:
    //%		Numerical Methods: MATLAB Programs,
    //%		(c) John H. Mathews, 1995.
    //%
    //%		Accompanying text:
    //%		Numerical Methods for Mathematics, Science and
    //%		Engineering, 2nd Edition, 1992.
    //%
    //%		Prentice Hall, Englewood Cliffs,
    //%		New Jersey, 07632, USA.
    //%
    //%		Also part of the FALCON project.
    //%
    //%	Author:
    //%		John H. Mathews (mathews@fullerton.edu).
    //%
    //%	Date:
    //%		March 1995.
    //%
    //%-----------------------------------------------------------------------
        var mc_t4: Double = a;
    var mc_t94: Long = 1;
    var mc_t5: Double = Mix10.minus(n, mc_t94);
    var h: Double = Mix10.mrdivide(mc_t4, mc_t5);
    var mc_t6: Double = b;
    var mc_t95: Long = 1;
    var mc_t7: Double = Mix10.minus(m, mc_t95);
    var k: Double = Mix10.mrdivide(mc_t6, mc_t7);
    var mc_t8: Double = Mix10.mtimes(c, k);
    var mc_t9: Double = h;
    var r: Double = Mix10.mrdivide(mc_t8, mc_t9);
    var mc_t96: Double = 2;
    var r2: Double = Mix10.mpower(r, mc_t96);
    var mc_t97: Double = 2;
    var mc_t10: Double = Mix10.mpower(r, mc_t97);
    var mc_t98: Double = 2;
    var r22: Double = Mix10.mrdivide(mc_t10, mc_t98);
    var mc_t99: Double = 2;
    var mc_t11: Double = Mix10.mpower(r, mc_t99);
    var mc_t100: Long = 1;
    var s1: Double = Mix10.minus(mc_t100, mc_t11);
    var mc_t101: Double = 2;
    var mc_t13: Double = Mix10.mpower(r, mc_t101);
    var mc_t102: Long = 2;
    var mc_t12: Double = Mix10.mtimes(mc_t102, mc_t13);
    var mc_t103: Long = 2;
    var s2: Double = Mix10.minus(mc_t103, mc_t12);
    var U: Array_2[Double] = new Array_2[Double](Mix10.zeros(n, m) as Array_2[Double]);
    var mc_t104: Long = 1;
    var mc_t74: Double = Mix10.minus(n, mc_t104);
    var mc_t117: Long = 2;
    var i1: Long;
    var mc_t25: Double;
    var mc_t26: Double;
    var mc_t23: Double;
    var mc_t105: Long;
    var mc_t24: Long;
    var mc_t22: Double;
    var mc_t14: Double;
    var mc_t21: Double;
    var mc_t106: Long;
    var mc_t19: Double;
    var mc_t20: Double;
    var mc_t17: Double;
    var mc_t107: Long;
    var mc_t18: Long;
    var mc_t16: Double;
    var mc_t15: Double;
    var mc_t1: Double;
    var mc_t108: Long;
    var mc_t59: Double;
    var mc_t72: Double;
    var mc_t73: Double;
    var mc_t70: Double;
    var mc_t109: Long;
    var mc_t71: Long;
    var mc_t69: Double;
    var mc_t61: Double;
    var mc_t68: Double;
    var mc_t110: Long;
    var mc_t66: Double;
    var mc_t67: Double;
    var mc_t64: Double;
    var mc_t111: Long;
    var mc_t65: Long;
    var mc_t63: Double;
    var mc_t62: Double;
    var mc_t60: Double;
    var mc_t27: Double;
    var mc_t29: Double;
    var mc_t57: Double;
    var mc_t58: Double;
    var mc_t55: Double;
    var mc_t56: Long;
    var mc_t54: Double;
    var mc_t46: Double;
    var mc_t53: Double;
    var mc_t112: Long;
    var mc_t51: Double;
    var mc_t52: Double;
    var mc_t49: Double;
    var mc_t50: Long;
    var mc_t48: Double;
    var mc_t47: Double;
    var mc_t39: Double;
    var mc_t44: Double;
    var mc_t45: Double;
    var mc_t42: Double;
    var mc_t113: Long;
    var mc_t43: Long;
    var mc_t41: Double;
    var mc_t40: Double;
    var mc_t31: Double;
    var mc_t38: Double;
    var mc_t114: Long;
    var mc_t36: Double;
    var mc_t37: Double;
    var mc_t34: Double;
    var mc_t115: Long;
    var mc_t35: Long;
    var mc_t33: Double;
    var mc_t32: Double;
    var mc_t30: Double;
    var mc_t28: Double;
    var mc_t2: Double;
    var mc_t116: Long;
    for (i1 = mc_t117 ;
        (i1 <= mc_t74);i1 = (i1 + 1))
    {
      mc_t25 = Mix10.pi() ;
      mc_t26 = h ;
      mc_t23 = Mix10.mtimes(mc_t25, mc_t26) ;
      mc_t105 = 1 ;
      mc_t24 = Mix10.minus(i1, mc_t105) ;
      mc_t22 = Mix10.mtimes(mc_t23, mc_t24) ;
      mc_t14 = Mix10.sin(mc_t22) ;
      mc_t21 = Mix10.pi() ;
      mc_t106 = 2 ;
      mc_t19 = Mix10.mtimes(mc_t106, mc_t21) ;
      mc_t20 = h ;
      mc_t17 = Mix10.mtimes(mc_t19, mc_t20) ;
      mc_t107 = 1 ;
      mc_t18 = Mix10.minus(i1, mc_t107) ;
      mc_t16 = Mix10.mtimes(mc_t17, mc_t18) ;
      mc_t15 = Mix10.sin(mc_t16) ;
      mc_t1 = Mix10.plus(mc_t14, mc_t15) ;
      mc_t108 = 1 ;
      U = Helper.setSubArray(U, i1, i1, mc_t108, mc_t108, mc_t1);
      mc_t59 = s1 ;
      mc_t72 = Mix10.pi() ;
      mc_t73 = h ;
      mc_t70 = Mix10.mtimes(mc_t72, mc_t73) ;
      mc_t109 = 1 ;
      mc_t71 = Mix10.minus(i1, mc_t109) ;
      mc_t69 = Mix10.mtimes(mc_t70, mc_t71) ;
      mc_t61 = Mix10.sin(mc_t69) ;
      mc_t68 = Mix10.pi() ;
      mc_t110 = 2 ;
      mc_t66 = Mix10.mtimes(mc_t110, mc_t68) ;
      mc_t67 = h ;
      mc_t64 = Mix10.mtimes(mc_t66, mc_t67) ;
      mc_t111 = 1 ;
      mc_t65 = Mix10.minus(i1, mc_t111) ;
      mc_t63 = Mix10.mtimes(mc_t64, mc_t65) ;
      mc_t62 = Mix10.sin(mc_t63) ;
      mc_t60 = Mix10.plus(mc_t61, mc_t62) ;
      mc_t27 = Mix10.mtimes(mc_t59, mc_t60) ;
      mc_t29 = r22 ;
      mc_t57 = Mix10.pi() ;
      mc_t58 = h ;
      mc_t55 = Mix10.mtimes(mc_t57, mc_t58) ;
      mc_t56 = i1 ;
      mc_t54 = Mix10.mtimes(mc_t55, mc_t56) ;
      mc_t46 = Mix10.sin(mc_t54) ;
      mc_t53 = Mix10.pi() ;
      mc_t112 = 2 ;
      mc_t51 = Mix10.mtimes(mc_t112, mc_t53) ;
      mc_t52 = h ;
      mc_t49 = Mix10.mtimes(mc_t51, mc_t52) ;
      mc_t50 = i1 ;
      mc_t48 = Mix10.mtimes(mc_t49, mc_t50) ;
      mc_t47 = Mix10.sin(mc_t48) ;
      mc_t39 = Mix10.plus(mc_t46, mc_t47) ;
      mc_t44 = Mix10.pi() ;
      mc_t45 = h ;
      mc_t42 = Mix10.mtimes(mc_t44, mc_t45) ;
      mc_t113 = 2 ;
      mc_t43 = Mix10.minus(i1, mc_t113) ;
      mc_t41 = Mix10.mtimes(mc_t42, mc_t43) ;
      mc_t40 = Mix10.sin(mc_t41) ;
      mc_t31 = Mix10.plus(mc_t39, mc_t40) ;
      mc_t38 = Mix10.pi() ;
      mc_t114 = 2 ;
      mc_t36 = Mix10.mtimes(mc_t114, mc_t38) ;
      mc_t37 = h ;
      mc_t34 = Mix10.mtimes(mc_t36, mc_t37) ;
      mc_t115 = 2 ;
      mc_t35 = Mix10.minus(i1, mc_t115) ;
      mc_t33 = Mix10.mtimes(mc_t34, mc_t35) ;
      mc_t32 = Mix10.sin(mc_t33) ;
      mc_t30 = Mix10.plus(mc_t31, mc_t32) ;
      mc_t28 = Mix10.mtimes(mc_t29, mc_t30) ;
      mc_t2 = Mix10.plus(mc_t27, mc_t28) ;
      mc_t116 = 2 ;
      U = Helper.setSubArray(U, i1, i1, mc_t116, mc_t116, mc_t2);
    }
        var mc_t126: Long = 3;
    var j1: Long;
    var mc_t118: Long;
    var mc_t93: Double;
    var mc_t125: Long;
    var mc_t89: Double;
    var mc_t91: Long;
    var mc_t119: Long;
    var mc_t92: Long;
    var mc_t90: Double;
    var mc_t79: Double;
    var mc_t81: Double;
    var mc_t120: Long;
    var mc_t87: Long;
    var mc_t121: Long;
    var mc_t88: Long;
    var mc_t83: Double;
    var mc_t122: Long;
    var mc_t85: Long;
    var mc_t123: Long;
    var mc_t86: Long;
    var mc_t84: Double;
    var mc_t82: Double;
    var mc_t80: Double;
    var mc_t75: Double;
    var mc_t77: Long;
    var mc_t124: Long;
    var mc_t78: Long;
    var mc_t76: Double;
    var mc_t3: Double;
    for (j1 = mc_t126 ;
        (j1 <= m);j1 = (j1 + 1))
    {
      mc_t118 = 1 ;
      mc_t93 = Mix10.minus(n, mc_t118) ;
      mc_t125 = 2 ;
      for (i1 = mc_t125 ;
          (i1 <= mc_t93);i1 = (i1 + 1))
      {
        mc_t89 = s2 ;
        mc_t91 = i1 ;
        mc_t119 = 1 ;
        mc_t92 = Mix10.minus(j1, mc_t119) ;
        mc_t90 = U(mc_t91 as Long -1, mc_t92 as Long -1) ;
        mc_t79 = Mix10.mtimes(mc_t89, mc_t90) ;
        mc_t81 = r2 ;
        mc_t120 = 1 ;
        mc_t87 = Mix10.minus(i1, mc_t120) ;
        mc_t121 = 1 ;
        mc_t88 = Mix10.minus(j1, mc_t121) ;
        mc_t83 = U(mc_t87 as Long -1, mc_t88 as Long -1) ;
        mc_t122 = 1 ;
        mc_t85 = Mix10.plus(i1, mc_t122) ;
        mc_t123 = 1 ;
        mc_t86 = Mix10.minus(j1, mc_t123) ;
        mc_t84 = U(mc_t85 as Long -1, mc_t86 as Long -1) ;
        mc_t82 = Mix10.plus(mc_t83, mc_t84) ;
        mc_t80 = Mix10.mtimes(mc_t81, mc_t82) ;
        mc_t75 = Mix10.plus(mc_t79, mc_t80) ;
        mc_t77 = i1 ;
        mc_t124 = 2 ;
        mc_t78 = Mix10.minus(j1, mc_t124) ;
        mc_t76 = U(mc_t77 as Long -1, mc_t78 as Long -1) ;
        mc_t3 = Mix10.minus(mc_t75, mc_t76) ;
        U = Helper.setSubArray(U, i1, i1, j1, j1, mc_t3);
      }
    }
        return U;
  }
  public static def main(Rail[String]) {
    val t1: Long = Timer.milliTime();
    //Insert Call to driver function here
    val t2: Long = Timer.milliTime();
    val timet: Double = ((t2-t1) as Double)/1000.00;
    Console.OUT.println(timet);
  }
}