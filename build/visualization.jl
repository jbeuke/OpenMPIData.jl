export showMIPs,showSlices


function showMIPs(c::Array; fignum=1, filename=nothing)
  cAbs = abs.(c)
  cxy = maximum(cAbs,3)[:,:,1]
  cxz = maximum(cAbs,2)[:,1,:]
  cyz = maximum(cAbs,1)[1,:,:]

  figure(fignum, figsize=(4,4))
  
  subplot(2,2,1)
  imshow(cxz', interpolation="nearest")
  title("MIP xz")
  subplot(2,2,2)
  imshow(cyz', interpolation="nearest")
  title("MIP yz")
  subplot(2,2,4)
  imshow(cxy, interpolation="nearest")
  title("MIP xy")

  subplots_adjust(wspace=0.18,hspace=0.3,left=0.06,bottom=0.06,right=1.0,top=0.95)

  if filename != nothing
    savefig(filename)
  end
end
function showSlices(c::Array,slice; fignum=1, filename=nothing)
  cAbs = abs.(c)
  x=slice[1]
  y=slice[2]
  z=slice[3]

  cxy = cAbs[:,:,z]
  cxz = cAbs[:,y,:]
  cyz = cAbs[x,:,:]

  figure(fignum, figsize=(4,4))
  
  subplot(2,2,1)
  imshow(cxz', interpolation="nearest")
  title("Slice at y=$y xz")
  subplot(2,2,2)
  imshow(cyz', interpolation="nearest")
  title("Slice at x=$x yz")
  subplot(2,2,4)
  imshow(cxy, interpolation="nearest")
  title("Slice at z=$z xy")

  subplots_adjust(wspace=0.18,hspace=0.3,left=0.06,bottom=0.06,right=1.0,top=0.95)

  if filename != nothing
    savefig(filename)
  end
end
