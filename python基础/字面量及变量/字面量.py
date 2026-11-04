#字面量的写法
# print(100) #整数(int)
# print(11.24) #浮点数/小数(float)
# print(True) #布尔(bool)
# print(False) #布尔(bool)
# print('python') #字符串(str)
# print('----------') #字符串(str)
# print(None) #空值(None Type)
#
# #布尔类型也是一种整数类型(True-1 , False-0)
# print(True+1) #2
# print(False-1) #-1

#   ('True')  (True) 这两个本质不同，第一个是字符串类型，第二个是bool类型

#变量------python是动态类型语言，一个变量可以存储不同类型的数据(但是在项目开发中，推荐一个变量存储一种类型数据)
num = 11.24
print( num )
num = num +1
print(num)
num = 'OK'
print(num)
num = True
print(num)


# 案例
base = 20.7 #基础播放量
incr = 50 #每个月的新增播放量
print('未来第一个月的播放总量：',base + incr)
print('未来第二个月的播放总量',base + incr + incr)

#案例------升级，一次可以定义多个变量
base,incr = 20.7,50
print('未来第一个月的播放总量：',base + incr)
print('未来第二个月的播放总量',base + incr + incr)

#标识符
