
package x10.array;

import x10.array.*;
import x10.compiler.Inline;
import x10.compiler.NoInline;
import x10.compiler.NoReturn;
import x10.util.RailUtils;

public class Helper{
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

}

			
				


