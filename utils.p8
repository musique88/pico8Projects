pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
--_function()

function _init()
	p1 = mkplayer(64,64,1,1)
end

function _update()
	cls()
	p1:update()
end

function _draw()
 p1:draw()
end
-->8
--mkplayer

function mkplayer(x,y,speed,s)
	p = {
	x=x,
	y=y,
	speed=speed,
	s=s,
	update=function(self)
		pos = move_8d(self.speed)
		self.x += pos[1]
		self.y += pos[2]
	end,
	draw=function(self)
		spr(self.s, self.x, self.y)
	end
	}
	return p
end
-->8
--!!real utils!!

function move_8d(s)
	local l = btn(0,0)
	local r = btn(1,0)
	local u = btn(2,0)
	local d = btn(3,0)
	local o = 0.54
	local x = 0
	local y = 0
	if (u and r and l and not d) then
		y = -s
	elseif (u and r and d and not l) then
		x = s
	elseif (u and l and d and not r) then
		x = -s
	elseif (d and r and l and not u) then
		y = s
	elseif (r and u and not(d and l)) then
		x = o * s
		y = -(o * s)
	elseif (r and d and not(u and l)) then
		x = o * s
		y = o * s
	elseif (l and u and not(d and r)) then
		x = -(o * s)
		y = -(o * s)
	elseif (l and d and not(u and r)) then
		x = -(o * s)
		y = o * s
	elseif (l and not(d and u and r)) then
		x = -s
	elseif (r and not(l and u and d)) then
		x = s
	elseif (u and not(l and r and d)) then
		y = -s
	elseif (d and not(u and r and l)) then
		y = s
	else
		y = 0
		x = 0
	end
	pos = {x,y}
	return pos
end
__gfx__
00000000666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000666666660000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
