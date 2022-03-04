-- Lua-hashings @89879fe79b6f3dc495c607494126ec9c3912b8e9 | /hashings/hmac.lua | https://github.com/user-none/lua-hashings | License: MIT License | Minified using https://www.npmjs.com/package/luamin/v/1.0.4
-- Copyright (c) 2016 John Schember
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
-- The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
local a=require("string")local b={}local c={__metatable={},__index=b}function b:new(d,e,f)local g;local h={}local i={}if self~=b then return nil,"First argument must be self"end;local j=setmetatable({},c)j._hm=d;if#e>d.block_size then g=d(e)e=g:digest()end;for k=1,#e do h[#h+1]=a.byte(e,k)end;for k=#e+1,d.block_size do h[#h+1]=0 end;j._opad={}for k=1,#h do i[k]=a.char(h[k]~0x36)j._opad[k]=a.char(h[k]~0x5C)end;i=table.concat(i)j._opad=table.concat(j._opad)j._hash=j._hm(i)if f~=nil then j._hash:update(f)end;return j end;setmetatable(b,{__call=b.new})function b:copy()local j=setmetatable({},c)j._hm=self._hm;j._hash=self._hash:copy()j._opad=self._opad;return j end;function b:update(f)self._hash:update(f)end;function b:digest()local l;local m;local g;l=self:copy()m=l._hash:digest()g=l._hm(l._opad)g:update(m)return g:digest()end;function b:hexdigest()local n;local o={}n=self:digest()for k=1,#n do o[k]=a.format("%02X",a.byte(n,k))end;return table.concat(o)end;return b