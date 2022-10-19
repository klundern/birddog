# BirdDog
#### A Game About a Dog chasing Birds (and other creatures)
---
Ever since I started my GD50: Introduction to Game Development class, I've wanted to design my own game from scratch. After completing the first few projects, I am now confident in my skills and ability to do just that. Drawing on inspiration from GD50, games such as _Jetpack Joyride_, and my dog, Kenzie, I am proud to introduce my first independent gaming project: BirdDog!

BirdDog is a game designed in the classic side-scroller fashion about catching birds while simultaneously dodging not-so-fun creatures (i.e., cats and porcupines). It will be written in Lua utilizing the LOVE2D framework. I will be taking heavy inspiration from GD50, utilizing several programs from that class as a template for this game.

As I am also a full time student, I have no timeframe for when this project will be completed. I am also still working on finshing GD50, so I will be trying to balance this passion project with projects from that course.

If you have any suggestions or comments, feel free to reach out! This project is purely for fun, and I hope you enjoy playing it as much as I enjoy designing it.

### Current Version: 0.4.0
<img width="1392" alt="Screenshot 2022-10-19 at 10 20 16 AM" src="https://user-images.githubusercontent.com/66793403/196718027-7021e84c-a8e3-4c51-b669-ac30498f748d.png">

* TitleScreenState, PlayState, RulesState exist and can be transitioned into
* Random procedural generation of animals that scroll across screen; may tweak in the future
* Scoring implemented for birds but no GameOver state when colliding with cats (game continues endlessly)

## Future Milestones

### 0.5.0 - GameOverState, HighScoreState
* Go to GameOver state if collided with a cat
* GameOverState exists and can be transitioned into
* HighScoreState exists and can be transitioned into; can input score if it is in the top 5 high scores
* **Bonus**: Gameplay can be paused

### 0.6.0 - EntityStates
* Animals (birds, cat) have various states that they transition between: idle, flying/chasing
* States are automatically triggered when player BirdDog gets close enough (birds fly, cats chase)


### Future Ideas:
* Procedural generation of 'field' upon which BirdDog and other animals appear
* Animals are hidden in bushes and will 'flee' the bush when the BirdDog gets close enough
* Puddles and other obstacles that Player must dodge; BirdDog can 'run ahead' on-screen up to a point
* Powerups and other bonuses that may be collected

---
### Attributions
* **CS50: Introduction to Game Development:** Inspiration for game, as well as blueprint for many of the game's mechanics.
* **Artwork**: [BlueCarrot16](https://opengameart.org/users/bluecarrot16)

