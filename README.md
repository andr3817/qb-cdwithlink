Just a simple music item creator that adds meta data in form of youtube link and song name and artist
You can use the item in your inventory and it will copy the youtube link you put in when you create the item

This works with ox inventory and qbcore

To install this follow these steps

This is only needed if you use qbcore

1. add This to your qb-inventory/html/js/app.js

```
    } else if (itemData.name == "musicdisc") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html(
                "<p><strong>Link: </strong><span>" +
                itemData.info.link +
                "</span></p><p><strong>Musician: </strong><span>" +
                itemData.info.artist +
                "</span></p><p><strong>Song name: </strong><span>" +
                itemData.info.songname +
                "</span></p><p><strong>Serial: </strong><span>" +
                itemData.info.serial +
                "</span></p>"
            );
```

Example picture:

![Screenshot_3](https://user-images.githubusercontent.com/53046930/226807029-6476a6e8-45a0-4ea0-ac01-246d8b7ba80f.png)           
            
2. add this to your qb-core/shared/items.lua
```
['musicdisc'] 			 	 = {['name'] = 'musicdisc', 			  		['label'] = 'Music Disc', 			['weight'] = 0, 		['type'] = 'item', 		['image'] = 'musicdisc.png', 	['unique'] = true, 	['useable'] = true, 	['shouldClose'] = true,	   ['combinable'] = nil,   ['description'] = 'Just a music disc'},
```

3. take the picture that is in the repo called musicdisc.png and put that into your qb-inventory/html/images or if you in the case of using ox_inventory put it in the ox_inventory/web/images

4. put the resource into your [qb] folder and youre good to go

5. Function of the script


***The function of the resource is very basic, when you have the cd in your inventory you can copy the link that the cd has in the metadata from creating the cd.
When using the cd the link will be copied to your clipboard for you to play in a dj stand or a car radio of some sort***

