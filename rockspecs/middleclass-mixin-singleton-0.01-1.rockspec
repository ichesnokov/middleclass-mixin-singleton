package = "middleclass-mixin-singleton"
version = "0.01-1"

source = {
   url = "https://github.com/ichesnokov/middleclass-mixin-singleton/archive/v0.01.zip",
   dir = "middleclass-mixin-singleton-0.01",
}

description = {
   summary = "Singleton mixin for middleclass.",
   detailed = "Mixin that allows you to create singleton objects using middleclass.",
   homepage = "https://github.com/middleclass-mixin-singleton",
   license = "Under the the same terms as Lua itself"
}

dependencies = {
    "lua >= 5.1",
    -- middleclass is also needed, but is not a dependency per se
}

build = {
   type = "builtin",
   modules = {
      ["middleclass.mixin.singleton"] = "middleclass/mixin/singleton.lua",
   }
}
