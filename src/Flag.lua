Flag = Class{__includes = GameObject}


function Flag:init(def)
    GameObject.init(self, def)
    self.color = math.random(3)
    self.animation = Animation {
        frames = {1,2},
        interval = 0.2
    }
end

function Flag:update(dt)
    self.animation:update(dt)
end

function Flag:collides(target)
    return not (target.x > self.x + self.width or self.x > target.x + target.width or
            target.y > self.y + self.height or self.y > target.y + target.height)
end

function Flag:render()
    love.graphics.draw(gTextures['flags'], gFrames['flags'][self.animation:getCurrentFrame() + (self.color - 1)*3],
        math.floor(self.x) + 16, math.floor(self.y) + 8, 0, self.direction == 'right' and 1 or -1, 1, 8, 8)
end