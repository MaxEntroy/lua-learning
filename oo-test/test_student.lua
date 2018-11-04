-- 原型表
local StudentProtype = {
    name = "",
    age = 0
}

-- 原型表 对象共享函数
function StudentProtype:init(n, a)
    self.name = n
    self.age = a
end
function StudentProtype:print()
    print(self.name)
    print(self.age)
end

-- 原型表 绑定原型关系的函数，这个函数非常重要
function StudentProtype:new(student)
    student = student or {} -- 这里真正创建所谓的对象。其实就是一个表。表本来就是一个对象。但是下面会绑定原型关系。看上去是类的对象，不是独立的对象。
    setmetatable(student, {__index=self})
    return student
end

--------------
local student1 = StudentProtype:new() -- 写法是不是类似java c#这样的创建堆对象的语法
student1:init("kanglee", 28)
student1:print()

local student2 = StudentProtype:new()
student2:init("ruixin", 26)
student2:print()
