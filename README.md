
# OpenLoco/OpenGraphics

**OpenGraphics** is a project established to replace the base graphics of Locomotion. The aim is to create a set of freely-useable graphics that can be used with [OpenLoco](https://github.com/OpenLoco/OpenLoco). This will help OpenLoco to be more accessible, as well as make it easier to add new features and content to the game.

This repo is based on https://github.com/OpenRCT2/OpenGraphics.

## Progress

The current progress list can be found [here](https://docs.google.com/spreadsheets/d/1Ar3_4SczzcS0fGtym5jfffUg8hnTzr-LwasNGV0AVbA/edit?usp=sharing).

## Project Structure

While initially we started with a 1-1 recreation of all 545 vanilla assets, we quickly realised that issues of game balance and lack of vehicles in certain regions were something we could fix in-line. As such, we've moved to a "pack"-backed structure based on in-game regions. Each sub-folder in `/objects` is thus a self-contained folder or pack of objects based on a particular region. `NorthAmericanExpansion` is an example of this. Currently the `VanillaReplacements` folder is for existing completed work in vanilla recreation that has yet to be reorganised into either a specific pack folder or moved into the `Common` folder, which is for region-independent objects so they can be reused between packs.

## Getting Started

For most object types the most accurate and quickest way to create sprites is using the [OpenLoco Graphics Helper add-on for Blender 2.79](https://github.com/OpenLoco/Blender-Loco-Graphics). The plugin is forked from [RCT Graphics Helper](https://github.com/oli414/Blender-RCT-Graphics) and there is useful information still in their wiki [RCT Graphics Helper Wiki](https://github.com/oli414/Blender-RCT-Graphics/wiki) that applies for Locomotion as well.

Blender Render, last available in [Blender 2.79](https://www.blender.org/download/previous-versions/), is the most accurate render engine (for its time) that we have access to as an open source project.
You can use other software to create your models as well, as long as your main source file that you contribute to the project is a a Blender (.blend) file.
Of course, if someone is able to set up a modern Blender render pipeline in Blender 4+ and get reasonable sprite output, this would be hugely appreciated as working on old tools always has drawbacks.

## Requirements

### General

- We need new assests distinct from vanilla and from real-life. We should be able to say "this object **looks like it was based on** X" or "this object **has elements from** X and from Y", NOT "this object **is** X".
- All assets required to create the final sprite graphics need to be included in this repository. For 3D-rendered vehicles, this includes models, textures, UV maps, etc. If you are hand-painting the pixelart, for example for a building, then you would upload just the PNG files.
- Do not copy real life products (including companies, vehicles, buildings, etc). Look at how other games parody real life for inspiration; Planet Coaster and OpenTTD are good examples of what is accepted.
- AI-generated content of any kind is not allowed (textures, models, names, etc).
- Needs to maintain the same rough visual features as the original Locomotion objects, as well as being roughly the same size.
  - Do not make a 1-1 recreation of the vanilla object. We want to be able to use both vanilla and OG versions of an object together in the same game, and be visually distinct enough to tell them apart.
  - Do not make a 1-1 recreation of a real-world train, bus, truck, or any other object. We want to completely avoid copyright/trademake infringement issues so exercising creative freedom is good here.

### Object

  - Visual fidelity should remain the same as vanilla.
  - Colour palette should remain the same as vanilla.
  - The stats may change but may be identical or similar.
  - Filename should be `OG_<originalname>.dat`, for example `4F.dat` becomes `OG_4F.dat`.
  - Internal DAT name should be prefixed with `OG`.
    - Remove the last 1-2 characters if the name is already 7 or 8 characters, eg `LIVESTCK` -> `OGLIVEST`.
    - Remove another character if a number is needed to disambiguate. For example `BLDALP1`, `BLDALP2`, etc all the way to `BLDALP11` will all map to `OGBLDALP` by default. These should become `OGBLDAL1`, ..., `OGBLDA11`, etc.

### 3D Models

- Models should be made from scratch, or, if you have an existing model that you personally created from scratch, you can use that.
 - While we're still deciding on file formats; OBJ or glTF files are probably best for now.
  - Scale is *roughly* 10m per 1 in-game tile *for ground vehicles* (buses, trucks, trains, trams). You should be able to fit four(4) 10x2.5m buses in a single tile. This is a *rough* guide as there is no single true scale. Ships and aircraft have a different scale in the base game (check out the A380!) and no rough scale has been assigned to these yet.
  - One model per file.

### Textures 

  - Only use textures you have created yourself from scratch, or otherwise use public domain textures, such as from [CG Bookcase](https://www.cgbookcase.com/textures).
  - Save textures as PNG, and limit its size (1k should be plenty in most cases).
  - Commonly/repeatedly-used textures go in the top-level `/textures` folder in this repository.

### Names 
  
  -  New. See [OpenTTD's new vehicle names](https://wiki.openttd.org/en/Manual/Trains) as a reference.
  -  Not the same as existing base-game names, for example we cannot call an object `114` since that exists in the base game.
  -  Not the same as real-life vehicles, for example you can't make a truck called `Cybertruck`.
  -  Parody names should be fine. For example we can't use "Class 55 Deltic" but you could call it the "Epsilic".
  -  Names of files should not contain any unrelated text, for example `train-body-v3_texture.png` should just be `train-body.png`.

### Vehicles

### Train sprite scaling

In order to maintain consistency within a given region's vehicle set, train sprites will be scaled based off of the height of their side view sprites used in vehicle lists. Every region and track gauge within that region will have a defined height scale, in pixels. 

- Accessories like smokestacks, domes, A/C units, and pantographs being allowed to rise above this limit.
- Esoteric and very specific designs are allowed to exceed this limit.


| Region  | Height (pixels) | Examples of vehicles exceeding limits |
|--|--|--|
| North America | 20-22 | Challenger, Big Boy. |
| Europe (Standard) | 18-22 | Superheavy steam locomotives.  |
| Europe (Narrow) | 15-18 | - |
| - | - | - |
| Iberia | 19-21 |  |
| Ireland | 18-22 |  |
| Russia | 20-22 |  |
| Oceania (Standard) | 19-21 |  |
| Oceania (Narrow) | 16-19 |  |
| Japan(Standard) | 18-20 |  |
| Japan (Narrow) | 16-19 |  |

#### Further notes

- Any region not mentioned above should be discussed with the community, but a safe rule of thumb (for the four most common track gauges around the world) is for metre gauge to be 15-18 px tall, cape gauge to be 16-19 px tall, standard gauge is 18-20 px tall, and broad gauge is 19-21 px tall, with the same aforementioned exceptions for accessories and esoteric designs. If the vehicle is not designed for any of these track gauges, discuss it with the community to establish one. 
 - Passenger carriages and freight wagons should ideally top out at 1 pixel shorter than their contemporary locomotives for their region and track gauge, with the obvious exception of flatbeds. Dedicated carriages (e.g. Electra-Star Passenger cars) can be the same height as their locomotive, if so desired.
- Locomotive length will not have a concrete pixel limit, due to multiple elements counting towards the total length of the vehicle, but individual elements for a locomotive should ideally have a half-length of 128 or less. 
- Locomotive width will not have a concrete limit either, however a good rule of thumb is to not exceed more than 16 px wide. Generally, the height of the locomotive and the track gauge informs the width of the vehicle, if the vehicle author wants to keep proportions looking realistic.
- Trains should never exceed the width or height of the tunnel sprites their respective track types use. 

### Legal

Many of these requirements are to avoid potential legal issues. We don't even want to waste time *thinking* of whether it might be ok to copy an IRL vehicle, use a name, take a 3d model from another game, etc. It is not worth it. Be creative in your object creation instead!

If you are a copyright/trademark lawyer and can provide further advice, please get in touch with us!

## Community

You can get in touch with us via the OpenLoco Discord server. There is a dedicated OpenGraphics channel that can be used to discuss this sub-project.
- Invitation link: https://discord.gg/Td2GPYqzpv
- [![](https://img.shields.io/discord/689445672390361176?label=OpenLoco%2Fgraphics)](https://discordapp.com/channels/689445672390361176/1276903199885758535),

## How to Contribute (for non-technical users)

You will need a GitHub account to contribute to the repository in any manner. Please make one first if you haven't already.

### GitHub Desktop

1. Install GitHub Desktop.
2. Fork OpenLoco/OpenGraphics to make a personal repository.

![image](https://github.com/user-attachments/assets/6631275e-e7e7-444a-9850-fdd997adb5e8)

3. Clone your personal repository.

![image](https://github.com/user-attachments/assets/6ed7c863-d6f1-48d6-948e-a1fd5dc1b746)

4. Make a new branch.

  ![image](https://github.com/user-attachments/assets/2f834142-16c4-4de6-9684-b810207d070f)
  
5. Make your changes. They'll show up in GitHub Desktop.

  ![image](https://github.com/user-attachments/assets/1d0a8137-ea09-4232-88a2-615226cc55c4)
  
6. Add/commit your changes.

  ![image](https://github.com/user-attachments/assets/8c08bf07-14ef-42b1-a2fb-bcae4421f96c)
  
7. Publish your branch.

  ![image](https://github.com/user-attachments/assets/9b60eaa0-8d2a-419a-8e16-7cfa222c86ad)
  
8. Open a pull request with OpenLoco/OpenGraphics.

  ![image](https://github.com/user-attachments/assets/bad84247-b9db-4dd2-a7b8-ec5c7f3b4c43)

9. It should look something like this in GitHub (online):

![image](https://github.com/user-attachments/assets/8a6d03d5-f11c-48a3-ae84-6e429423372c)

  
10. Someone will review the pull request.
11. If it passes review, it will be merged and you're done. If it doesn't you'll have to fix your changes, which is just repeating steps 5-7.

## License

**OpenGraphics** is licensed under the MIT license.
