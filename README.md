# graphics
The main shader I created is the "Bump" shader, which includes the ability to add a metallic texture, as well as a bump map on the object.
The area where the texture is darkest will also have less of a metallic sheen, making it more realistic as metal (especially a battle worn ship)
wouldn't be perfectly clean and reflective. The texture I utilized can be found at this link 
https://www.vecteezy.com/photo/10760371-bump-map-painted-metal-texture-bump-mapping
The model is a model from our upcoming GDW game, which I created myself in place of a ship. Sadly, I don't have the time currently to model a ship.

![image](https://user-images.githubusercontent.com/98484257/218813692-16c6be22-2ba3-4e56-89f3-4dd945cb0798.png)

This is the code I created, it works by defining both a metallic function as well as the ability to add a texture and a bump map. These traits can all be adjusted in
unity itself using sliders as shown below. You are also given the ability to add a cube map for more realistic reflections in the world space. 

![image](https://user-images.githubusercontent.com/98484257/218814135-98d551c9-9d90-4a41-9d13-d69a0501cec5.png)

This works by taking the standard lighting model, and adding a bump map on top of it. By putting the bump map overtop of the given effect, it changes the 'shininess' 
of the metallic surface depending on the texture used for the bump map. This doubles as a bumpy texture as well as creating a scuffed look in whichever area your texture
is darkest, creating a realistic worn and weathered effect. 

as for the force field itself, it works by utilizing the standard transparency effect as well as emission that we went over in class. It works by taking the emission
(outer rim highlight) and making that coloured area opaque depending on how intense the colour is. Anywhere where the colour is not present will instead be transparent.
This effect also has an added, subtle textured effect that changes the intensity depending on the texture applied. I applied the bump map texture to the object to 
mirror the grooves of the bump map itself, giving the illusion of following its grooves and details. 

![image](https://user-images.githubusercontent.com/98484257/218815249-f3bbcfd2-3558-4305-8ffe-da0d160e2dca.png)

As for the way its applied, it's a copy of the object made slightly larger and set as a child. This means that if the object were to move or animate, it would mirror 
its exact movements giving the effect of a forcefield around the object. 

My project is organized as such: 
![image](https://user-images.githubusercontent.com/98484257/218815645-e60a3421-d4ce-4860-8eba-b1199b16b306.png)

Shaders can be found in the shaders file 
![image](https://user-images.githubusercontent.com/98484257/218815727-239e97a9-03c3-4b24-a368-5144b81a6a00.png)

in scene objects as well as added textures can be found in the objects file 
![image](https://user-images.githubusercontent.com/98484257/218815884-1450aa7b-9258-42c3-b036-181981cacfb0.png)

and materials used in scene can be found in the materials file 
![image](https://user-images.githubusercontent.com/98484257/218816006-ad3e5d6f-9503-42ab-a562-e8657745f8c4.png)

Hope you have a great rest of your day!
