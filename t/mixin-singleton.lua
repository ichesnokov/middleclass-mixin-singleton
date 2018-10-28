#!/usr/bin/env lua
package.path = './?.lua;' .. package.path
require 'Test.More'

local class = require('middleclass')
local CoolClass = class('CoolClass'):include(require('middleclass.mixin.singleton'))

function CoolClass:initialize(version)
  self.name    = '-=[cool class]=-'
  self.version = version
end

ok(CoolClass, 'Construct CoolClass')

local obj1 = CoolClass:instance('1.0.2')
ok(obj1:isInstanceOf(CoolClass), 'First instance is an instance of SomeClass')
is(obj1.name, '-=[cool class]=-', '...and initialize() was called')
is(obj1.version, '1.0.2', '...and proper argument was passed to it')

local obj2 = CoolClass:instance()
ok(obj2:isInstanceOf(CoolClass), 'Second object is also a CoolClass instance')
ok(obj1 == obj2, 'Both instances are the same object')

error_like(
  CoolClass.new,
  'Use CoolClass:instance.*instead of :new',
  'We get a proper error if we try to construct an instance with :new()'
)

obj1.class:clear_instance()
local obj3 = CoolClass:instance('1.0.3')
is(obj3.version, '1.0.3', 'Instance was reinitialized after clearing')
ok(obj3 ~= obj2, 'New instance is not the same as the previous one')

done_testing()
