# nft-metaverse-market
![meta-market-low](https://user-images.githubusercontent.com/104182252/183294676-c8bf5065-0f62-435a-a224-c8ae182a820d.gif)

## Introduction
This native iOS/Mac allows metaverse and game builders to offer an open and decentralized marketplace of 3D model NFTs so that users can try out and purchase. 
Why native? Building native apps allows for a better user experience and gives more control for developers over system resources and OS specific apis. This is very important for gaming applications.
However, web3 and native apps do not work well. Infrastructure to connect and interact with the blockchain when doing mobile apps is lacking and UX is poor. This also results on very few native projects being built. Zora api is a great tool to bridge that gap, as it gives tools to query and access the blockchain without the need of directly connecting to it. 
The intention of this project is also to offer other native devs code and tools to deploy their own Zora powered marketplaces on their native apps, to encourage native buidling. Web3 needs more native experiences to gain mainstream adoption

All the native code is in the sandbox folder

### Features
* Query Eth blockchain for NFTs with 3D files
* Load Unity Scenes 
* Render 3D models from NFTs with SceneKit

## Installation
This project uses XCode for the Swift app and Unity to set up the gaming project.
The unity project contains just a scene and is intended just to be a placeholder to try the marketplace. 
The native code developerd is inside the sandbox fodler

### Architecture
All iOS/Mac code is developed in Swift using SwiftUI and UIKit. There are 3 layers to the app. The Unity layer that displays the game, a SceneKit layer to display the 3D rendered models and a SwiftUI layer with the marketplace code

### Package Dependencies
To get ful details on how to integrate a Unity project into XCode follow these instructions:
https://github.com/DavidPeicho/unity-swiftui-example

* GLTFSceneKit -> https://github.com/magicien/GLTFSceneKit
iOS SceneKit does not support natively loading GLB files, so GLTFSceneKit package was included to render the GLB files retrieved from the NFTs.


* APOLLO: For communication with ZORA GraphQL api, Apollo client was used
Instalation instructions (XCode):
https://www.apollographql.com/docs/ios/installation

### Metadata
Metadata for NFTs is still being standarized for different types of media files. Specifically for 3D model files, there is no standard defined. This makes it very difficult to parse this data and also query for this type of files. For this app I followed the Manifold metadata standard structure for GLB files.
Here you can see an example:



<img width="772" alt="Screen Shot 2022-08-07 at 11 25 10" src="https://user-images.githubusercontent.com/104182252/183295710-5f21ad81-d13f-4a1f-aa50-85728bcb8fab.png">
