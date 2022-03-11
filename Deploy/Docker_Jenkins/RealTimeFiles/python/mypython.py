from random import randint

min = int(input("Enter the min element"))
max = int(input("Enter the max element"))

if(max<min):
    print("invalid imput- shutting down")
else:
    random = randint(min,max)
    print("random number based on input is : ", random)