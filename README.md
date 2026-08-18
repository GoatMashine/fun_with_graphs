# fun_with_graphs
I am playing around with some graphs and such



## Graph Homomorphisms
This is the first part of this repo. I wanted to implement my own little Julia code that can count how many Homomorphisms there are between two graphs.
This will be done in stages. So far I have built a baseline implementation that just bruteforces all possible mappings between two graphs and checks if 
the mapping is indeed a homomorphism. The next stage will be reading up on the theory and improving this to run faster since the current runtime is 
pretty bad. The baseline will be usefull since I know that it produces the correct number of homomorphisms for every two graphs. I can use it later to 
compare future iterations of my code and test if they are indeed correct.