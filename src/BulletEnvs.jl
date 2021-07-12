module BulletEnvs

import Bullet as b

const assets_dir = joinpath(@__DIR__, "..", "deps", "assets")

function testing()
    sm = b.connect(kind=:gui)
    
    b.set_gravity(sm, [0,0,-10])
    b.load_urdf(sm, joinpath(assets_dir, "plane.xml"))
    b.load_mjcf(sm, joinpath(assets_dir, "ant.xml"))

    for i in 1:1000000
        b.step_simulation(sm)
        # Bullet.Raw.b3InitStepSimulationCommand(sm)
    end
    b.disconnect()
    println("done")

end

end  # BulletEnvs
