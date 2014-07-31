MODULE mod_ones
INTERFACE ones
MODULE PROCEDURE ones_1, ones_2, ones_3, ones_ii, ones_di, ones_id ! may be more
END INTERFACE ones

CONTAINS

FUNCTION ones_1(x)
IMPLICIT NONE
DOUBLE PRECISION, INTENT(IN) :: x
DOUBLE PRECISION, DIMENSION(INT(x),INT(x)) :: ones_1
INTEGER :: i, j
DO i = 1, INT(x)
	DO j = 1, INT(x)
		ones_1(i,j) = 1.0;
	END DO
END DO

END FUNCTION ones_1

FUNCTION ones_2(x,y)
IMPLICIT NONE
DOUBLE PRECISION, INTENT(IN) :: x, y
DOUBLE PRECISION, DIMENSION(INT(x),INT(y)) :: ones_2
INTEGER :: i, j
DO i = 1, INT(x)
	DO j = 1, INT(y)
		ones_2(i,j) = 1.0;
	END DO
END DO
END FUNCTION ones_2

FUNCTION ones_id(x,y)
IMPLICIT NONE
INTEGER, INTENT(IN) :: x
DOUBLE PRECISION, INTENT(IN) :: y
DOUBLE PRECISION, DIMENSION(x,INT(y)) :: ones_id
INTEGER :: i, j
DO i = 1, x
	DO j = 1, INT(y)
		ones_id(i,j) = 1.0;
	END DO
END DO
END FUNCTION ones_id

FUNCTION ones_di(x,y)
IMPLICIT NONE
DOUBLE PRECISION, INTENT(IN) :: x
INTEGER, INTENT(IN) :: y
DOUBLE PRECISION, DIMENSION(INT(x),y) :: ones_di
INTEGER :: i, j
DO i = 1, INT(x)
	DO j = 1, y
		ones_di(i,j) = 1.0;
	END DO
END DO
END FUNCTION ones_di

FUNCTION ones_ii(x,y)
IMPLICIT NONE
INTEGER, INTENT(IN) :: x, y
DOUBLE PRECISION, DIMENSION(x,y) :: ones_ii
INTEGER :: i, j
DO i = 1, x
	DO j = 1, y
		ones_ii(i,j) = 1.0;
	END DO
END DO
END FUNCTION ones_ii

FUNCTION ones_3(x,y,z)
IMPLICIT NONE
DOUBLE PRECISION, INTENT(IN) :: x, y, z
DOUBLE PRECISION, DIMENSION(INT(x),INT(y),INT(z)) :: ones_3
INTEGER :: i, j, k
DO i = 1, INT(x)
	DO j = 1, INT(y)
		DO k = 1, INT(z)
			ones_3(i,j,k) = 1.0;
		END DO
	END DO
END DO

END FUNCTION ones_3

END MODULE mod_ones
