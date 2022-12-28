2. Requirements and Goals of the System
We’ll focus on the following set of requirements while designing the Instagram:




User
Post(Image/Video)




Functional Requirements
1. Users should be able to upload/download/view photos.
2. Users can perform searches based on photo/video titles.
3. Users can follow other users.
4. The system should be able to generate and display a user’s News Feed consisting of top photos
from all the people the user follows.

 

Non-functional Requirements
1. Our service needs to be highly available.
2. The acceptable latency of the system is 200ms for News Feed generation.
3. Consistency can take a hit (in the interest of availability), if a user doesn’t see a photo for a
while; it should be fine.
4. The system should be highly reliable; any uploaded photo or video should never be lost.
Not in scope: Adding tags to photos, searching photos on tags, commenting on photos, tagging users to photos, who to follow, etc.