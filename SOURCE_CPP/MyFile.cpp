#include <iostream>
#include <fstream>
#pragma region

using std::cin;
using std::cout;

#if not defined(DEBUG_GFS)
#define DEBUG_GFS

#include <SFML/Graphics.hpp>
#include <SFML/Audio.hpp>
#include <SFML/System.hpp>
#include <SFML/Window.hpp>
// #include <gtk-4.0/gtk/gtk.h>

#include <pthread.h>
#include <string>
#include <math.h>

namespace MatthewsNamespace {
    class MyWindow {
        private:
        sf::RenderWindow* MyWindowVar;
        sf::Thread* MyWindowThread;

        public:
        MyWindow(size_t WWidth, size_t WHeight, std::string WTitle){
            MyWindowVar = new sf::RenderWindow(sf::VideoMode(600, 800), L"MyWindow");
            MyWindowThread = new sf::Thread(&MyWindow::MAIN_WINDOW_THREAD, this);
        }
        void MAIN_WINDOW_THREAD();
        void DRAW_FUNCTION();
        ~MyWindow(){
            std::free(MyWindowVar);
        }

    };
    // Function definitions for class
    void MyWindow::MAIN_WINDOW_THREAD(){
        while(MyWindow::MyWindowVar->isOpen()){
            sf::Event EVNT;
            while(MyWindowVar->pollEvent(EVNT)){
                if(EVNT.type == EVNT.Closed){
                    MyWindowVar->close();
                }
            }
            MyWindowVar->clear(sf::Color::Blue);
        }
    }
}

int main(){

    // MatthewsNamespace::MyWindow(600, 800, "THIS IS SPARTAA!!");

	// For learning purposes only

	sf::Window window(sf::VideoMode(800, 600), "My window");

    	// run the program as long as the window is open
    	while (window.isOpen())
    	{
        		// check all the window's events that were triggered since the last iteration of the loop
        		sf::Event event;
        		while (window.pollEvent(event))
        		{
        		    // "close requested" event: we close the window
          			  if (event.type == sf::Event::Closed)
               				 window.close();
		}
   	}
  

    /*
    sf::Sound mySound;
    sf::SoundBuffer* MyBuffer = new sf::SoundBuffer();
    if(MyBuffer->loadFromFile("../RESOURCES/DONDIABLO.wav")){
        mySound.setBuffer(*MyBuffer);

        mySound.setLoop(true);
        mySound.play();

    }else{
        std::cout<<"Music file not found or could not be loaded to RAM";

    }
   
    return 0;
    */
    printf("Press any key to continue...");
    std::cin.get();
}

#endif
#pragma endregion
