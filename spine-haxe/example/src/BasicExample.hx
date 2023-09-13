import openfl.utils.Assets;
import spine.SkeletonBinary;
import spine.SkeletonData;
import spine.SkeletonJson;
import spine.animation.AnimationStateData;
import spine.atlas.TextureAtlas;
import spine.attachments.AtlasAttachmentLoader;
import spine.starling.SkeletonSprite;
import starling.core.Starling;

class BasicExample extends Scene {
	var loadBinary = true;

	public function load():Void {
		var atlas = TextureAtlas.fromAssets("assets/raptor.atlas");
		var skeletondata = SkeletonData.fromAssets("assets/raptor-pro" + (loadBinary ? ".skel" : ".json"), atlas);
		var animationStateData = new AnimationStateData(skeletondata);
		animationStateData.defaultMix = 0.25;

		var skeletonSprite = new SkeletonSprite(skeletondata, animationStateData);
		skeletonSprite.x = Starling.current.stage.stageWidth / 2;
		skeletonSprite.y = Starling.current.stage.stageHeight * 0.5;

		skeletonSprite.state.setAnimationByName(0, "walk", true);

		addChild(skeletonSprite);
		juggler.add(skeletonSprite);
	}
}
