# Write a method that determines the mean (average) of the three scores passed to it, and returns the letter value associated with that grade.


'''
Input: three grades

Output: grade for the average

Rules


Data structure / Algorithms

    first determine the average grade
    then check the letter grade for the average

'''

def get_grade(g1, g2, g3):
    average = (g1 + g2 + g3) / 3

    if average >= 90:
        grade = 'A'
    elif average >= 80:
        grade = 'B'
    elif average >= 70:
        grade = 'C'
    elif average >= 60:
        grade = 'D'
    else:
        grade = 'F'

    return grade



print(get_grade(95, 90, 93) == "A")
print(get_grade(50, 50, 95) == "D")