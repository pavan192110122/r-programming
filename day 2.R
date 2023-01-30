#program 1

v1<-c(1,2,6,8,9)
v1
v2<-c(5,9,7,6)
v2
res=array(c(v1,v2),dim<-c(3,3,2))
res
res[2,,2]
res[3,3,1] 


#program 2

num1 = rbind(rep("A",3), rep("B",3), rep("C",3))
print("num1")
print(num1)
num2 = rbind(rep("P",3), rep("Q",3), rep("R",3))
print("num2")
print(num2)
num3 = rbind(rep("X",3), rep("Y",3), rep("Z",3))
print("num3")
print(num3)
a = matrix(t(cbind(num1,num2,num3)),ncol=3, byrow=T)
print("Combine three arrays, taking one row from each one by one:")
print(a)


#program 3

array1=array(1:30,dim=c(3,5,2))
array1

#program 4

a<-array(seq(from=50,length.out=2,by=2),c(5,3))
a

#program 5

exam=data.frame(name=c("anastasia","dima","katherine","james","emaily","michael","mathew","laura","kevin","jonas"),
score=c(9,5,6,5,7,5,8,5,7,7),attempt=c(1,8,2,2,2,2,6,2,5,2),quali=c("yes","no","yes","no","yes","no","yes","no","yes","no"))
exam
exam[c(3,5),c(1,3)]

#program 6

exam$country=c("USA","USA","USA","USA","USA","india","USA","india","india","india")
exam

#program 7

new=data.frame(name=c("hari","prasad"),score=c(8,9),attempt=c(1,2),quali=c("yes","no"),country=c("south africa","india"))
exam1=rbind(exam,new)
exam1

#program 8

res=subset(exam1,select=c(name,score))
res



#program 10

a<-airquality

res1=subset(a,select=-c(Solar.R,Wind))
res1

#program 11

data = women
print("Women data set of height and weights:")
print(data)
height_f = cut(women$height,3)
print("Factor corresponding to height:")
print(table(height_f))


#program 12

L = sample(LETTERS,size=50,replace=TRUE)
print("Original data:")
print(L)
f = factor(L)
print("Original factors:")
print(f)
print("Only five of the levels")
print(table(L[1:5]))