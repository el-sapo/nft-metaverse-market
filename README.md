# nft-metaverse-market


## Features
* Query Eth blockchain for NFTs with 3D files
* Load Unity Scenes 
* Render 3D models from NFTs with SceneKit


## Package Dependencies

GLTFSceneKit -> https://github.com/magicien/GLTFSceneKit

iOS SceneKit does not support natively loading GLB files, so GLTFSceneKit package was included to render the GLB files retrieved from the NFTs.


* GLTFSceneKit -> https://github.com/magicien/GLTFSceneKit


* APOLLO: For communication with ZORA GraphQL api, Apollo client was used

Instalation instructions (XCode):
1. File -> Add Packages -> https://github.com/apollographql/apollo-ios.git -> Select the apollo-ios package

If you want more details or other ways to add the client: 
https://www.apollographql.com/docs/ios/installation

2. Add a schema file to your target directory and .graphql query files
follow the instructions in
 https://www.apollographql.com/docs/ios/installation#4-create-graphql-files-for-your-graphql-operations

## Unity Integration set up
