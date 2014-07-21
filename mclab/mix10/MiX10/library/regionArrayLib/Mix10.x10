package regionArrayLib;

import x10.lang.Math;
import x10.util.Random;
import x10.regionarray.Array;
import x10.regionarray.Region;
//import x10.array.*;
public class Mix10 {

public static def getArray(a:Array[Long]){
			return new Array[Long](a.region);
	}
	
// public static def getArray(a:x10.array.Array[Long]){
// 			return new x10.array.Array[Long](a.size);
// 	}	
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
  
  val x: Array[Double] = new Array[Double](Region.make(0..(a-1),0..(b-1)));
  val z = new Random();
  
  for (i in x.region){
    x(i) = (z.nextDouble());
  }
  // if (1 == a as Long){
  // 	val y: Array[Long] = new Array[Long](Region.make(0..(b-1)));
  // 	for (j in y){
  // 		y(j) = x(0,j);
  // 	}
  // 	return y;
  // }		
  return x;
      
}
public static def randn(a:Long, b:Long){
  
  val x: Array[Long] = new Array[Long](Region.make(0..(a-1),0..(b-1)));
  val z = new Random();
  var j: Long;
  for (i in x){
    x(i) = (z.nextLong());
  }
  if (1 == a as Long){
  	val y: Array[Long] = new Array[Long](b as Long);
  	for (j=0 ; j < b as Long ; j++){
  		y(j) = x(0,j);
  	}
  	return y;
  }		
  return x;
      
}
public static def randn_2(a:Long, b:Long){
  
  val x: Array[Long] = new Array[Long](Region.make(0..(a-1),0..(b-1)));
  val z = new Random();
  var j: Long;
  for (i in x.region){
    x(i) = (z.nextLong());
  }
  return x;
      
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

public static def minus(a:Array[Long], b:Long){
		val x = getArray(a);
		for (p in x.region){
			x(p) = a(p)-b;
		}
		return x;
	}
	
/*	
	public static def horzcat(a:Array[Long], b:Long){
		val x = new Array[Long](a.region.max(0)+1,a.region.max(1)+1+1L);
		var i:Long;
		val sz:Long = a.region.max(0)+1*a.region.max(1)+1;
		for ( i=0; i<=(sz);i++){
			x(0,i) = a(0,i);
		}
		x(0,(sz+1L))=b;
		return x;
	}
*/	
	
	public static def horzcat(a:Array[Long], b:Long){
		val x = new Array[Long](a.size+1L);
		var i:Long;
		val sz:Long = a.size;
		for ( i=0; i<(sz);i++){
			x(i) = a(i);
		}
		x(sz)=b;
		return x;
	}
	
	public static def horzcat(a:Rail[Long]){
		val x = new Array[Long](a);
		return x;
	}
	
	
	public static def horzcat(a:Rail[Double]){
		val x = new Array[Double](a);
		return x;
	}
	
	public static def min(a:Array[Double]){
		var min:Double = a(0);
		for (i in a.region){
			if(a(i)<min) min = a(i);
		}
		return min;
	}
	
	// public static def numel[T](a:Array[T]){
	// 	return (a.region.max(0)+1 * a.region.max(1)+1);
	// }
	
	public static def numel[T](a:Array[T]){
		return (a.size);
	}
	
	public static def horzcat(a:Array[Char], b:Array[Char]){
		return horzcat([a,b]);
	}
	
	public static def horzcat(a:Rail[Array[Char]]){
		var len:Long =0L;
		for (i in 0..(a.size-1)){
			len += a(i).size;
		}
		val x = new Array[Char](len);
		var tmp:Array[Char];  
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
	
	public static def plus(a: Array[Long], b:Array[Long]){
		val x = getArray(a);
		for (p in a.region){
			x(p) = a(p)+ b(p);
		}
		return x;
	}
	
	public static def plus(a: Long, b:Array[Long]){
		val x = getArray(b);
		for (p in b.region){
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
	
	 public static def mtimes(a:Array[Long], b:Array[Long]){                                        
                val m: Long = a.region.max(0)+1;
		val k: Long = a.region.max(1)+1;
		val n: Long = b.region.max(1)+1;                                                                
                val C:Array[Long] = new Array[Long](m,n);               
                                                                                
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
	 public static def mtimes_scalar(a:Array[Long], b:Array[Long]){                                        
                val m: Long = a.region.max(0)+1;
		val k: Long = a.region.max(1)+1;
		val n: Long = b.region.max(1)+1;                                                                
                val C:Array[Long] = new Array[Long](m,n);               
                                                                                
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
	
	public static def times(a: Array[Long], b:Array[Long]){
		val x = getArray(a);
		for (p in a.region){
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
	
	public static def rdivide(a: Array[Long], b:Array[Long]){
		val x = getArray(a);
		for (p in a.region){
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
	
	public static def mrdivide(a: Array[Long], b:Long)
	{
		val x = getArray(a);
		for (p in a.region){
			x(p) = a(p)/ b;
		}
		return x;
	}
	
	
	// public static def mrdivide(a: Array[Long], b:Long)
	// {
	// 	val x = getArray(a);
	// 	for (p in a.region){
	// 		x(p) = a(p)/ b;
	// 	}
	// 	return x;
	// }
	
	public static def plus(a:Array[Long], b:Long){
		val x = getArray(a);
		for (p in x.region){
			x(p) = a(p)+b;
		}
		return x;
	}
	
	
	// public static def plus(a:Array[Long], b:Long){
	// 	val x = getArray(a);
	// 	for (p in x.region){
	// 		x(p) = a(p)+b;
	// 	}
	// 	return x;
	// }
	/**
	public static def plus(a:Array[Long], b:Long){
		val x = new Array[Long](a.region);
		for (p in a.region){
			x(p) = a(p)+ b;
		}
		return x;
	}
	**/
	
	// public static def plus(a:Long, b:Array[Long]){
	// 	val x = getArray(b);
	// 	for (p in b.region){
	// 		x(p) = a+ b(p);
	// 	}
	// 	return x;
	// }
	
	public static def rdivide(a:Long, b:Long)
	{
		
		return a/b;
	}
	
	
	public static def colon(a:Long, b:Long)
	{
		
		//return new Array[Long](1..1*1..((b-a+1) as Int), (i:Point(2))=>((i(1)+a as Int -1) as Long));
		/*
		val len:Long = b as Long - a as Long +1L;
		val x = new Array[Long](1L,len);
		var i:Long = 0;
		for (i=0; i<len; i++)
		{
			x(0L,i) = i + a as Long;
		}
		*/
		val len:Long = b as Long - a as Long +1L;
		val x = new Array[Long](len);
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
	
	
	public static def mtimes(a:Long, b:Array[Long]){
		val x = getArray(b);
		for (p in b.region){
			x(p) = a*b(p);
		}
		return x;
	}
	
	// public static def mtimes(a:Long, b:Array[Long]){
	// 	val x = getArray(b);
	// 	for (p in b.region){
	// 		x(p) = a*b(p);
	// 	}
	// 	return x;
	// }
	/******
	public static def mtimes(a:Long, b:Array[Long]){
		val x: Array[Long] = new Array[Long](b.region);
		
		for (p in b.region)
		x(p) = a*b(p);
		
		return x;
		
	}
	********/
	
	public static def mtimes(a:Array[Long], b:Long){
		val x = getArray(a);
		for (p in a.region){
			x(p) = a(p)*b;
		}
		return x;
	}
		public static def mtimes(a:Array[Long], b:Double){
		val x: Array[Double] = new Array[Double](Region.make(0..a.region.max(0), 0..a.region.max(1)));
		//val x = getArray(a);
		for (p in a.region){
			x(p) = a(p)*b;
		}
		return x;
	}
		public static def mtimes(b:Double, a:Array[Long]){
		val x: Array[Double] = new Array[Double](Region.make(0..a.region.max(0), 0..a.region.max(1)));
		//val x = getArray(a);
		for (p in a.region){
			x(p) = a(p)*b;
		}
		return x;
	}
	
// 
// 	public static def mtimes(a:Array[Long], b:Long){
// 		val x = getArray(a);
// 		for (p in a.region){
// 			x(p) = a(p)*b;
// 		}
// 		return x;
// 	}
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
			return new Array[Double](b as Long,0);
		}
		
		val x: Array[Double] = new Array[Double](Region.make(0..(a as Long -1), 0..(b as Long-1)),0);
		//for (p in x.region)
		//	x(p) = 0.0;
		return x;
	}
	
	public static def ones (a:Long, b:Long){
		val x: Array[Double] = new Array[Double](Region.make(0..(a as Long -1), 0..(b as Long-1)),1.0);
		//for (p in x.region)
		//	x(p) = 0.0;
		
		if (a == 1)
			return (new Array[Double](b as Long,1D));
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
		val x: Array[Long] = new Array[Long](Region.make(0..(a as Long -1), 0..(b as Long-1)),1);
		//for (p in x.region)
		//	x(p) = 0.0;
		return x;
	}
	
	public static def sqrt(a:Long){
		return Math.sqrt(a);
		//return x;
		
	}
/*	
	public static def sqrt(a:Array[Long]){
		for (p in a.region){
			a(p) = Math.sqrt(a(p));
		}
		return a;
	}
*/	
	public static def mean(a:Array[Long]){
		var x:Long =0;
		var i:Long =0;
		for (p in a.region){
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

public static def getArray(a:Array[Double]){
			return new Array[Double](a.region);
	}
	
// public static def getArray(a:x10.array.Array[Double]){
// 			return new x10.array.Array[Double](a.size);
// 	}	
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
	val x:Array[Double] = new Array[Double](Region.make(0..1,0..0));
	x(0,0) = a;
	x(1,0) = b;
	return x;
}


public static def vertcat[T](a:Array[T]){
	return a;
}

// public static def vertcat(a:Array[Double], b:Array[Double]){
// 	val x:Array[Double] = new Array[Double](2,a.size);
// 	for (i in 0..(a.size-1)){
// 	x(0,i) = a(i);
// 	x(1,i) = b(i);
// 	}
// 	return x;
// }


public static def vertcat(a:Array[Double], b:Array[Double]){
	/*
	 * Works only if b is 1D.
	 * FIXIT
	 */
	var x:Array[Double];// = new Array[Double](Region.make(0..(a.region.max(0) +1),0..(b.size-1)));
	//assert b.size == a.region.max(1)+1 
	if(a.region.rank ==1){
		x = new Array[Double](Region.make(0..1,0..(b.size-1)));
		for(j in 0..(a.region.max(0)+1 -1)){
			x(0,j) = a(j);
		}
		for (k in 0..(b.size -1))
			x(1,k) = b(k);
		return x;
	}
	else if (a.region.rank ==2){
		x = new Array[Double](Region.make(0..(a.region.max(0) +1),0..(b.size-1)));
		for(i in a.region){
			x(i) = a(i);
		}
		
		for (k in 0..(b.size -1))
			x(a.region.max(0)+1,k) = b(k);
		return x;
	}
	
	
	return null;
}


public static def horzcat(a:Double, b:Double){
	val x:Array[Double] = new Array[Double](2);
	x(0) = a;
	x(1) = b;
	return x;
}


public static def horzcat(a:Array[Double], b:Array[Double]){
	val x:Array[Double] = new Array[Double](Region.make(0..a.region.max(0), 0..(a.region.max(1)+1 + b.region.max(1)+1 -1)));
	for (i in 0..(a.region.max(0)+1-1)){
		for (j in 0..(a.region.max(1)+1 + b.region.max(1)+1 -1)){
			if (j < a.region.max(1)+1){
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
	val a1 = a as Long;
	val b1 = b as Long;
  
  val x: Array[Double] = new Array[Double](Region.make(0..(a as Long -1), 0..(b as Long-1)));
  val z = new Random();
  var j: Long;
  for (i in 0..(((a-1) as Long) )){
	for (h in 0..(((b-1) as Long))){
    x(i,h) = (z.nextDouble());
  }	
  }
  if (1 == a as Long){
  	val y: Array[Double] = new Array[Double](b as Long);
  	for (j=0 ; j < b as Long ; j++){
  		y(j) = x(0,j);
  	}
  	return y;
  }		
  return x;
      
}
public static def randn(a:Double, b:Double){
  
  val x: Array[Double] = new Array[Double](Region.make(0..(a as Long -1), 0..(b as Long-1)));
  val z = new Random();
  var j: Long;
  for (i in x.region){
    x(i) = (z.nextDouble());
  }
  if (1 == a as Long){
  	val y: Array[Double] = new Array[Double](b as Long);
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

public static def minus(a:Array[Double], b:Double){
		val x = getArray(a);
		for (p in x.region){
				x(p) = a(p)-b;
		}
		return x;
	}

public static def minus(a:Array[Double], b:Array[Double]){
	val x = getArray(a);
	for (p in x.region){
		x(p) = a(p)-b(p);
	}
	return x;
}

	
/*	
	public static def horzcat(a:Array[Double], b:Double){
		val x = new Array[Double](a.region.max(0)+1,a.region.max(1)+1+1L);
		var i:Long;
		val sz:Long = a.region.max(0)+1*a.region.max(1)+1;
		for ( i=0; i<=(sz);i++){
			x(0,i) = a(0,i);
		}
		x(0,(sz+1L))=b;
		return x;
	}
*/	
	
	public static def horzcat(a:Array[Double], b:Double){
		val x = new Array[Double](Region.make(0..(a.size+1L-1)));
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
	
	public static def plus(a: Array[Double], b:Array[Double]){
		val x = getArray(a);
		for (p in 0..((x.region.max(0)+1 -1) as Long)){
			for (q in 0..((x.region.max(1)+1 -1) as Long))
				x(p,q) = a(p,q)+ b(p,q);
		}
		return x;
	}
	
	public static def plus(a: Double, b:Array[Double]){
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
	
	public static def size(a:Array[Double], b: Double){
		if (b == 1D)
			return a.region.max(0)+1 as Double;
		else 
			return a.region.max(1)+1 as Double;
	}
	
	
	public static def eq[T](a:T, b:T){
		return (a==b);
	}
	
	public static def size[T](a:Array[T], b: Double){
		if (b == 1D)
			return 1L;
		else 
			return a.size;
	}
	public static def size[T](a:Array[T], b: Long){
		if (b == 1L)
			return 1L;
		else 
			return a.size;
	}
	public static def transpose(a:Array[Double]){
		
		if(a.region.rank ==1){
			val x:Array[Double] = new Array[Double](Region.make(0..a.region.max(0), 0..0));
			for (i in 0..(a.region.max(0)+1-1)){
				x(i,0) = a(i);
			}
			return x;
				
		}
		
		
			val x:Array[Double] = new Array[Double](Region.make(0..a.region.max(1), 0..a.region.max(0)));
			for (i in 0..(a.region.max(0)+1-1))
				for (j in 0..(a.region.max(1)+1-1))
					
					x(j,i) = a(i,j);
			return x;
		
	}
	
	// public static def transpose(a:Array[Double]){
	// 	
	// 	{
	// 		val x:Array[Double] = new Array[Double](a.size, 1);
	// 		for (i in 0..(a.size-1))
	// 			
	// 				x(i,0) = a(i);
	// 		return x;
	// 	}
	// }
	
	 public static def mtimes(a:Array[Double], b:Array[Double]){                                        
                val m: Long = a.region.max(0)+1;
		val k: Long = a.region.max(1)+1;
		val n: Long = b.region.max(1)+1;                                                                
                val C:Array[Double] = new Array[Double](Region.make(0..(m-1),0..(n-1)));               
                                                                                
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
	 
	 
	 
	 // public static def mtimes(a:Array[Double], b:Array[Double]){                                        
		//  val m: Long = 1;
		//  val k: Long = a.size;
		//  val n: Long = b.region.max(1)+1;                                                                
		//  val C:Array[Double] = new Array[Double](m,n);               
		//  
		//  for (i in 0..((m-1) as Long)) {                                      
		// 	 for (h in 0..((n-1) as Long)){                                    
		// 		 for (j in 0..((k-1) as Long)){                            
		// 			 C(i,h) = C(i,h)+a(j)*b(j,h);          
		// 		 }                                               
		// 	 }                                                       
		//  }                                                               
		//  val x: Double;
		//  if (m==1 && n==1)
		//  {
		// 	 x=C(0,0);
		// 	 return x;
		//  }	                                                                  
		//  return C;                                         
	 // }
	 
	 public static def mtimes(a:Array[Long], b:Array[Double]){    
		 val m: Long = a.region.max(0)+1;
		 val k: Long = a.region.max(1)+1;
		 val n: Long = b.region.max(1)+1;                                                                
		 val C:Array[Double] = new Array[Double](Region.make(0..(m-1),0..(n-1)));               
		 
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
	 
	 public static def mtimes_scalar(a:Array[Double], b:Array[Double]){                                        
                val m: Long = a.region.max(0)+1;
		val k: Long = a.region.max(1)+1;
		val n: Long = b.region.max(1)+1;                                                                
                val C:Array[Double] = new Array[Double](Region.make(0..(m-1),0..(n-1)));               
                                                                                
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
	
	
	public static def any(a:Array[Double]){
		var x:Boolean = false;
		for (i in a.region){
			x = x || (a(i) != 0D) ;
		}
		return x;
	}
	
	public static def times(a: Array[Double], b:Array[Double]){
		assert (a.size == b.size && a.region.max(0) == b.region.max(0) && a.region.max(1) == b.region.max(1)):"FUCK";
		val x = getArray(a);
		assert (x.size == b.size && x.region.max(0) == b.region.max(0) && x.region.max(1) == b.region.max(1)):"FUCK FUCK";
		for(p in a.region){
			x(p) = a(p);//*b(p);
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
	
	public static def rdivide(a: Array[Double], b:Array[Double]){
		val x = getArray(a);
		for (p in 0..((a.region.max(0)+1-1) as Long)){
			for (q in 0..((a.region.max(1)+1-1) as Long))
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
	
	public static def mrdivide(a: Array[Double], b:Double)
	{
		val x = getArray(a);
		for(p in x.region){
			x(p) = a(p)/b;
		}
		return x;
	}
	
	
	// public static def mrdivide(a: Array[Double], b:Double)
	// {
	// 	val x = getArray(a);
	// 	for (p in 0..((a.size-1) as Long)){
	// 		x(p) = a(p)/b;
	// 	}
	// 	return x;
	// }
	
	public static def plus(a:Array[Double], b:Double){
		val x = getArray(a);
		for(p in x.region){
			x(p) = a(p)+b;
		}
		return x;
	}
	
	
	// public static def plus(a:x10.array.Array[Double], b:Double){
	// 	val x = getArray(a);
	// 	for (p in 0..((x.size-1) as Long)){
	// 		x(p) = a(p)+b;
	// 	}
	// 	return x;
	// }
	/**
	public static def plus(a:Array[Double], b:Double){
		val x = new Array[Double](a.region);
		for (p in a.region){
			x(p) = a(p)+ b;
		}
		return x;
	}
	**/
	
	// public static def plus(a:Double, b:Array[Double]){
	// 	val x = getArray(b);
	// 	for (p in 0..((b.region.max(0)+1-1) as Long)){
	// 		for (q in 0..((b.region.max(1)+1-1) as Long))
	// 		x(p,q) = a+b(p,q);
	// 	}
	// 	return x;
	// }
	
	public static def rdivide(a:Double, b:Double)
	{
		
		return a/b;
	}
	
	
	public static def colon(a:Double, b:Double)
	{
		
	
		val len:Long = b as Long - a as Long +1L;
		val x = new Array[Double](Region.make(0..(len-1)));
		var i:Long = 0;
		for (i=0; i<len; i++)
		{
			x(i) = i + a as Long;
		}
		return x;	
	}
	
	
	public static def colon(a:Double, s:Double, b:Double)
	{
		
		
		val len:Long = b as Long - a as Long +1L;
		val x = new Array[Double](Region.make(0..(len-1)));
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
		return a.region.size();
	}
	
	
	public static def mtimes(a:Double, b:Array[Double]){
		val x = getArray(b);
		for (p in x.region){
			x(p) = a*b(p);
		}
		return x;
	}
	
	// public static def mtimes(a:Double, b:Array[Double]){
	// 	val x = getArray(b);
	// 	for (p in 0..((b.size -1) as Long)){
	// 		x(p) = a*b(p);
	// 	}
	// 	return x;
	// }
	/******
	public static def mtimes(a:Double, b:Array[Double]){
		val x: Array[Double] = new Array[Double](b.region);
		
		for (p in b.region)
		x(p) = a*b(p);
		
		return x;
		
	}
	********/
	
	public static def mtimes(a:Array[Double], b:Double){
		val x = getArray(a);
		for(p in a.region){
			x(p) = a(p)*b;
		}
		return x;
	}
	
	// public static def mtimes(a:Array[Double], b:Double){
	// 	val x = getArray(a);
	// 	for (p in 0..((a.size-1) as Long)){
	// 		x(p) = a(p)*b;
	// 	}
	// 	return x;
	// }
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

	public static def zeros (a:Double, b:Double){
		val x: Array[Double] = new Array[Double](Region.make(0..(a as Long -1), 0..(b as Long -1)), 0.0);
		//for (p in x.region)
		//	x(p) = 0.0;
		if (a == 1D)
			return new Array[Double](Region.make(0..(b as Long-1)),0);
		else
		return x;
	}
	
	public static def zeros2 (a:Double, b:Double){
		val x: Array[Double] = new Array[Double](Region.make(0..(a as Long -1), 0..(b as Long -1)), 0.0);
		//for (p in x.region)
		//	x(p) = 0.0;
		
			return x;
	}
	
	public static def zeros (a:Double, b:Double, c:Double){
		val x: Array[Double] = new Array[Double](Region.make(0..(a as Long -1), 0..(b as Long -1), 0..(c as Long -1)), 1.0);
		//for (p in x.region)
		//	x(p) = 0.0;
		
			return x;
	}
	
	public static def ones (a:Double, b:Double){
		val x: Array[Double] = new Array[Double](Region.make(0..(a as Long -1), 0..(b as Long -1)), 1.0);
		//for (p in x.region)
		//	x(p) = 0.0;
		
		if (a == 1D)
			return (new Array[Double](Region.make(0..(b as Long-1)),1D));
		return x;
	}
	
	
	
	public static def sqrt(a:Array[Double]){
		for(p in a.region){
			a(p) = Math.sqrt(a(p));
		}
		return a;
	}
	
	public static def mean(a:Array[Double]){
		var x:Double =0.0;
		var i:Long =0;
		for(p in a.region){
			x = x + a(p);
			i++;
		}
		return x/(i as Double);
			
	}
	
	// public static def mean(a:Array[Double]){
	// 	var x:Double =0.0;
	// 	var i:Long =0;
	// 	for (p in 0..((a.size -1) as long)){
	// 		
	// 			x = x + a(p);
	// 		i++;
	// 	}
	// 	return x/(i as Double);
	// 	
	// }
	
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
	
	
	public static def gt(a:Array[Double], b:Double){
		
		c:Array[Boolean] = new Array[Boolean](a.region, false);
	for (i in a.region)
			c(i) = a(i)>b;
	return c;		
		
	}
	
	public static def uminus(a:Double){
		return -a;
		
	}
	
	public static def uminus(a:Array[Double]){
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
