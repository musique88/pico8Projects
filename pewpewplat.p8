pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
actors = {}
bullets = {}

function mkactor(x,y,r,s,maxvx,grav,jumpspeed,pnum)
	local a = {
	x=x,
 y=y,
 flipx=r,
 s=s,
 vx=0,
 maxvx=maxvx,
 vy=0,
 maxvy=2,
 w=8,
 h=8,
 grav=grav,
 jumpspeed=jumpspeed,
 pnum=pnum,
 update=function(self)
 	local bl=btn(0,self.pnum)
 	local br=btn(1,self.pnum)
 	local bu=btn(2,self.pnum)
 	local bd=btn(3,self.pnum)
 	self.vx=0
 	if bl then
 		self.vx = -maxvx
 		self.flipx = true
 		br=false 
 	elseif br then
 		self.vx = maxvx
 		self.flipx = false
 	end
 	
 	self.x += self.vx
 	
 	self.vy+= self.grav
 	
 	if (self.vy>self.maxvy) self.vy=self.maxvy
 	
 	self.y += self.vy
 end,
 draw=function(self)
 	spr(self.s,
 	self.x-self.w/2,
 	self.y-self.h/2,
 	self.w/8,
 	self.h/8,
 	self.flipx,
 	false
 	)
 end,
 }
 return a
end

function _init()
	local p1=mkactor(64,64,false,1,1,0.15,2,0)
	add(actors,p1)
end

function _update()
	for a in all(actors) do
		a:update()
	end
end

function _draw()
	cls()
	map(0,0,0,0,128,128)
	for a in all(actors) do
		a:draw()
	end
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000ff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000fff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000880000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000ff0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000fff000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000cc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000cc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000cc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000cc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
55555555500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__gff__
0000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
2020202020202020202020202020202000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
2020202020202020202020202020202000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000