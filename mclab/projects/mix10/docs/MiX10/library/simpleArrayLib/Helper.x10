package simpleArrayLib;

import x10.array.*;
import x10.compiler.Inline;
import x10.compiler.NoInline;
import x10.compiler.NoReturn;
import x10.util.RailUtils;


public class Helper {
	
	public static def getSubArray(
			low_1:Long, high_1:Long, srcArray:Array_1[Double]){
		
		
		val sub:Array_1[Double] = new Array_1[Double]((high_1-low_1+1L));
		for(i in low_1..high_1){
			
				sub(i-low_1) = srcArray(i-1);
			
		}
		
		
		return sub;
	}
	
	public static def getSubArray[T](
				low_1:Long, high_1:Long, low_2:Long, high_2:Long, srcArray:Array_2[T]){
		
		
			val s:Long = ((high_1-low_1+1L)*(high_2-low_2+1L));
			val sub:Array_2[T] = new Array_2[T]((high_1-low_1+1L),(high_2-low_2+1L));
			for(i in low_1..high_1){
				for(j in low_2..high_2){
					sub(i-low_1, j-low_2) = srcArray(i-1,j-1);
				}
			}
			
			
			return sub;
		}
	
	
	public static def getSubArray(
			low_1:Long, high_1:Long, low_2:Long, high_2:Long, srcArray:Array_2[Double]){
		
		if(low_1 == high_1){
			var sz:Long = high_2-low_2+1; 
			val sub:Array_1[Double] = new Array_1[Double](sz);
			
			for(i in low_1..high_1){
				for(j in low_2..high_2){
					sub(j-low_2) = srcArray(i-1,j-1);
				}
			}
			return sub;
		}
		val s:Long = ((high_1-low_1+1L)*(high_2-low_2+1L));
		val sub:Array_2[Double] = new Array_2[Double]((high_1-low_1+1L),(high_2-low_2+1L));
		for(i in low_1..high_1){
			for(j in low_2..high_2){
				sub(i-low_1, j-low_2) = srcArray(i-1,j-1);
			}
		}
		
		
		return sub;
	}

		public static def getSubArray[T](
				low_1:Long, high_1:Long, low_2:Long, high_2:Long,
				low_3:Long, high_3:Long, srcArray:Array_3[T]){
			val s:Long = ((high_1-low_1+1L)*(high_2-low_2+1L)*(high_3-low_3+1L));
			val sub:Array_3[T] = new Array_3[T]((high_1-low_1+1L), (high_2-low_2+1L), (high_3-low_3+1L));
			for(i in low_1..high_1){
				for(j in low_2..high_2){
					for(k in low_3..high_3){
						sub(i-low_1, j-low_2, k-low_3) = srcArray(i-1,j-1,k-1);
					}
				}
			}
			return sub;
		}
		
		//setSubArray(p, mc_t7, mc_t7, mc_t0(0), mc_t0(mc_t0.size -1), x)
		
		public static def setSubArray[T](
				targetArray:Array_2[T], low_1:Long, high_1:Long, low_2:Long, high_2:Long, srcScalar:T){
			for (j in low_2..high_2){
				for (i in low_1..high_1){
					targetArray(i-1, j-1) = srcScalar;
				}
			}
			return targetArray;
		}
		
		// public static def setSubArray[T](
		// 		targetArray:Array_2[T], low_1:Double, high_1:Double, low_2:Long, high_2:Long, srcScalar:T){
		// 
		// 	
		// 	for (j in low_2..high_2){
		// 		for (i in low_1..high_1){
		// 			targetArray(i-1, j-1) = srcScalar;
		// 		}
		// 	}
		// 	return targetArray;
		// }
		// 
		// public static def setSubArray[T](
		// 		targetArray:Array_2[T], low_1:Long, high_1:Long, low_2:Double, high_2:Double, srcScalar:T){
		// 	for (j in low_2..high_2){
		// 		for (i in low_1..high_1){
		// 			targetArray(i-1, j-1) = srcScalar;
		// 		}
		// 	}
		// 	return targetArray;
		// }
		
		public static def setSubArray[T](
				targetArray:Array_2[T], low_1:Long, high_1:Long, low_2:Long, high_2:Long, srcArray:Array_2[T]){
			for (j in low_2..high_2){
				for (i in low_1..high_1){
					targetArray(i-1, j-1) = srcArray(i-low_1, j-low_2);
				}
			}
			return targetArray;
		}
		
		public static def setSubArray[T](
				targetArray:Array_2[T], low_1:Long, high_1:Long, low_2:Long, high_2:Long, srcArray:Array_1[T]){
			//TODO: Add assertion on low_1 and high_1
			for (j in low_2..high_2){
				for (i in low_1..high_1){
					targetArray(i-1, j-1) = srcArray(j-1);
				}
			}
			return targetArray;
		}
		
		public static def setSubArray[T](
				targetArray:Array_3[T], low_1:Long, high_1:Long, 
				low_2:Long, high_2:Long, low_3:Long, high_3:Long, srcScalar:T){
			for (k in low_3..high_3){
				for (j in low_2..high_2){
					for (i in low_1..high_1){
						targetArray(i-1, j-1, k-1) = srcScalar;
					}
				}
			}
			return targetArray;
		}
		
		public static def setSubArray[T](
				targetArray:Array_3[T], low_1:Long, high_1:Long, 
				low_2:Long, high_2:Long, low_3:Long, high_3:Long, srcArray:Array_3[T]){
			for (k in low_3..high_3){
				for (j in low_2..high_2){
					for (i in low_1..high_1){
						targetArray(i-1, j-1, k-1) = srcArray(i-low_1, j-low_2, k-low_3);
					}
				}
			}
			return targetArray;
		}
		
		public static def setSubArray[T](
				targetArray:Array_1[T], low_1:Long, high_1:Long, srcVal:T){
			
				for (i in low_1..high_1){
					targetArray(i-1) = srcVal;
				}
			
			return targetArray;
		}
		
		

}