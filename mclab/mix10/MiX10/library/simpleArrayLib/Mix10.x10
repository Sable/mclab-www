package simpleArrayLib;

import x10.lang.Math;
import x10.util.Random;
//import x10.regionarray.Array;
//import x10.regionarray.Region;
import x10.array.*;
public class Mix10 {

public static def getArray(a:x10.array.Array_2[Long]){
			return new x10.array.Array_2[Long](a.numElems_1,a.numElems_2);
	}
	
public static def getArray(a:x10.array.Array_1[Long]){
			return new x10.array.Array_1[Long](a.size);
	}	
/*	
	public static def rand(a:Long, b:Long){
		//r:Region = a as Int .. b as Int;
		val x: Array[Long] = new Array[Long]((1..a as Int)*(1..b as Int));
		val z = new Random();
		for (p in x.region)
			x(p) = z.nextLong();
		return x;
		
	}
****/
public static def rand(a:Long, b:Long){
  
  val x: Array_2[Long] = new Array_2[Long](a as Long, b as Long);
  val z = new Random();
  var j: Long;
  for (i in x.indices()){
    x(i) = (z.nextLong());
  }
  if (1 == a as Long){
  	val y: Array_1[Long] = new Array_1[Long](b as Long);
  	for (j=0 ; j < b as Long ; j++){
  		y(j) = x(0,j);
  	}
  	return y;
  }		
  return x;
      
}
public static def randn(a:Long, b:Long){
  
  val x: Array_2[Long] = new Array_2[Long](a as Long, b as Long);
  val z = new Random();
  var j: Long;
  for (i in x.indices()){
    x(i) = (z.nextLong());
  }
  if (1 == a as Long){
  	val y: Array_1[Long] = new Array_1[Long](b as Long);
  	for (j=0 ; j < b as Long ; j++){
  		y(j) = x(0,j);
  	}
  	return y;
  }		
  return x;
      
}
public static def randn_2(a:Long, b:Long){
  
  val x: Array_2[Long] = new Array_2[Long](a as Long, b as Long);
  val z = new Random();
  var j: Long;
  for (i in x.indices()){
    x(i) = (z.nextLong());
  }
  return x;
      
}

public static def rand(a:Double){
	val z = new Random();
	return z.nextDouble();
}

	
	public static def minus(a:Long, b:Long){
		val x: Long;
		x = a-b;
		return x;
		
	}

/*	
	public static def minus(a:Array[Long], b:Long){
		val x = new Array[Long](a.region);
		for (p in a.region){
			x(p) = a(p)-b;
		}
		return x;
	}
*******/	

public static def minus(a:x10.array.Array_2[Long], b:Long){
		val x = getArray(a);
		for (p in x.indices()){
			x(p) = a(p)-b;
		}
		return x;
	}
	
/*	
	public static def horzcat(a:Array_2[Long], b:Long){
		val x = new Array_2[Long](a.numElems_1,a.numElems_2+1L);
		var i:Long;
		val sz:Long = a.numElems_1*a.numElems_2;
		for ( i=0; i<=(sz);i++){
			x(0,i) = a(0,i);
		}
		x(0,(sz+1L))=b;
		return x;
	}
*/	
	
	public static def horzcat(a:Array_1[Long], b:Long){
		val x = new Array_1[Long](a.size+1L);
		var i:Long;
		val sz:Long = a.size;
		for ( i=0; i<(sz);i++){
			x(i) = a(i);
		}
		x(sz)=b;
		return x;
	}
	
	public static def horzcat[T](a:Rail[T]){
		return Array_1.makeView(a);
		
	}
	
	
	public static def min(a:Array_1[Double]){
		var min:Double = a(0);
		for (i in 0..(a.size -1)){
			if(a(i)<min) min = a(i);
		}
		return min;
	}
	
	public static def numel[T](a:Array_2[T]){
		return (a.numElems_1 * a.numElems_2);
	}
	
	public static def numel[T](a:Array_1[T]){
		return (a.size);
	}
	
	public static def horzcat(a:Array_1[Char], b:Array_1[Char]){
		return horzcat([a,b]);
	}
	
	public static def horzcat(a:Rail[Array_1[Char]]){
		var len:Long =0L;
		for (i in 0..(a.size -1)){
			len += a(i).size;
		}
		val x = new Array_1[Char](len);
		var tmp:Array_1[Char];  
		var ctr:Long =0;
		for (i in 0..(a.size -1)){
			tmp = a(i);
			for (j in 0..(tmp.size-1)){
				x(ctr) = tmp(j);
				ctr++;
			}
		}
		return x;
	}
	
	public static def isequal(a:Double, b:Double){ 
		
		return (a==b);
		
	}
	
	public static def plus(a:Long, b:Long){ 
//		val x: Long;
//		x = a+b;
		return (a+b);
		
	}
	
	public static def plus(a:Double, b:Long){ 
		//		val x: Long;
		//		x = a+b;
		return (a+b);
		
	}
	
	public static def plus(a: Array_2[Long], b:Array_2[Long]){
		val x = getArray(a);
		for (p in a.indices()){
			x(p) = a(p)+ b(p);
		}
		return x;
	}
	
	public static def plus(a: Long, b:Array_1[Long]){
		val x = getArray(b);
		for (p in b.indices()){
			x(p) = b(p)+ a;
		}
		return x;
	}
	
	public static def plus(a:Complex, b:Complex){
		val x: Complex;
		x = a+b;
		return x;
		
	}
	public static def mtimes(a:Long, b:Long){
		val x: Long;
		x = a*b;
		return x;
		
	}
	
	 public static def mtimes(a:Array_2[Long], b:Array_2[Long]){                                        
                val m: Long = a.numElems_1;
		val k: Long = a.numElems_2;
		val n: Long = b.numElems_2;                                                                
                val C:Array_2[Long] = new Array_2[Long](m,n);               
                                                                                
        	 for (i in 0..(m-1)) async{                                      
                        for (h in 0..(k-1)){                                    
                                for (j in 0..(n-1)){                            
                                        C(i,j) = C(i,j)+a(i,h)*b(h,j);          
                                }                                               
                        }                                                       
                }                                                               
              val x: Long;
		if (m==1 && n==1)
		{
			x=C(0,0);
			return x;
		}	                                                                  
              return C;                                         
        }                 
	 public static def mtimes_scalar(a:Array_2[Long], b:Array_2[Long]){                                        
                val m: Long = a.numElems_1;
		val k: Long = a.numElems_2;
		val n: Long = b.numElems_2;                                                                
                val C:Array_2[Long] = new Array_2[Long](m,n);               
                                                                                
        	 for (i in 0..(m-1)) async{                                      
                        for (h in 0..(k-1)){                                    
                                for (j in 0..(n-1)){                            
                                        C(i,j) = C(i,j)+a(i,h)*b(h,j);          
                                }                                               
                        }                                                       
                }                                                               
              return C(0,0);                                         
        }                 
	

	public static def mtimes(a:Complex, b:Complex){
		val x: Complex;
		x = a*b;
		return x;
		
	}
	
	public static def mtimes(a:Complex, b:Long){
		val x: Complex;
		x = a*b;
		return x;
		
	}
	
	public static def times(a: Array_2[Long], b:Array_2[Long]){
		val x = getArray(a);
		for (p in a.indices()){
			x(p) = a(p)*b(p);
		}
		return x;
	}
	/*******************
	public static def times(a: Array[Long], b:Array[Long])
	{a.rank == b.rank}{
		val x = new Array[Long](a.region);
		for (p in a.region){
			x(p) = a(p)* b(p);
		}
		return x;
	}
	***********************/
	
	public static def rdivide(a: Array_2[Long], b:Array_2[Long]){
		val x = getArray(a);
		for (p in a.indices()){
			x(p) = a(p)/b(p);
		}
		return x;
	}
	/**
	public static def rdivide(a: Array[Long], b:Array[Long])
	{a.rank == b.rank}{
		val x = new Array[Long](a.region);
		for (p in a.region){
			x(p) = a(p)/ b(p);
		}
		return x;
	}
	**/
	
	public static def mrdivide(a: Array_2[Long], b:Long)
	{
		val x = getArray(a);
		for (p in a.indices()){
			x(p) = a(p)/ b;
		}
		return x;
	}
	
	
	public static def mrdivide(a: Array_1[Long], b:Long)
	{
		val x = getArray(a);
		for (p in a.indices()){
			x(p) = a(p)/ b;
		}
		return x;
	}
	
	public static def plus(a:x10.array.Array_2[Long], b:Long){
		val x = getArray(a);
		for (p in x.indices()){
			x(p) = a(p)+b;
		}
		return x;
	}
	
	
	public static def plus(a:x10.array.Array_1[Long], b:Long){
		val x = getArray(a);
		for (p in x.indices()){
			x(p) = a(p)+b;
		}
		return x;
	}
	/**
	public static def plus(a:Array[Long], b:Long){
		val x = new Array[Long](a.region);
		for (p in a.region){
			x(p) = a(p)+ b;
		}
		return x;
	}
	**/
	
	public static def plus(a:Long, b:Array_2[Long]){
		val x = getArray(b);
		for (p in b.indices()){
			x(p) = a+ b(p);
		}
		return x;
	}
	
	public static def rdivide(a:Long, b:Long)
	{
		
		return a/b;
	}
	
	
	public static def colon(a:Long, b:Long)
	{
		
		//return new Array[Long](1..1*1..((b-a+1) as Int), (i:Point(2))=>((i(1)+a as Int -1) as Long));
		/*
		val len:Long = b as Long - a as Long +1L;
		val x = new Array_2[Long](1L,len);
		var i:Long = 0;
		for (i=0; i<len; i++)
		{
			x(0L,i) = i + a as Long;
		}
		*/
		val len:Long = b as Long - a as Long +1L;
		val x = new Array_1[Long](len);
		var i:Long = 0;
		for (i=0; i<len; i++)
		{
			x(i) = i + a as Long;
		}
		return x;	
	}
	
	public static def plus(a:Long, b:Complex){
		val x: Complex;
		x = a+b;
		return x;
		//return a+b;
	}
	public static def sin(a:Long){
		return Math.sin(a);
		//return x;
		
	}
	
	public static def cos(a:Long){
		return Math.cos(a);
		//return x;
		
	}
	
	public static def pi(){
		return Math.PI;
		//return x;
		
	}
	public static def mrdivide(a:Long, b:Long){
		val x: Long;
		x = a/b;
		return x;
		
	}
	
	public static def length(a:Array[Long]){
		return a.size;
	}
	
	
	public static def max(a:Array[Double]){
		
		val x:Rail[Double]  = a.raw();
		var mx:Double = Double.MIN_VALUE;
		for (i in x)
			if (i > mx){
				mx = i;
			}
		return mx;
	}
	
	public static def mtimes(a:Long, b:Array_2[Long]){
		val x = getArray(b);
		for (p in b.indices()){
			x(p) = a*b(p);
		}
		return x;
	}
	
	public static def mtimes(a:Long, b:Array_1[Long]){
		val x = getArray(b);
		for (p in b.indices()){
			x(p) = a*b(p);
		}
		return x;
	}
	/******
	public static def mtimes(a:Long, b:Array[Long]){
		val x: Array[Long] = new Array[Long](b.region);
		
		for (p in b.region)
		x(p) = a*b(p);
		
		return x;
		
	}
	********/
	
	public static def mtimes(a:Array_2[Long], b:Long){
		val x = getArray(a);
		for (p in a.indices()){
			x(p) = a(p)*b;
		}
		return x;
	}
		public static def mtimes(a:Array_2[Long], b:Double){
		val x: Array_2[Double] = new Array_2[Double](a.numElems_1, a.numElems_2);
		//val x = getArray(a);
		for (p in a.indices()){
			x(p) = a(p)*b;
		}
		return x;
	}
		public static def mtimes(b:Double, a:Array_2[Long]){
		val x: Array_2[Double] = new Array_2[Double](a.numElems_1, a.numElems_2);
		//val x = getArray(a);
		for (p in a.indices()){
			x(p) = a(p)*b;
		}
		return x;
	}
	

	public static def mtimes(a:Array_1[Long], b:Long){
		val x = getArray(a);
		for (p in a.indices()){
			x(p) = a(p)*b;
		}
		return x;
	}
	/*************
	public static def mtimes( b:Array[Long], a:Long){
		val x: Array[Long] = new Array[Long](b.region);
		
		for (p in b.region)
			x(p) = a*b(p);
		
		return x;
		
	}
	*************/
/*	
	public static def mpower(a:Long, b:Long){
		val x: Long;
		x = Math.pow(a,b);
		return x;
		
	}
*/	
	public static def zeros (a:Long, b:Long){
		
		if (a ==1){
			return new Array_1[Double](b as Long,0);
		}
		
		val x: Array_2[Double] = new Array_2[Double](a as Long, b as Long,0);
		//for (p in x.region)
		//	x(p) = 0.0;
		return x;
	}
	
	public static def ones (a:Long, b:Long){
		val x: Array_2[Double] = new Array_2[Double](a as Long, b as Long,1.0);
		//for (p in x.region)
		//	x(p) = 0.0;
		
		if (a == 1)
			return (new Array_1[Double](b as Long,1D));
		return x;
	}
	
	public static def sqrt(a:Double){
		return Math.sqrt(a);
		//return x;
		
	}
	
	public static def exp(a:Complex){
		return Math.exp(a);
		
	}
	
	public static def exp(a:Double){
		return Math.exp(a);
		
	}
	
	public static def ones (a:Double, b:Long){
		val x: Array_2[Long] = new Array_2[Long](a as Long, b as Long,1);
		//for (p in x.region)
		//	x(p) = 0.0;
		return x;
	}
	
	public static def sqrt(a:Long){
		return Math.sqrt(a);
		//return x;
		
	}
/*	
	public static def sqrt(a:Array_2[Long]){
		for (p in a.indices()){
			a(p) = Math.sqrt(a(p));
		}
		return a;
	}
*/	
	public static def mean(a:Array_2[Long]){
		var x:Long =0;
		var i:Long =0;
		for (p in a.indices()){
			x = x + a(p);
			i++;
		}
		return x/(i as Long);
			
	}
	
	public static def mean(a:Long){
		return a;
	}
	
	
	public static def fix(a:Long){
		if (a<0)
		return Math.ceil(a);
		else
			return Math.floor(a);
		//return x;
		
	}
	
	
	public static def floor(a:Long){
		
			return Math.floor(a);
		//return x;
		
	}
	
	public static def floor(a:Array_1[Double]){
		var x: Array_1[Double] = a;
		for (i in 0..(x.size-1))
			x(i) = Math.floor(x(i));
		return x;
		
	}
	
	public static def round(a:Long){
		return Math.round(a);
		
	}
	
	public static def abs(a:Long){
		return Math.abs(a);
		
	}
	
	public static def abs(a:Complex){
		return a.abs();
		
	}
	
	public static def lt(a:Long, b:Long){
		
		return a<b;
		
	}
	
	public static def gt(a:Long, b:Long){
		
		return a>b;
		
	}
	
	public static def le(a:Long, b:Long){
		
		return a<=b;
		
	}
	
	public static def uminus(a:Long){
		return -a;
		
	}
	
	public static def and(a:Boolean, b:Boolean){
		
		return (a && b); 
		
	}
	
	public static def i(){
		
		return Complex.I;
		
	}




/*******************DOUBLES***************************/

public static def getArray(a:x10.array.Array_2[Double]){
			return new x10.array.Array_2[Double](a.numElems_1,a.numElems_2);
	}
	
public static def getArray(a:x10.array.Array_1[Double]){
			return new x10.array.Array_1[Double](a.size);
	}	
/*	
	public static def rand(a:Double, b:Double){
		//r:Region = a as Int .. b as Int;
		val x: Array[Double] = new Array[Double]((1..a as Int)*(1..b as Int));
		val z = new Random();
		for (p in x.region)
			x(p) = z.nextDouble();
		return x;
		
	}
****/


public static def vertcat(a:Double, b:Double){
	val x:Array_2[Double] = new Array_2[Double](2,1);
	x(0,0) = a;
	x(1,0) = b;
	return x;
}


public static def vertcat[T](a:Array_1[T]){
	return a;
}

public static def vertcat(a:Array_1[Double], b:Array_1[Double]){
	val x:Array_2[Double] = new Array_2[Double](2,a.size);
	for (i in 0..(a.size-1)){
	x(0,i) = a(i);
	x(1,i) = b(i);
	}
	return x;
}


public static def vertcat(a:Array_2[Double], b:Array_1[Double]){
	val x:Array_2[Double] = new Array_2[Double](a.numElems_1 +1,b.size);
	//assert b.size == a.numElems_2 
	for (i in 0..(a.numElems_1-1)){
		for(j in 0..(a.numElems_2 -1)){
			x(i,j) = a(i,j);
		}
		
	}
	for (k in 0..(b.size -1))
		x(a.numElems_1,k) = b(k);
	return x;
}
public static def horzcat(a:Double, b:Double){
	val x:Array_1[Double] = new Array_1[Double](2);
	x(0) = a;
	x(1) = b;
	return x;
}


public static def horzcat(a:Array_2[Double], b:Array_2[Double]){
	val x:Array_2[Double] = new Array_2[Double](a.numElems_1, a.numElems_2 + b.numElems_2);
	for (i in 0..(a.numElems_1-1)){
		for (j in 0..(a.numElems_2 + b.numElems_2 -1)){
			if (j < a.numElems_2){
				x(i,j) = a(i,j);
			}
			else{
				x(i,j) = b(i,j);
			}
		}
	}
	
	return x;
}

public static def rand(a:Double, b:Double){
  
  val x: Array_2[Double] = new Array_2[Double](a as Long, b as Long);
  val z = new Random();
  var j: Long;
  for (i in 0..(((a-1) as Long) as Long)){
	for (h in 0..(((b-1) as Long) as Long)){
    x(i,h) = (z.nextDouble());
  }	
  }
  if (1 == a as Long){
  	val y: Array_1[Double] = new Array_1[Double](b as Long);
  	for (j=0 ; j < b as Long ; j++){
  		y(j) = x(0,j);
  	}
  	return y;
  }		
  return x;
      
}
public static def randn(a:Double, b:Double){
  
  val x: Array_2[Double] = new Array_2[Double](a as Long, b as Long);
  val z = new Random();
  var j: Long;
  for (i in x.indices()){
    x(i) = (z.nextDouble());
  }
  if (1 == a as Long){
  	val y: Array_1[Double] = new Array_1[Double](b as Long);
  	for (j=0 ; j < b as Long ; j++){
  		y(j) = x(0,j);
  	}
  	return y;
  }		
  return x;
      
}


	
	public static def minus(a:Double, b:Double){
		val x: Double;
		x = a-b;
		return x;
		
	}

/*	
	public static def minus(a:Array[Double], b:Double){
		val x = new Array[Double](a.region);
		for (p in a.region){
			x(p) = a(p)-b;
		}
		return x;
	}
*******/	

public static def minus(a:x10.array.Array_2[Double], b:Double){
		val x = getArray(a);
		for (p in 0..((x.numElems_1 -1) as Long)){
			for (q in 0..((x.numElems_2 -1) as Long))
				x(p,q) = a(p,q)-b;
		}
		return x;
	}

public static def minus(a:x10.array.Array_2[Double], b:Array_2[Double]){
	val x = getArray(a);
	for (p in 0..((x.numElems_1 -1) as Long)){
		for (q in 0..((x.numElems_2 -1) as Long))
			x(p,q) = a(p,q)-b(p,q);
	}
	return x;
}

	
/*	
	public static def horzcat(a:Array_2[Double], b:Double){
		val x = new Array_2[Double](a.numElems_1,a.numElems_2+1L);
		var i:Long;
		val sz:Long = a.numElems_1*a.numElems_2;
		for ( i=0; i<=(sz);i++){
			x(0,i) = a(0,i);
		}
		x(0,(sz+1L))=b;
		return x;
	}
*/	
	
	public static def horzcat(a:Array_1[Double], b:Double){
		val x = new Array_1[Double](a.size+1L);
		var i:Long;
		val sz:Long = a.size;
		for ( i=0; i<(sz);i++){
			x(i) = a(i);
		}
		x(sz)=b;
		return x;
	}
	
	public static def plus(a:Double, b:Double){ 
		val x: Double;
		x = a+b;
		return x;
		
	}
	
	public static def plus(a: Array_2[Double], b:Array_2[Double]){
		val x = getArray(a);
		for (p in 0..((x.numElems_1 -1) as Long)){
			for (q in 0..((x.numElems_2 -1) as Long))
				x(p,q) = a(p,q)+ b(p,q);
		}
		return x;
	}
	
	public static def plus(a: Double, b:Array_1[Double]){
		val x = getArray(b);
		for (p in 0..((b.size-1) as Long)){
			x(p) = b(p)+ a;
		}
		return x;
	}
/*	
	public static def plus(a:Complex, b:Complex){
		val x: Complex;
		x = a+b;
		return x;
		
	}
*/
	public static def mtimes(a:Double, b:Double){
		val x: Double;
		x = a*b;
		return x;
		
	}
	
	public static def mtimes(a:Double, b:Complex){
		val x: Complex = new Complex(a*b.re, a*b.im);
		
		return x;
		
	}
	
	public static def size(a:Array_2[Double], b: Double){
		if (b == 1D)
			return a.numElems_1 as Double;
		else 
			return a.numElems_2 as Double;
	}
	
	
	public static def eq[T](a:T, b:T){
		return (a==b);
	}
	
	public static def size[T](a:Array_1[T], b: Double){
		if (b == 1D)
			return 1L;
		else 
			return a.size;
	}
	public static def size[T](a:Array_1[T], b: Long){
		if (b == 1L)
			return 1L;
		else 
			return a.size;
	}
	public static def transpose(a:Array_2[Double]){
		if (a.numElems_2 ==1){
			val x:Array_1[Double] = new Array_1[Double](a.numElems_1);
			for (i in 0..(a.numElems_1 -1)){
				x(i) = a(i,0);
			}
			return x;
		}
		else{
			val x:Array_2[Double] = new Array_2[Double](a.numElems_2, a.numElems_1);
			for (i in 0..(a.numElems_1-1))
				for (j in 0..(a.numElems_2-1))
					
					x(j,i) = a(i,j);
			return x;
		}
	}
	
	public static def transpose(a:Array_1[Double]){
		
		{
			val x:Array_2[Double] = new Array_2[Double](a.size, 1);
			for (i in 0..(a.size-1))
				
					x(i,0) = a(i);
			return x;
		}
	}
	
	 public static def mtimes(a:Array_2[Double], b:Array_2[Double]){                                        
                val m: Long = a.numElems_1;
		val k: Long = a.numElems_2;
		val n: Long = b.numElems_2;                                                                
                val C:Array_2[Double] = new Array_2[Double](m,n);               
                                                                                
        	 for (i in 0..((m-1) as Long)) {                                      
                        for (h in 0..((n-1) as Long)){                                    
                                for (j in 0..((k-1) as Long)){                            
                                        C(i,h) = C(i,h)+a(i,j)*b(j,h);          
                                }                                               
                        }                                                       
                }                                                               
              val x: Double;
		if (m==1 && n==1)
		{
			x=C(0,0);
			return x;
		}	                                                                  
              return C;                                         
        }    
	 
	 
	 
	 public static def mtimes(a:Array_1[Double], b:Array_2[Double]){                                        
		 val m: Long = 1;
		 val k: Long = a.size;
		 val n: Long = b.numElems_2;                                                                
		 val C:Array_2[Double] = new Array_2[Double](m,n);               
		 
		 for (i in 0..((m-1) as Long)) {                                      
			 for (h in 0..((n-1) as Long)){                                    
				 for (j in 0..((k-1) as Long)){                            
					 C(i,h) = C(i,h)+a(j)*b(j,h);          
				 }                                               
			 }                                                       
		 }                                                               
		 val x: Double;
		 if (m==1 && n==1)
		 {
			 x=C(0,0);
			 return x;
		 }	                                                                  
		 return C;                                         
	 }
	 
	 public static def mtimes(a:Array_2[Long], b:Array_1[Double]){    
		 val b1:Array_2[Double] = new Array_2[Double](1, b.size);
		 for (i in 0..(b.size-1))
			 b1(0,i) = b(i);
		 
		 val m: Long = a.numElems_1;
		 val k: Long = a.numElems_2;
		 val n: Long = b1.numElems_2;                                                                
		 val C:Array_2[Double] = new Array_2[Double](m,n);               
		 
		 for (i in 0..((m-1) as Long)) async{                                      
			 for (h in 0..((k-1) as Long)){                                    
				 for (j in 0..((n-1) as Long)){                            
					 C(i,j) = C(i,j)+a(i,h)*b1(h,j);          
				 }                                               
			 }                                                       
		 }                                                               
		 val x: Double;
		 if (m==1 && n==1)
		 {
			 x=C(0,0);
			 return x;
		 }	                                                                  
		 return C;                                         
	 } 
	 
	 public static def mtimes_scalar(a:Array_2[Double], b:Array_2[Double]){                                        
                val m: Long = a.numElems_1;
		val k: Long = a.numElems_2;
		val n: Long = b.numElems_2;                                                                
                val C:Array_2[Double] = new Array_2[Double](m,n);               
                                                                                
        	 for (i in 0..((m-1) as Long)) async{                                      
                        for (h in 0..((k-1) as Long)){                                    
                                for (j in 0..((n-1) as Long)){                            
                                        C(i,j) = C(i,j)+a(i,h)*b(h,j);          
                                }                                               
                        }                                                       
                }                                                               
              return C(0,0);                                         
        }                 
	
/*
	public static def mtimes(a:Complex, b:Complex){
		val x: Complex;
		x = a*b;
		return x;
		
	}
*/	
	public static def mtimes(a:Complex, b:Double){
		val x: Complex;
		x = a*b;
		return x;
		
	}
	
	
	public static def any(a:Array_1[Double]){
		var x:Boolean = false;
		for (i in 0..(a.size -1)){
			x = x || (a(i) != 0D) ;
		}
		return x;
	}
	
	public static def times(a: Array_2[Double], b:Array_2[Double]){
		val x = getArray(a);
		for (p in 0..((a.numElems_1-1) as Long)){
			for (q in 0..((a.numElems_2-1) as Long))
			x(p,q) = a(p,q)*b(p,q);
		}
		return x;
	}
	/*******************
	public static def times(a: Array[Double], b:Array[Double])
	{a.rank == b.rank}{
		val x = new Array[Double](a.region);
		for (p in a.region){
			x(p) = a(p)* b(p);
		}
		return x;
	}
	***********************/
	
	public static def rdivide(a: Array_2[Double], b:Array_2[Double]){
		val x = getArray(a);
		for (p in 0..((a.numElems_1-1) as Long)){
			for (q in 0..((a.numElems_2-1) as Long))
			x(p,q) = a(p,q)/b(p,q);
		}
		return x;
	}
	/**
	public static def rdivide(a: Array[Double], b:Array[Double])
	{a.rank == b.rank}{
		val x = new Array[Double](a.region);
		for (p in a.region){
			x(p) = a(p)/ b(p);
		}
		return x;
	}
	**/
	
	public static def mrdivide(a: Array_2[Double], b:Double)
	{
		val x = getArray(a);
		for (p in 0..((a.numElems_1-1) as Long)){
			for (q in 0..((a.numElems_2-1) as Long))
			x(p,q) = a(p,q)/b;
		}
		return x;
	}
	
	
	public static def mrdivide(a: Array_1[Double], b:Double)
	{
		val x = getArray(a);
		for (p in 0..((a.size-1) as Long)){
			x(p) = a(p)/b;
		}
		return x;
	}
	
	public static def plus(a:x10.array.Array_2[Double], b:Double){
		val x = getArray(a);
		for (p in 0..((x.numElems_1-1) as Long)){
			for (q in 0..((x.numElems_2-1) as Long))
			x(p,q) = a(p,q)+b;
		}
		return x;
	}
	
	
	public static def plus(a:x10.array.Array_1[Double], b:Double){
		val x = getArray(a);
		for (p in 0..((x.size-1) as Long)){
			x(p) = a(p)+b;
		}
		return x;
	}
	/**
	public static def plus(a:Array[Double], b:Double){
		val x = new Array[Double](a.region);
		for (p in a.region){
			x(p) = a(p)+ b;
		}
		return x;
	}
	**/
	
	public static def plus(a:Double, b:Array_2[Double]){
		val x = getArray(b);
		for (p in 0..((b.numElems_1-1) as Long)){
			for (q in 0..((b.numElems_2-1) as Long))
			x(p,q) = a+b(p,q);
		}
		return x;
	}
	
	public static def rdivide(a:Double, b:Double)
	{
		
		return a/b;
	}
	
	
	public static def colon(a:Double, b:Double)
	{
		
		//return new Array[Double](1..1*1..((b-a+1) as Int), (i:Point(2))=>((i(1)+a as Int -1) as Long) as Double));
		/*
		val len:Long = b as Long - a as Long +1L;
		val x = new Array_2[Double](1L,len);
		var i:Long = 0;
		for (i=0; i<len; i++)
		{
			x(0L,i) = i + a as Long;
		}
		*/
		val len:Long = b as Long - a as Long +1L;
		val x = new Array_1[Double](len);
		var i:Long = 0;
		for (i=0; i<len; i++)
		{
			x(i) = i + a as Long;
		}
		return x;	
	}
	
	
	public static def colon(a:Double, s:Double, b:Double)
	{
		
		//return new Array[Double](1..1*1..((b-a+1) as Int), (i:Point(2))=>((i(1)+a as Int -1) as Long) as Double));
		/*
		 * val len:Long = b as Long - a as Long +1L;
		 * val x = new Array_2[Double](1L,len);
		 * var i:Long = 0;
		 * for (i=0; i<len; i++)
		 * {
		 * x(0L,i) = i + a as Long;
		 * }
		 */
		val len:Long = b as Long - a as Long +1L;
		val x = new Array_1[Double](len);
		var i:Long = 0;
		for (i=0; i<len; i++)
		{
			x(i) = i*s + a;
		}
		return x;	
	}
	
	public static def plus(a:Double, b:Complex){
		val x: Complex;
		x = a+b;
		return x;
		//return a+b;
	}
	public static def sin(a:Double){
		return Math.sin(a);
		//return x;
		
	}
	
	public static def cos(a:Double){
		return Math.cos(a);
		//return x;
		
	}
/*	
	public static def pi(){
		return Math.PI;
		//return x;
		
	}
*/
	public static def mrdivide(a:Double, b:Double){
		val x: Double;
		x = a/b;
		return x;
		
	}
	
	public static def length(a:Array[Double]){
		return a.size;
	}
	
	
	public static def mtimes(a:Double, b:Array_2[Double]){
		val x = getArray(b);
		for (p in 0..((b.numElems_1 - 1) as Long)){
			for (q in 0..((b.numElems_2 -1) as Long))
			x(p,q) = a*b(p,q);
		}
		return x;
	}
	
	public static def mtimes(a:Double, b:Array_1[Double]){
		val x = getArray(b);
		for (p in 0..((b.size -1) as Long)){
			x(p) = a*b(p);
		}
		return x;
	}
	/******
	public static def mtimes(a:Double, b:Array[Double]){
		val x: Array[Double] = new Array[Double](b.region);
		
		for (p in b.region)
		x(p) = a*b(p);
		
		return x;
		
	}
	********/
	
	public static def mtimes(a:Array_2[Double], b:Double){
		val x = getArray(a);
		for (p in 0..((a.numElems_1 - 1)as Long)){
			for (q in 0..((a.numElems_2 -1)as Long))
			x(p,q) = a(p,q)*b;
		}
		return x;
	}
	
	public static def mtimes(a:Array_1[Double], b:Double){
		val x = getArray(a);
		for (p in 0..((a.size-1) as Long)){
			x(p) = a(p)*b;
		}
		return x;
	}
	/*************
	public static def mtimes( b:Array[Double], a:Double){
		val x: Array[Double] = new Array[Double](b.region);
		
		for (p in b.region)
			x(p) = a*b(p);
		
		return x;
		
	}
	*************/
	
	public static def mpower(a:Double, b:Double){
		val x: Double;
		x = Math.pow(a,b);
		return x;
		
	}

public static def power(a:Double, b:Double){
val x: Double;
x = Math.pow(a,b);
return x;

}

public static def power(a:Long, b:Long){
val x: Long;
x = Math.pow(a,b) as Long;
return x;

}

public static def times(a:Long, b:Long){
val x: Long;
x = a*b;
return x;

}

public static def times(a:Double, b:Double){
	val x: Double;
	x = a*b;
	return x;

}
	
public static def mod(a:Double, b:Double){
	return a%b as Double;

}

public static def mod(a:Long, b:Long){
	return a%b ;

}

	public static def zeros (a:Double, b:Double){
		val x: Array_2[Double] = new Array_2[Double](a as Long, b as Long,0.0);
		//for (p in x.region)
		//	x(p) = 0.0;
		if (a == 1D)
			return new Array_1[Double](b as Long,0);
		else
		return x;
	}
	
	public static def zeros2 (a:Double, b:Double){
		val x: Array_2[Double] = new Array_2[Double](a as Long, b as Long,0.0);
		//for (p in x.region)
		//	x(p) = 0.0;
		
			return x;
	}
	
	public static def zeros (a:Double, b:Double, c:Double){
		val x: Array_3[Double] = new Array_3[Double](a as Long, b as Long,c as Long, 0.0);
		//for (p in x.region)
		//	x(p) = 0.0;
		
			return x;
	}
	
	public static def ones (a:Double, b:Double){
		val x: Array_2[Double] = new Array_2[Double](a as Long, b as Long,1.0);
		//for (p in x.region)
		//	x(p) = 0.0;
		
		if (a == 1D)
			return (new Array_1[Double](b as Long,1D));
		return x;
	}
	
	
	
	public static def sqrt(a:Array_2[Double]){
		for (p in 0..((a.numElems_1 -1) as Long)){
			for (q in 0..((a.numElems_2 -1) as Long))
			a(p,q) = Math.sqrt(a(p,q));
		}
		return a;
	}
	
	public static def mean(a:Array_2[Double]){
		var x:Double =0.0;
		var i:Long =0;
		for (p in 0..((a.numElems_1 -1) as long)){
			for (q in 0..((a.numElems_2 -1) as Long))
			x = x + a(p,q);
			i++;
		}
		return x/(i as Double);
			
	}
	
	public static def mean(a:Array_1[Double]){
		var x:Double =0.0;
		var i:Long =0;
		for (p in 0..((a.size -1) as long)){
			
				x = x + a(p);
			i++;
		}
		return x/(i as Double);
		
	}
	
	public static def mean(a:Double){
		return a;
	}
	
	
	public static def fix(a:Double){
		if (a<0)
		return ((Math.ceil(a)) as Long);
		else
			return ((Math.floor(a)) as Long);
		//return x;
		
	}
	
	
	public static def floor(a:Double){
		
			return Math.floor(a);
		//return x;
		
	}
	
	public static def round(a:Double){
		return ((Math.round(a)) as Long);
		
	}
	
	public static def abs(a:Double){
		return Math.abs(a);
		
	}
	/*
	public static def abs(a:Complex){
		return a.abs();
		
	}
	*/
	public static def lt(a:Double, b:Double){
		
		return a<b;
		
	}
	
	public static def gt(a:Double, b:Double){
		
		return a>b;
		
	}
	
	public static def le(a:Double, b:Double){
		
		return a<=b;
		
	}
	
	public static def ge(a:Double, b:Double){
		
		return a>=b;
		
	}
	
	
	public static def gt(a:Array_2[Double], b:Double){
		
		c:Array_2[Boolean] = new Array_2[Boolean](a.numElems_1, a.numElems_2, false);
	for (i in 0..(a.numElems_1-1))
		for (j in 0..(a.numElems_2-1))
			c(i,j) = a(i,j)>b;
	return c;		
		
	}
	
	public static def uminus(a:Double){
		return -a;
		
	}
	
	public static def uminus(a:Array_1[Double]){
		return mtimes(a,-1);
		
	}
	
/*	
	public static def and(a:Boolean, b:Boolean){
		
		return (a && b); 
		
	}
	
	public static def i(){
		
		return Complex.I;
		
	}
	
*/







	
}
