package regionArrayLib;

import x10.regionarray.*;
import x10.compiler.Inline;
import x10.compiler.NoInline;
import x10.compiler.NoReturn;
import x10.util.RailUtils;


public class Helper {
	
	// public static def getSubArray(
	// 			low_1:Long, high_1:Long, low_2:Long, high_2:Long, srcArray:Array[Double]){
	// 	
	// 	
	// 		val s:Long = ((high_1-low_1+1L)*(high_2-low_2+1L));
	// 		val sub:Array[Double] = new Array[Double](Region.make(0..((high_1-low_1+1L)-1),0..((high_2-low_2+1L)-1)));
	// 		for(i in low_1..high_1){
	// 			for(j in low_2..high_2){
	// 				sub(i-low_1, j-low_2) = srcArray(i-1,j-1);
	// 			}
	// 		}
	// 		
	// 		
	// 		return sub;
	// 	}
	
	
	public static def getSubArray(
			low_1:Long, high_1:Long, low_2:Long, high_2:Long, srcArray:Array[Double]){
		
		if(low_1 == high_1){
			var sz:Long = high_2-low_2+1; 
			val sub:Array[Double] = new Array[Double](sz);
			
			for(i in low_1..high_1){
				for(j in low_2..high_2){
					sub(j-low_2) = srcArray(i-1,j-1);
				}
			}
			return sub;
		}
		//val s:Long = ((high_1-low_1+1L)*(high_2-low_2+1L));
		val sub:Array[Double] = new Array[Double](Region.make(0..((high_1-low_1+1L)-1),0..((high_2-low_2+1L)-1)));
		for(i in low_1..high_1){
			for(j in low_2..high_2){
				sub(i-low_1, j-low_2) = srcArray(i-1,j-1);
			}
		}
		
		
		return sub;
	}

		public static def getSubArray(
				low_1:Long, high_1:Long, low_2:Long, high_2:Long,
				low_3:Long, high_3:Long, srcArray:Array[Double]){
			val s:Long = ((high_1-low_1+1L)*(high_2-low_2+1L)*(high_3-low_3+1L));
			val sub:Array[Double] = new Array[Double](Region.make(0..(high_1-low_1), 0..(high_2-low_2), 0..(high_3-low_3)));
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
				targetArray:Array[T], low_1:Long, high_1:Long, low_2:Long, high_2:Long, srcScalar:T){
			for (j in low_2..high_2){
				for (i in low_1..high_1){
					targetArray(i-1, j-1) = srcScalar;
				}
			}
			return targetArray;
		}
		
		// public static def setSubArray[T](
		// 		targetArray:Array[T], low_1:Double, high_1:Double, low_2:Long, high_2:Long, srcScalar:T){
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
		// 		targetArray:Array[T], low_1:Long, high_1:Long, low_2:Double, high_2:Double, srcScalar:T){
		// 	for (j in low_2..high_2){
		// 		for (i in low_1..high_1){
		// 			targetArray(i-1, j-1) = srcScalar;
		// 		}
		// 	}
		// 	return targetArray;
		// }
		
		// public static def setSubArray[T](
		// 		targetArray:Array[T], low_1:Long, high_1:Long, low_2:Long, high_2:Long, srcArray:Array[T]){
		// 	for (j in low_2..high_2){
		// 		for (i in low_1..high_1){
		// 			targetArray(i-1, j-1) = srcArray(i-low_1, j-low_2);
		// 		}
		// 	}
		// 	return targetArray;
		// }
		
		public static def setSubArray[T](
				targetArray:Array[T], low_1:Long, high_1:Long, low_2:Long, high_2:Long, srcArray:Array[T]){
			//assume target array is 2D
			assert(targetArray.region.rank ==2);
			
			if(srcArray.region.rank ==1){
				for (j in low_2..high_2){
					for (i in low_1..high_1){
						targetArray(i-1, j-1) = srcArray(j-1);
					}
				}
				
			}
			else{
			for (j in low_2..high_2){
				for (i in low_1..high_1){
					targetArray(i-1, j-1) = srcArray(i-low_1, j-low_2);
				}
			}
			}
			return targetArray;
		}
		
		public static def setSubArray[T](
				targetArray:Array[T], low_1:Long, high_1:Long, 
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
				targetArray:Array[T], low_1:Long, high_1:Long, 
				low_2:Long, high_2:Long, low_3:Long, high_3:Long, srcArray:Array[T]){
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
				targetArray:Array[T], low_1:Long, high_1:Long, srcVal:T){
			
				for (i in low_1..high_1){
					targetArray(i-1) = srcVal;
				}
			
			return targetArray;
		}
		
		

}