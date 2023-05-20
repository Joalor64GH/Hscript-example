// imports
import('Paths');
import('flixel.FlxG');
import('flixel.FlxSprite');

// variable(s)
var sprite:FlxSprite;

// new function
function new() {}

// create function
function create() {
    sprite = new FlxSprite().loadGraphic(Paths.image('image'));
}

// update function
function update(elapsed) {}