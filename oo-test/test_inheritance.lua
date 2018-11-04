--test-inheritance.lua

-- Person原型表
local Person = {
    name = "null",
    age = 0
}

function Person:init(n, a)
    self.name = n
    self.age = a
end
function Person:print()
    print(self.name)
    print(self.age)
end

function Person:new(person)
    person = person or {}
    setmetatable(person, {__index=self})
    return person
end

----------------------------------
-- Student原型表

local Student = Person:new()

function Student:new(student)
    student = student or {}
    self.grade = 1

    setmetatable(student, {__index=self})
    return student
end

function Student:init(n, a, g)
    self.name = n
    self.age = a
    self.grade = g
end
function Student:print()
    print(self.name)
    print(self.age)
    print(self.grade)
    print("--------------")
end

----------------------------------
local student1 = Student:new() -- 写法是不是类似java c#这样的创建堆对象的语法
student1:print()
student1:init("kanglee", 28, 98)
student1:print()

local student2 = Student:new()
student2:print()
student2:init("ruixin", 26, 99)
student2:print()