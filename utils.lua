local utils = {};
utils.is_alive = function(model)
    assert(typeof(model) == "Instance", ("expected %s got %s"):format("Instance", typeof(model)));
    if not model then return false; end;
    if not model:FindFirstChildOfClass("Humanoid") then return false; end;
    
    local humanoid = model:FindFirstChildOfClass("Humanoid");
    return humanoid.Health > 0;
end;

utils.is_visible = function(part, ignore_list)
    assert(typeof(part) == "Instance", ("expected %s got %s"):format("Instance", typeof(part)));
    assert(typeof(ignore_list) == "table", ("expected %s got %s"):format("table", typeof(ignore_list)));

    local current_camera = workspace.CurrentCamera;
    return #current_camera:GetPartsObscuringTarget({part.Position}, ignore_list or {}) == 0;
end;

return utils;
