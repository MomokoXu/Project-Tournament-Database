
# Swiss Tournament Planner


## Introduction
This project aims to implement a game tournament planner which uses the Swiss system for pairing up players in each round. Players are not eliminated, and each player is paired with another player with the same number of wins, or as close as possible.
Python is the main development language used to create module that uses PostrgreSQL database to kepp track of players and matches in a game tournament. [More Information](https://docs.google.com/document/d/16IgOm4XprTaKxAa8w02y028oBECOoB1EI1ReddADEeY/pub?embedded=true)


## Prerequisites and Installation
### Prerequisites
1. [Git](https://git-scm.com/doc)
2. [VirtualBox](https://classroom.udacity.com/nanodegrees/nd004/parts/af045689-1d81-46e7-8a3b-ad05de1142ce/modules/353202897075460/lessons/3423258756/concepts/14c72fe3-e3fe-4959-9c4b-467cf5b7c3a0): You do not need the extension pack or the SDK. You do not need to launch VirtualBox after installing it; Vagrant will do that.
3. [Vagrant](https://www.vagrantup.com/):  Install the version for your operating system.

---

### Installation steps
1. Open your terminal:
    * Mac or Linux system: regular terminal program will do just fine.
    * Windows: use the Git Bash terminal that comes with the Git software, if you don't have Git installed, download Git from the link above.
2.  Install VirtualBox
3.  Install Vagrant
4.  Clone the VM configuration:
    * Change to the desired directory for you to run this project
        *  eg. Run: `cd ~/Desktop`
    * Run: `git clone  https://github.com/udacity/fullstack-nanodegree-vm. fullstack` in your terminal
5.  Clone this project:
    * Change to *vagrant* folder:
        * Run: `cd fullstack/vagrant/`
    * Clone this project:
        * Run: `git clone https://github.com/MomokoXu/Project-Tournament-Database.git tournament`
6. Start the virtual machine:
    * Run: `vagrant up`

---

### How to use it
1. Log into the VM:
    * Run:  `vagrant ssh`
2. Change directory for the files of this project:
    * Run: `cd /vagrant/tournament/project/tournament`
3. Create the tournament database:
    * Run: `psql -f tournament.sql`
4. Test the whole application using Udacity test style:
    * Run: `python tournament_test.py`
5. Test the database and application as you like:
    1. Enter Python:
    	* run: `python`
    2. Import application in python:
    	* run: `import tournament`
    3. Test individual function as you like:
    	* eg. run: `tournament.registerPlayer('Momoko')`
6. To clear the database, you can run step 3 or manually call functions deletePlayers() and deleteMatches().



## Functions in ```tournament.py```
> (From Udacity project Description)
* registerPlayer(name):
    * Adds a player to the tournament by putting an entry in the database. The database should assign an ID number to the player. Different players may have the same names but will receive different ID numbers.
    * Example:
        ```python
       >>> tournament.registerPlayer("momoko")
       Player: momoko has been added!
       >>> tournament.registerPlayer("Cherry")
        Player: Cherry has been added!
        >>> tournament.registerPlayer("Kitten")
        Player: Kitten has been added!
        >>> tournament.registerPlayer("Puppy")
        Player: Puppy has been added!
        ```

* countPlayers():
    * Returns the number of currently registered players. This function should not use the Python len() function; it should have the database count the players.
    * Example:
        ```python
        >>> tournament.countPlayers()
        There are 4 players now.
        ```

* reportMatch(winner, loser):
    * Stores the outcome of a single match between two players in the database.
    * Example:
        ```python
        >>> tournament.reportMatch(1, 2)
        Match has been recorded.
        >>> tournament.reportMatch(3, 4)
        Match has been recorded.
        ```

* playerStandings():
    * Returns a list of (id, name, wins, matches) for each player, sorted by the number of wins each player has.
    * Example:
        ```python
        >>> tournament.playerStandings()
        [(1, 'Momoko', 1L, 1L), (3, 'Kitten', 1L, 1L),
        (2, 'Cherry', 0L, 1L), (4, 'Puppy', 0L, 1L)]
        ```

* swissPairings():
    * Given the existing set of registered players and the matches they have played, generates and returns a list of pairings according to the Swiss system. Each pairing is a tuple (id1, name1, id2, name2), giving the ID and name of the paired players. For instance, if there are eight registered players, this function should return four pairings. This function should use playerStandings to find the ranking of players
    * Example:
        ```python
        >>> tournament.swissPairings()
        [(1, 'Momoko', 3, 'Kitten'), (2, 'Cherry', 4, 'Puppy')]
        ```

* deleteMatches():
    * Clear out all the match records from the database.
    * Example:
        ```python
        >>> tournament.deleteMatches()
        All matches have been deleted!
        ```

* deletePlayers():
    * Clear out all the player records from the database.
    * Example:
        ```python
        >>> tournament.deletePlayers()
        All players have been removed!
        ```

## Future work
This project currently only supports to plan single tournament, in the future it is supposed to be extended to support multiple tournaments.


## Author
[Yingtao Xu](https://github.com/MomokoXu)

## Copyright
This is a project for practicing skills in databses and backend courses not for any business use. Some templates and file description are used from [Udacity FSND program](https://www.udacity.com/course/full-stack-web-developer-nanodegree--nd004). Please contact me if you think it violates your rights.