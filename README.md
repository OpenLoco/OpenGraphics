# OpenLoco/OpenGraphics

**OpenGraphics** is a project established to replace the base graphics of Locomotion. The aim is to create a set of freely-useable graphics that can be used with [OpenLoco](https://github.com/OpenLoco/OpenLoco). This will help OpenLoco to be more accessible, as well as make it easier to add new features and content to the game.

This repo is based on https://github.com/OpenRCT2/OpenGraphics.

## Progress

The current progress list can be found [here](https://docs.google.com/spreadsheets/d/1Ar3_4SczzcS0fGtym5jfffUg8hnTzr-LwasNGV0AVbA/edit?usp=sharing).

Our current focus is on the following object categories:
- Vehicles

Current blockers
- Blender plugin/workflow

## Getting Started

For most object types the most accurate and quickest way to create sprites is using the [OpenLoco Graphics Helper add-on for Blender 2.79](https://github.com/OpenLoco/Blender-Loco-Graphics). The plugin is forked from [RCT Graphics Helper](https://github.com/oli414/Blender-RCT-Graphics) and there is useful information still in their wiki [RCT Graphics Helper Wiki](https://github.com/oli414/Blender-RCT-Graphics/wiki) that applies for Locomotion as well.

Blender Render, last available in [Blender 2.79](https://www.blender.org/download/previous-versions/), is the most accurate render engine (for its time) that we have access to as an open source project.
You can use other software to create your models as well, as long as your main source file that you contribute to the project is a a Blender (.blend) file.
Of course, if someone is able to set up a modern Blender render pipeline in Blender 4+ and get reasonable sprite output, this would be hugely appreciated as working on old tools always has drawbacks.

## Requirements

- All assets required to create the final sprite graphics need to be included in this repository. For 3D-rendered vehicles, this includes models, textures, UV maps, etc. If you are hand-painting the pixelart, for example for a building, then you would upload just the PNG files.
- Do not copy real life products (including companies, vehicles, buildings, etc). Look at how other games parody real life for inspiration; Planet Coaster and OpenTTD are good examples of what is accepted.
- AI-generated content of any kind is not allowed (textures, models, names, etc).
- Overall object
  - Needs to maintain the same image size size and rough visual features as the original Locomotion objects.
  - Do not make a 1-1 recreation of the vanilla object. We want to be able to use both vanilla and OG versions of an object together in the same game, and be visually distinct enmough to tell them apart.
  - Do not make a 1-1 recreation of a real-world train. We want to completely avoid copyright/trademake infringement s o exercising creative freedom is good here.
  - Visual fidelity should remain the same as vanilla.
  - Colour palette should remain the same as vanilla.
  - The stats may change but may be identical or similar.
  - Filename should be `OG_<originalname>.dat`, for example `4F.dat` becomes `OG_4F.dat`.
  - Internal DAT name should be prefixed with `OG`.
    - Remove the last 1-2 characters if the name is already 7 or 8 characters, eg `LIVESTCK` -> `OGLIVEST`.
    - Remove another character if a number is needed to disambiguate. For example `BLDALP1`, `BLDALP2`, etc all the way to `BLDALP11` will all map to `OGBLDALP` by default. These should become `OGBLDAL1`, ..., `OGBLDA11`, etc.
- 3D Models
  - Models should be made from scratch, or, if you have an existing model that you personally created from scratch, you can use that.
  - While we're still deciding on file formats, OBJ or glTF files are probably best for now.
  - Scale is *roughly* 10m per 1 in-game tile *for ground vehicles* (buses, trucks, trains, trams). You should be able to fit four(4) 10x2.5m buses in a single tile. This is a *rough* guide as there is no single true scale. Ships and aircraft have a different scale in the base game (check out the A380!) and no rough scale has been assigned to these yet.
  - One model per file.
- Textures 
  - Only use textures you have created yourself from scratch, or otherwise use public domain textures, such as from [CG Bookcase](https://www.cgbookcase.com/textures).
  - Save textures as PNG, and limit its size (1k should be plenty in most cases).
- Names
  -  New. See [OpenTTD's new vehicle names](https://wiki.openttd.org/en/Manual/Trains) as a reference.
  -  Not the same as existing base-game names, for example we cannot call an object `114` since that exists in the base game.
  -  Not the same as real-life vehicles, for example you can't make a truck called `Cybertruck`.
  -  Parody names should be fine. For example we can't use "Class 55 Deltic" but you could call it the "Epsilic".
  -  Names of files should not contain any unrelated text, for example `train-body-v3_texture.png` should just be `train-body.png.`

Note: many of these requirements are to avoid potential legal issues. If you are a copyright lawyer and can provide further advice, please get in touch with us!

### Vehicles

The plugin should be able to handle most vehicle related sprite creation that is required for the project. The exception is cargo sprites which some vehicle use. We are still working on improving how to handle them. Further work is required for the plugin to handle Vehicle meta data generation (e.g. bogie location, exahust location).

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
